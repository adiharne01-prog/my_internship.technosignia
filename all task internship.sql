create database company ;
use company;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
select * from Department ;

 INSERT INTO Department (dept_id,dept_name)
 VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing'),
(5,'Sales');


-- create 2nd table 

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male','Female','Other'),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    
    FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);

show tables ;

INSERT INTO Employee
(emp_id, emp_name, email, gender, salary, hire_date, dept_id)
VALUES
(101,'Aditya Harne','adityaharne45@gmail.com','Male',50000,'2025-12-10',1),
(102,'Rahul Sharma','rahulsharma@gmail.com','Male',65000,'2026-01-15',2),
(103,'Priya Patel','priyapatel@gmail.com','Female',70000,'2026-02-20',2),
(104,'Sneha Joshi','snehajoshi@gmail.com','Female',80000,'2026-03-25',3),
(105,'Amit Verma','amitverma@gmail.com','Male',55000,'2026-04-05',1),
(106,'Rohit Singh','rohitsingh@gmail.com','Male',90000,'2026-05-10',2),
(107,'Neha Gupta','nehagupta@gmail.com','Female',75000,'2026-06-01',3),
(108,'Karan Mehta','karanmehta@gmail.com','Male',60000,'2026-06-15',4),
(109,'Pooja Desai','pooja.desai@gmail.com','Female',85000,'2026-07-01',5),
(110,'Vikas Kumar','vikaskumar@gmail.com','Male',72000,'2026-07-10',5),
(111,'Anjali Mishra','anjalimishra@gmail.com','Female',68000,'2026-07-20',1),
(112,'Suresh Reddy','sureshreddy@gmail.com','Male',95000,'2026-08-01',2),
(113,'Kavita Nair','kavitanair@gmail.com','Female',78000,'2026-08-12',3),
(114,'Manoj Yadav','manojyadav@gmail.com','Male',62000,'2026-08-25',4),
(115,'Divya Iyer','divyaiyer@gmail.com','Female',88000,'2026-09-05',5),
(116,'Arjun Malhotra','arjun.malhotra@gmail.com','Male',73000,'2026-09-15',1),
(117,'Meera Kulkarni','meera.kulkarni@gmail.com','Female',81000,'2026-09-28',2),
(118,'Nitin Chawla','nitinchawla@gmail.com','Male',58000,'2026-10-10',3),
(119,'Riya Agarwal','riyagarwal@gmail.com','Female',92000,'2026-10-22',4),
(120,'Deepak Jain','deepakjain@gmail.com','Male',67000,'2026-11-05',5);

INSERT INTO Employee
VALUES
(121,'Rahul Sharma','rahul2@gmail.com','Male',65000,'2026-11-10',2);


select *  from employee ;

SELECT COUNT(*) FROM Employee;

--  Q 1 Top 5 highest salary employees

select * from employee 
order by salary desc
limit 5 ;


-- Q2    Department wise employee count

SELECT d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM Department d
INNER JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- Q3   Find Second highest salary

SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary <
(
    SELECT MAX(salary)
    FROM Employee
);

-- 4. Employees whose salary > department average salary

SELECT emp_name,
       salary,
       dept_id
FROM Employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);


-- 5. Inner Join-- 

SELECT e.emp_id,
       e.emp_name,
       d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;




-- 7. Group By with Having

SELECT dept_id,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY dept_id
HAVING COUNT(*) > 3;


-- 8. Employees hired in last 6 months
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 9. Find the Duplicates records

SELECT emp_name,
       COUNT(*) AS total_count
FROM Employee
GROUP BY emp_name
HAVING COUNT(*) > 1;



-- how to remove duplicate


DELETE e1
FROM Employee e1
JOIN Employee e2
ON e1.emp_name = e2.emp_name
AND e1.emp_id > e2.emp_id;
SET SQL_SAFE_UPDATES = 0;




