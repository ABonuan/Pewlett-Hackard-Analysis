# Pewlett-Hackard-Analysis
Build an employee database with SQL by applying data modeling, engineering, and analysis skills to generate a list of employees who are eligible for retirement packages.

## Overview
Pewlett-Hackard has been around for quite some time, and it has thousands of employees who will be retiring soon.  The objective of this analysis is to determine how many of those employees there are, and what kind of positions, or roles, they will be leaving.  PH also wants to develop a Mentorship Program for those who are starting to reach retirement age.  These employees will start mentoring new hires.  This will enable the company to better prepare for the future. 

## Results
From the tables created for this analysis, the following are the findings:
- Out of the 300K+ employees at Pewlet-Hackard, there are 90K+ who have the age to to retire.  That is roughly 30% of the total number of employees.
- Most of the positions that could potentially be vacated are higher level individual contributor roles.  The two roles that would have the most vacancies are in the Senior Engineer and Senior Staff roles.
- The tables are only based on the people who were born from 1952 t0 1955.  The tables do not take into consideration when they were hired, or if they are still working at the company.
- There are about 1550 employees who are not quite at retirement age, that can start mentoring new hires.  This allows experienced employees to pass down their knowledge before reaching retirement.

## Summary
I would re-create the 3 tables, retirement_titles, unique_titles and retiring_titles to take in consideration, not just birth_dates, but also when the employees were hired & if they are still employed at the company.  The queries and tables are named retirement_titles2, unique_titles2 and retiring_titles2.  After running these queries, there are more than 33,000 roles that could potentially be vacated.  This means expanding the criteria of the Mentorship Program would be recommended.

A query and table that shows people who are eligible for retirement per department will also be helpful for each team to be prepared.  This is seen in the query / table named retirees_with_department.  From here, we can query how many positions will possibly be vacated for each department, as shown below.
![alt text](https://github.com/ABonuan/Pewlett-Hackard-Analysis/blob/main/NumberOfRetireesPerDept.png?raw=True)