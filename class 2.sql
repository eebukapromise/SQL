use employees;
SELECT 
    *
FROM
    employees;

SELECT 
    first_name
FROM
    employees;

SELECT 
    first_name, last_name
FROM
    employees;

#where....
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'james';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'chirstian';
SELECT 
    *
FROM
    employees
WHERE
    gender = 'f';

#OR......
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'chirstian'
        OR first_name = 'Elvis';

#extract using the or lastname =koblick or firstname = elvis

select * from employees where last_name = "koblick" or first_name = "Elvis";

#And...

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'mary' AND gender = 'f';

#using the where, or, and together

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis'
        AND (gender = 'm' OR 'f');

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis'
        OR 'mary' AND (gender = 'm' OR 'f');

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis'
        AND (gender = 'm' OR hire_date = '1994-02-07');

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('kellie' , 'dennis', 'mark', 'paul');
    
    #LIKE / NOT LIKE OPERATORS (e.g ar%, %ar, %ar%, the percentage sign is used for pattern matching of sequence).....
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'ja%';

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE 'ja%';

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE '%ck%'
        OR last_name LIKE '%ck%';

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'ja%'
        OR last_name LIKE '%ar';
        
        #between and not between function....
        SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01'
ORDER BY hire_date ASC;
    
    SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01'
ORDER BY hire_date DESC;
        
        #Salaries
        SELECT 
    *
FROM
    salaries;
    SELECT 
    *
FROM
    salaries
WHERE
    salary IS NULL;
    SELECT 
    *
FROM
    salaries
WHERE
    salary IS NOT NULL;
    #comparative operators (=, >, <, >=, <=, !=)
    
    
    SELECT 
    *
FROM
    salaries
WHERE
    salary != '7000';
    SELECT 
    *
FROM
    salaries
WHERE
    salary >= '30000';
    
    SELECT 
    *
FROM
    salaries
WHERE
    from_date > '1990-01-01';
    SELECT 
    *
FROM
    salaries
WHERE
    to_date < '1995-01-01';
    
    #select distinct
    
    SELECT DISTINCT
    first_name
FROM
    employees;
    
    SELECT DISTINCT
    salary
FROM
    salaries
ORDER BY salary DESC;

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '60000' AND '100000';
    
    #Aggregate function
    
    SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
    SELECT 
    COUNT(DISTINCT title)
FROM
    titles;
    
select distinct title from titles;

select count(dept_no) from dept_manager;

select * from dept_manager;

select count(salary) from salaries where salary >= "10000";

select count(hire_date) from employees where hire_date = "1995-01-01";

select count(salary) from salaries where salary != "10000";

select count(from_date) from titles where from_date < "1990-01-01";

select * from departments order by dept_no desc;

#Group by
select title from titles;
select title from titles group by title;

select first_name, count(
first_name) from employees group by first_name order by first_name desc;

#Alayses
select first_name, count(first_name) as EBUKA from employees where gender = "M" group by first_name order by first_name;

#COUNT
select count(*) from salaries;

select sum(salary) from salaries;
select max(salary) from salaries;

#JOINT
select * from departments_dup;

select * from dept_manager_dup;

create table dept_manager_dup(
emp_no int (11) not null,
dept_no char (4) null,
from_date date not null,
to_date date null
);

insert into dept_manager_dup (emp_no, from_date)
values (999904, "2017-01-01"),
(999905, "2017-01-01"),
(999906, "2017-01-01"),
(999907, "2017-01-01");

select * from dept_manager_dup;

create table departments_dup(
dept_no int (5) not null,
dept_name varchar (15) null
);

select * from departments_dup
order by dept_no;

#extract from the employees table, first name, last name, gender and join the salaries table extracting only the salary of each employee. 
select
e.emp_no, e.first_name, e.last_name, e.gender, s.salary
from
employees e 
join
salaries s ON e.emp_no = s.emp_no;



#JOINTS

select
e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from
employees e 
join
dept_manager m on e.emp_no = m.emp_no;


select
m.dept_no, m.emp_no, m.from_date, d.dept_name
from
dept_manager_dup m
inner join
departments d on m.dept_no = d.dept_no;

#using where and join
select e.emp_no, e.first_name, e.last_name, s.salary
from employees e 
join
salaries s on e.emp_no = s.emp_no
where salary > 145000
order by first_name;


select
e.emp_no, e.first_name, e.last_name, s.salary, e.gender
from
employees e 
join 
salaries s ON e.emp_no = s.emp_no
where
birth_date = "1953-09-02"
order by first_name;


select year(d.from_date) as calender_year, e.gender, count(d.emp_no) as num_of_employees
from employees e join
dept_emp d on d.emp_no = e.emp_no
group by calender_year, e.gender
having calender_year >=1980
order by calender_year;

#select first_name, last_name, hire_date, job_title, of all employees whose first name is "margareta" and have last_name as "markovitch"
select
e.first_name, e.last_name, e.hire_date, t.title
from
employees e join
titles t on t.emp_no = e.emp_no
having e.first_name = "margareta" or e.last_name = "markovitch"
order by hire_date;  

#CROSS JOIN

select dm.*, d.*
from dept_manager dm
cross join 
departments d 
order by dm.emp_no, d.dept_no;

select
ep.*, d.*
from
employees ep 
cross join 
departments d 
order by ep.first_name, d.dept_no;

select e.gender, avg(s.salary)
from employees e 
join 
salaries s on e.emp_no = s.emp_no
group by e.gender;

select (e.first_name), count(s.salary)
from employees e 
join
salaries s on e.emp_no = s.emp_no 
group by e.first_name
order by first_name;

select e.emp_no, e.first_name, e.last_name, m.from_date, d.dept_name
from employees e 
join
dept_manager m on e.emp_no = m.emp_no
join departments d on d.dept_no = m.dept_no;

SELECT 
    d.dept_name, AVG(s.salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY dept_name
HAVING AVG(salary) > 60000
ORDER BY d.dept_no;




            







