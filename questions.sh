#!/bin/bash

echo Hello, what is your github user name?
read ans1

echo What is the furthest distance you have travelled in km?
read ans2

echo What year did you graduate from highschool?
read ans3

echo Do you commute to campus?
read ans4

echo Have you learned anything in INLS161?
read ans5

DATE=`date`

ANSWERS="$ans1,$ans2,$ans3,$ans4,$ans5,$DATE"
echo $ANSWERS >> eureka.csv

mysql -u root -p << EOF
CREATE DATABASE IF NOT EXISTS questionnaire;
USE questionnaire;
CREATE TABLE IF NOT EXISTS questionnaire (Username VARCHAR(15), Distance DECIMAL(5,2), Year INT, Commute VARCHAR(3), Learned VARCHAR(3), Date VARCHAR(30), PRIMARY KEY (Date));
CREATE TEMPORARY TABLE temporary_table LIKE questionnaire;
LOAD DATA INFILE '/home/cabox/workspace/task-5-database-interface/eureka.csv' INTO TABLE temporary_table FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';
INSERT INTO questionnaire SELECT Username, Distance, Year, Commute, Learned, Date FROM temporary_table
EOF


