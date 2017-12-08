# Log Analysis Project
### About
This project is a tool that reports on log information in a postgres database. It answers the following questions:

1. What are the most popular three articles of all time? Which articles have been accessed the most? 

2. Who are the most popular article authors of all time? That is, when you sum up all of the articles each author has written, which authors get the most page views? 

3. On which days did more than 1% of requests lead to errors? 

### Setup
This project requires
* Python 3
* Vagrant
* VirtualBox

1. Install the required software
2. Download the supporting files from the Udacity website
3. Clone this repository.

### Execution

1. To load the tables and data, cd into the working directory and use the command "psql -d news -f newsdata.sql".
2. To create the views that support the queries, use the command "psql -d news -f views.sql".
3. Execute the program by running "python log_analysis.py".
