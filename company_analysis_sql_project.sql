create database company_analysis;
use company_analysis;
create table departments(department_id int primary key,department_name varchar(50));
create table employees(employee_id int primary key,employee_name varchar(50),department_id int,salary decimal(10,2),hire_date date,foreign key(department_id)references departments(department_id));
create table sales(sale_id int primary key,employee_id int, sale_date date,amount decimal(10,2),foreign key(employee_id)references employees(employee_id));
insert into departments values
(1,'Sales'),
(2,'Marketing'),
(3,'HR'),
(4,'IT');
insert into employees values
(101,'Arun',1,50000,'2022-01-15'),
(102,'Meera',1,55000,'2021-03-10'),
(103,'Ravi',2,60000,'2020-07-22'),
(104,'Anjali',3,45000,'2023-02-01'),
(105,'Kiran',4,70000,'2019-11-18');
insert into sales values
(1,101,'2024-01-05',15000),
(2,101,'2024-01-12',20000),
(3,102,'2024-01-07',18000),
(4,103,'2024-01-15',22000),
(5,101,'2024-02-01',25000),
(6,102,'2024-02-03',30000),
(7,103,'2024-02-10',27000);
select employee_id,sum(amount) as total_sales from sales group by employee_id;
select e.employee_name,sum(s.amount) as total_sales from sales s join employees e on s. employee_id=e.employee_id group by e.employee_name;
select d. department_name,sum(s.amount)as total_sales from sales s join employees e on s.employee_id=e.employee_id join departments d on e.department_id =d.department_id group by d.department_name;
select e.employee_name,sum(s.amount)as total_sales from sales s join employees e on s.employee_id=e.employee_id group by e.employee_name order by total_sales desc limit 1;
select e.employee_name,sum(s.amount)as total_sales from sales s join employees e on s.employee_id=e.employee_id group by e.employee_name having total_sales > 50000;
select e.employee_name,sum(s.amount)as total_sales from sales s join employees e on s.employee_id=e.employee_id group by e.employee_name having total_sales =(select max(total_sum)from(select sum(amount)as total_sum from sales group by employee_id)as temp);
select e.employee_name,sum(s.amount)as total_sales,case when sum(s.amount)>=60000 then "Top Performer"
														when sum(s.amount) between 40000 and 59999 then "Average Performer"
                                                        else "low performer" end as performance from sales s join employees e on s.employee_id=e.employee_id group by employee_name;
                                                        
                                                        
                                                        
                                                        
                                                        