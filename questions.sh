#!/bin/bash

# May want to ask user name first
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