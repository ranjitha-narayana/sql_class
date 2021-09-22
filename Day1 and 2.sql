--DAY 1 

--using select 

select * from std_table;
select id from std_table where id=22;
select name,id from std_table where marks<500;

--creating table dept1

create table dept1(id int not null,dept_name varchar(35) not null ,primary key(id));

-- deleting table dept1
drop table dept1;
select * from std_table;
-- using groupby

select name,sum(marks) from std_table group by name;

-- using having by 

select name,id ,sum(marks) from std_table group by name having sum(marks)>100;

-- using previously created table dept

use dept;
select s.id,d.dept_name from std_table s,dept d where d.dept_name='cs';
use std_table;

--deleting particular row 

delete from std_table where id=55;

--DAY 2

--Aggregation functions

select count(*) from std_table
select sum(marks) from std_table;

--executing subquery

select *from std_table where id in (select d.id from dept d where dept_name='cs');

-- altering table by adding new column city 

alter table dept add city varchar(23) default 'new york';

--deleting particular column using drop

alter table dept drop city;
select s.name,d.city,dept_name from std_table s left outer join dept d on s.id=d.id;

--creating table and inserting values--

create table sales(salesid int primary key,salesname varchar(24), address varchar(23))
insert into sales values(1,'abc','delhi'),(2,'def','mangalore'),(3,'ccc','udupi');
select * from sales;
create table orders(id int primary key,ordername varchar(25),orderid int,constraint fk_sales foreign key(orderid) references sales(salesid) on delete cascade on update cascade);
insert into orders values(2,'ppp',1),(3,'xxx',2),(5,'ooo',1);
select * from orders;

--join operatins--

select id,salesname,address,ordername from sales s,orders o where s.salesid=o.orderid;
select id,salesname,ordername from sales s inner join orders o on s.salesid=o.orderid;
select id,salesname,address from sales s left outer join orders o on s.salesid=o.orderid;
select id,salesname,address from sales s right outer join orders o on s.salesid=o.orderid;
select id,salesname,address,o.ordername from sales s join orders o on s.salesid=o.orderid;