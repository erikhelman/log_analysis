#!/usr/bin/env python3
import psycopg2

# Connect to database and create cursor
conn = psycopg2.connect('dbname=news')
cur = conn.cursor()

# Run query to get most viewed articles
cur.execute('select * from popular_articles limit 3')
rows = cur.fetchall()

# Print query information to screen
print('Most Viewed Articles \n')
for r in rows:
    print(r[1] + ' - ' + str(r[2]) + ' views')

# Run query to get most viewed authors
cur.execute('select * from popular_authors')
rows = cur.fetchall()

# Print query information to screen
print('\nMost Popular Authors\n')
for r in rows:
    print(r[0] + ' - ' + str(r[1]) + ' views')

# Run query to get days when more than 1% of requests were errors
cur.execute('select * from error_percentages where percentage > 1')
rows = cur.fetchall()

# Print query information to screen
print('\nDates When Errors Exceed 1%\n')
for r in rows:
    print(str(r[0]) + ' - ' + str(r[1]) + '% errors')

