-- Retirees per Title
SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
                    first_name,
                    last_name,
                    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Count of retiring titles
SELECT COUNT (title),
             title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC;

-- Create a mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Retirees per Title who are still employed
SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles2
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows using retirement_titles2 table
SELECT DISTINCT ON (emp_no) emp_no,
                    first_name,
                    last_name,
                    title
INTO unique_titles2
FROM retirement_titles2
ORDER BY emp_no, to_date DESC;

-- Count of retiring titles using unique_titles2
SELECT COUNT (title),
             title
INTO retiring_titles2
FROM unique_titles2
GROUP BY title
ORDER BY COUNT (title) DESC;

select * from unique_titles;

select * from by_dept;

-- Create a table for retirees with department
SELECT DISTINCT ON (ut2.emp_no) ut2.emp_no,
       ut2.first_name,
	   ut2.last_name,
	   ut2.title,
	   de.dept_no,
	   d.dept_name
INTO retirees_with_department
FROM unique_titles2 as ut2
INNER JOIN dept_emp as de
ON (ut2.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);

-- Find number of retirees per department
Select count (dept_no), dept_no,
              dept_name
from retirees_with_department
GROUP BY dept_no, dept_name
ORDER BY dept_no;