CREATE VIEW popular_articles AS
  SELECT authors.name,
    articles.title,
    count(log.path) AS count
   FROM articles
     JOIN authors ON authors.id = articles.author
     JOIN log ON log.path ~~ (('%'::text || articles.slug) || '%'::text)
  WHERE log.status = '200 OK'::text
  GROUP BY authors.name, articles.title
  ORDER BY (count(log.path)) DESC;

CREATE VIEW popular_authors AS
  SELECT authors.name,
    count(log.path) AS count
   FROM articles
     JOIN authors ON authors.id = articles.author
     JOIN log ON log.path ~~ (('%'::text || articles.slug) || '%'::text)
  WHERE log.status = '200 OK'::text
  GROUP BY authors.name
  ORDER BY (count(log.path)) DESC;

CREATE VIEW error_percentages AS
  SELECT log."time"::date AS "time",
    round(100.0 * sum(
        CASE log.status
            WHEN '404 NOT FOUND'::text THEN 1
            ELSE 0
        END)::numeric / count(log.status)::numeric, 2) AS percentage
   FROM log
  GROUP BY (log."time"::date)
  ORDER BY (round(100.0 * sum(
        CASE log.status
            WHEN '404 NOT FOUND'::text THEN 1
            ELSE 0
        END)::numeric / count(log.status)::numeric, 2)) DESC;
