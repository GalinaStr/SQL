1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null


create table employees5(id serial primary key,employee_name varchar(50) not null);


2.Наполнить таблицу employee 70 строками

insert into employees5(employee_name) values('Petrov_1'),('Petrov_2'),('Petrov_3'),('Petrov_4'),('Petrov_5'),('Petrov_6'),('Petrov_7'),('Petrov_8'),('Petrov_9'),('Petrov_10'),('Petrov_11'),('Petrov_12'),('Petrov_13'),('Petrov_14'),('Petrov_15'),('Petrov_16'),('Petrov_17'),('Petrov_18'),('Petrov_19'),('Petrov_20'),('Petrov_21'),('Petrov_22'),('Petrov_23'),('Petrov_24'),('Petrov_25'),('Petrov_26'),('Petrov_27'),('Petrov_28'),('Petrov_29'),('Petrov_30'),('Petrov_31'),('Petrov_32'),('Petrov_33'),('Petrov_34'),('Petrov_35'),('Petrov_36'),('Petrov_37'),('Petrov_38'),('Petrov_39'),('Petrov_40'),('Petrov_41'),('Petrov_42'),('Petrov_43'),('Petrov_44'),('Petrov_45'),('Petrov_46'),('Petrov_47'),('Petrov_48'),('Petrov_49'),('Petrov_50'),('Petrov_51'),('Petrov_52'),('Petrov_53'),('Petrov_54'),('Petrov_55'),('Petrov_56'),('Petrov_57'),('Petrov_58'),('Petrov_59'),('Petrov_60'),('Petrov_61'),('Petrov_62'),('Petrov_63'),('Petrov_64'),('Petrov_65'),('Petrov_66'),('Petrov_67'),('Petrov_68'),('Petrov_69'),('Petrov_70');
select*from employees1;

3.Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null

create table salary5(id serial primary key,monthly_salary int not null);
select*from salary5;

4.Наполнить таблицу salary 15 строками

insert into salary5(monthly_salary)values(1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400);
select*from salary5;

5.Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null

create table employee_salary5(id serial primary key,id_employees1 Int not null unique,id_salary1 Int not null);
select*from employee_salary5;

6.Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary5(id_employees1,id_salary1)values(40,2),(25,5),(44,6),(1,1),(2,3),(3,14),(8,14),(9,6),(16,13),(17,8),(18,11),(19,5),(39,2),(26,5),(37,6),(55,1),(56,3),(57,14),(58,14),(59,6),(60,7),(61,10),(62,12),(63,13),(64,8),(65,11),(66,5),(67,2),(68,5),(69,6),(105,1),(95,3),(90,14),(89,14),(96,6),(87,7),(101,10),(71,12),(88,13),(100,8);
select*from employee_salary5;

7.Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique

create table roles5(id serial primary key,role_name Int not null unique);

8.Поменять тип столба role_name с int на varchar(30)

alter table roles5
alter column role_name type varchar(31);
select*from roles5;

9.Наполнить таблицу roles 20 строками

insert into roles5(role_name)values('Junior Python developer'),('Middle Python developer'),('Senior Python developer'),('Junior Java developer'),('Middle Java developer'),('Senior Java developer'),('Junior JavaScript developer'),('Middle JavaScript developer'),('Senior JavaScript developer'),('Junior Manual QA engineer'),('Middle Manual QA engineer'),('Senior Manual QA engineer'),('Project Manager'),('Designer'),('HR'),('CEO'),('Sales manager'),('Junior Automation QA engineer'),('Middle Automation QA engineer'),('Senior Automation QA engineer');
select*from roles5;

10. Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_emploee5(id serial primary key,employee_id Int not null unique,role_id Int not null,FOREIGN KEY (employee_id) REFERENCES employees5(id),FOREIGN KEY (role_id) REFERENCES roles5(id));

11. Наполнить таблицу roles_employee 40 строками

insert into roles_emploee5(employee_id ,role_id)values(1,5),(2,20),(3,15),(4,1),(5,2),(6,3),(9,6),(45,14),(46,19),(57,17),(10,7),(11,8),(15,11),(17,11),(70,12),(67,13),(68,14),(33,4),(34,14),(40,13),(55,18),(56,9),(63,10),(65,11),(69,12),(24,16),(25,5),(26,6),(27,7),(28,8),(29,9),(30,10);
select*from roles_emploee5;

select  employee_name,role_name
from  employees5 inner join roles_emploee5 on employee_id=employees5.id inner join roles5 on role_id=roles5.id;
insert into roles_emploee5(employee_id ,role_id)values(48,5),(49,20),(50,15),(54,1),(51,2),(52,3),(59,6),(64,14),(62,19),(39,17),(32,7);

12. Показать всех работеиков и их должность

select  employee_name,role_name
from  employees5 inner join roles_emploee5 on employee_id=employees5.id inner join roles5 on role_id=roles5.id;

13. Показать данные, где role_name содержит слово developer

select  employee_name,role_name
from  employees5 inner join roles_emploee5 on employee_id=employees5.id inner join roles5 on role_id=roles5.id
where role_name like '%developer';

14. Вывести данне количество каждой должности занятой работниками организации

select  count(employee_name),role_name
from  employees5 inner join roles_emploee5 on employee_id=employees5.id inner join roles5 on role_id=roles5.id
group by role_name
order by count;
