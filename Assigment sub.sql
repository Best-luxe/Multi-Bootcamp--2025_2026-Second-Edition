CREATE TABLE employees (
    emp_id      SERIAL PRIMARY KEY,
    full_name   VARCHAR(80)  NOT NULL,
    department  VARCHAR(40)  NOT NULL,
    role        VARCHAR(40)  NOT NULL,
    city        VARCHAR(40)  NOT NULL,
    salary      NUMERIC(12,2) NOT NULL,
    bonus       NUMERIC(12,2),            -- nullable: not everyone earns a bonus
    hire_date   DATE         NOT NULL,
    manager_id  INTEGER REFERENCES employees(emp_id)  -- self reference; NULL = top manager
);

INSERT INTO employees (full_name, department, role, city, salary, bonus, hire_date, manager_id) VALUES
('Adaeze Okafor',    'Management', 'CEO',              'Lagos',         1500000, 500000, '2018-01-10', NULL),
('Emeka Nwosu',      'Engineering','Engineering Lead', 'Port Harcourt',  950000, 200000, '2019-03-15', 1),
('Fatima Bello',     'Sales',      'Sales Lead',       'Abuja',          900000, 250000, '2019-06-01', 1),
('Ngozi Okeke',      'Marketing',  'Marketing Lead',   'Lagos',          870000, 180000, '2020-02-20', 1),
('Chinedu Eze',      'Engineering','Backend Dev',      'Port Harcourt',  620000,  80000, '2021-04-12', 2),
('Blessing Johnson', 'Engineering','Frontend Dev',     'Port Harcourt',  590000,  NULL,  '2021-07-30', 2),
('Yusuf Ibrahim',    'Engineering','Backend Dev',      'Kano',           640000,  90000, '2020-11-05', 2),
('Tunde Adeyemi',    'Sales',      'Sales Rep',        'Abuja',          420000,  60000, '2022-01-18', 3),
('Halima Suleiman',  'Sales',      'Sales Rep',        'Abuja',          410000,  NULL,  '2022-03-22', 3),
('Kelechi Amadi',    'Sales',      'Sales Rep',        'Port Harcourt',  450000,  75000, '2021-09-09', 3),
('Funmilayo Adebayo','Marketing',  'Content Strategist','Lagos',         480000,  40000, '2022-05-14', 4),
('Victor Obi',       'Marketing',  'SEO Specialist',   'Enugu',          460000,  NULL,  '2023-02-01', 4),
('Grace Effiong',    'Engineering','QA Engineer',      'Port Harcourt',  520000,  50000, '2023-06-19', 2),
('Sadiq Mohammed',   'Sales',      'Sales Rep',        'Kano',           400000,  55000, '2023-08-25', 3),
('Aisha Garba',      'Marketing',  'Designer',         'Abuja',          470000,  NULL,  '2024-01-30', 4),
('Daniel Okonkwo',   'Engineering','Intern',           'Enugu',          250000,  NULL,  '2024-07-15', 2);

 select * from employees

 -- List all employees who earn more than the average salary of the whole company.
 
 select * 
 from employees 
 where salary>(select avg(salary)from employees);

-- Find all employees in the same department as the employee named 'Chinedu Eze'.

select 
* from employees
where department=(select department from employees
where full_name ='Chinedu Eze');
-- select full_name from employees

-- Show the employee(s) with the highest salary.
select
* from employees
where salary=(select max(salary)from employees);

-- Show the employee(s) with the lowest salary.
select
* from employees
where salary=(select min(salary)from employees);

-- List employees whose salary is below the average salary of the whole company.
 
 select * 
 from employees 
 where salary<(select avg(salary)from employees);

 -- List all employees who earn more than the average salary within their own department.
 select
 * from employees e
 where salary>(select avg(salary)from employees
 where department=e.department);

 -- Find every employee who earns more than the employee 'Grace Effiong'.
select 
* from employees
where salary>(select salary from employees
where full_name='Grace Effiong');

-- List employees whose salary is greater than every Sales department salary
select 
* from employees
where salary >all(select salary from employees
where department='sales');

-- List employees whose salary is greater than at least one Engineering salary.
select
* from employees
where salary>any(select salary from employees
where department='Engineering');

-- Show employees who earn more than their own manager.
select e. emp_id ,
       e.Full_Name,
	   e.Salary,
	   m.Full_Name AS ManagerName,
	   m.Salary As ManagerSalary
FROM Employees e
JOIN Employees m
ON e.Salary > m.Salary;

-- List employees who do NOT manage anyone (no one reports to them).
select 
* from employees
where emp_id not in (select manager_id from employees
where manager_id is not null);

-- List employees who manage at least one other employee.
-- using IN
select 
 * from employees
 where emp_id in (select manager_id from employees
where manager_id is not null);

-- using EXISTS
select 
* from employees e
where exists (select 1 from employees m
where m.manager_id =e.emp_id);

-- Find employees hired before the employee 'Kelechi Amadi'.
select emp_id,full_name,hire_date
from employees
where hire_date<(select hire_date from employees
where full_name='Kelechi Amadi');

-- List employees whose salary equals the highest salary in their department.
select emp_id,full_name,department,salary
from employees e
where salary=
(select  MAX(salary) from employees 
where department=e.department)

order by department,full_name;

-- Show employees who earn more than the average bonus of all employees who actually receive a bonus.
select emp_id,full_name,bonus 
from employees e
where salary>(select avg(bonus)from employees
where bonus>0 and bonus is not null);

-- List the department(s) — show one employee per such department is fine 
-- — where the average salary is above the company-wide average salary.

select department 
from employees
group by department
having avg (salary) >
(select avg(salary)
from employees);

-- Find employees who earn more than the average salary of the 'Engineering' department.
select  emp_id,full_name,department from employees e
where salary>(select avg(salary)from employees
where department='Engineering');

-- List employees whose salary is within the top earner's
-- salary minus 200000 (i.e., salary >= max_salary - 200000).
select emp_id,full_name,salary
from employees
where salary>=(select max (salary)-200000
from employees)

order by salary desc;


-- Using a subquery in the FROM clause (a derived table),
-- list only the employees from a subquery of Engineering staff who earn above 500000.
select emp_id,full_name,e.salary
from(select emp_id,full_name,salary,department from employees
where department='Engineering') AS e
where e.salary > 500000;

-- Find the employee who has the second-highest salary in the company.
select distinct salary
from employees
order by salary desc
limit 1 offset 1;
