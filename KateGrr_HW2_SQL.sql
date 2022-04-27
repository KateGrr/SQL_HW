/*Таблица employees
Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
*/

create table employees(
    id serial primary key,
    employee_name varchar(50) not null
);

--Наполнить таблицу employee 70 строками.
/* Мой алгоритм (заполняем только один столбец, второй - serial): 
 * 1)Идем на любой сайт генерации данных (у меня randomus.ru)
 * 2)Генерируем нужное кол-во имен+фамилий (70)
 * 3)Copy/paste в файл excel в первый столбец
 * 4)Во втором столбце прописываем формулу: ="('"&A1&"'),"
 * 5)Протягиваем формулу вниз на все строки, получилось 70 формул с нужными значениями
 * 6)Copy/paste в SQL редактор, в конце ставим ; вместо ,
 * 7)Выполняем скрипт 
 * */

insert into employees(employee_name)
values ('Steve Davis'),
('John Freeman'),
('Douglas Shaw'),
('Jean Lewis'),
('Joe Johnson'),
('Judith Malone'),
('Karen Miller'),
('Walter Morgan'),
('Randall Mills'),
('Joseph Wilson'),
('Mary Johnson'),
('Claudia Lowe'),
('Elizabeth Wheeler'),
('Kevin Davis'),
('James Pittman'),
('Timothy Harris'),
('Dennis Caldwell'),
('Suzanne Coleman'),
('Nicholas Evans'),
('Charles Brewer'),
('Darren Moore'),
('Tom Soto'),
('Laurie Young'),
('Amanda Wilson'),
('Sarah Grant'),
('Shirley Dixon'),
('Robin Diaz'),
('Cheryl Carroll'),
('Bernice Nelson'),
('Albert Thomas'),
('Debra Jones'),
('Frank Boyd'),
('Ronald Anderson'),
('Mattie Henderson'),
('Everett Greer'),
('Fernando Howard'),
('Irma Love'),
('Renee Harmon'),
('Rosa Tran'),
('Jackie Goodwin'),
('Megan McCoy'),
('Vanessa Wise'),
('Andrew Cook'),
('Byron Figueroa'),
('Debra Garza'),
('Danielle Jackson'),
('Sylvia Schmidt'),
('Larry Torres'),
('Paul Kennedy'),
('Doris Wells'),
('Guy Henderson'),
('Sandra Schwartz'),
('Arthur Dixon'),
('Paul Davis'),
('Richard Robinson'),
('Sherri Woods'),
('Jacqueline Jordan'),
('Virginia Scott'),
('Minnie Robinson'),
('Rebecca Fields'),
('George Blake'),
('Carol Jordan'),
('Margaret Riley'),
('Warren Snyder'),
('Ryan Flores'),
('James Frazier'),
('Margaret James'),
('Mary Roberts'),
('Jacqueline Owens'),
('Paul Wagner');

select * from employees;

/* Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
*/

create table salary(
	id serial primary key,
	monthly_salary int not null
);

--Наполнить таблицу salary 15 строками:
insert into salary(monthly_salary)
values ('1000'),
('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500');

--проверка
select * from salary;

/*Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
*/
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null 
);

select * from employee_salary;

/*Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/
--Аналогичным с именами способом вставляю из Excel таблицы 30 рандомных значений (от 1 до 70) 
-- + 10 рандомных несуществующих (от 71 до 100)

insert into employee_salary
values (default, '13', '12'),
(default, '27', '8'),
(default, '49', '16'),
(default, '19', '2'),
(default, '52', '5'),
(default, '59', '14'),
(default, '9', '11'),
(default, '10', '4'),
(default, '88', '13'),
(default, '12', '12'),
(default, '73', '3'),
(default, '35', '6'),
(default, '94', '6'),
(default, '57', '11'),
(default, '40', '3'),
(default, '39', '10'),
(default, '30', '7'),
(default, '34', '13'),
(default, '38', '8'),
(default, '54', '14'),
(default, '31', '15'),
(default, '82', '15'),
(default, '70', '2'),
(default, '84', '16'),
(default, '83', '11'),
(default, '43', '14'),
(default, '67', '5'),
(default, '53', '15'),
(default, '65', '3'),
(default, '69', '5'),
(default, '79', '1'),
(default, '5', '4'),
(default, '8', '2'),
(default, '68', '1'),
(default, '18', '7'),
(default, '41', '7'),
(default, '85', '10'),
(default, '55', '9'),
(default, '99', '9'),
(default, '77', '7');


select * from employee_salary;

/*Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:
*/

create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;

alter table roles alter column role_name type varchar(30);

insert into roles
values (default, 'Junior Python developer'),
(default, 'Middle Python developer'),
(default, 'Senior Python developer'),
(default, 'Junior Java developer'),
(default, 'Middle Java developer'),
(default, 'Senior Java developer'),
(default, 'Junior JavaScript developer'),
(default, 'Middle JavaScript developer'),
(default, 'Senior JavaScript developer'),
(default, 'Junior Manual QA engineer'),
(default, 'Middle Manual QA engineer'),
(default, 'Senior Manual QA engineer'),
(default, 'Project Manager'),
(default, 'Designer'),
(default, 'HR'),
(default, 'CEO'),
(default, 'Sales manager'),
(default, 'Junior Automation QA engineer'),
(default, 'Middle Automation QA engineer'),
(default, 'Senior Automation QA engineer');

select * from roles;

/*Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
*/

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id) references employees (id),
	foreign key(role_id) references roles (id)
);

select * from roles_employee;

--Наполнить таблицу roles_employee 40 строками:

insert into roles_employee 
values (default, '53', '18'),
(default, '18', '7'),
(default, '68', '14'),
(default, '7', '19'),
(default, '14', '6'),
(default, '51', '6'),
(default, '19', '13'),
(default, '6', '16'),
(default, '26', '10'),
(default, '33', '16'),
(default, '36', '13'),
(default, '49', '17'),
(default, '30', '4'),
(default, '16', '9'),
(default, '45', '5'),
(default, '46', '19'),
(default, '13', '15'),
(default, '43', '11'),
(default, '59', '15'),
(default, '56', '14'),
(default, '17', '1'),
(default, '4', '3'),
(default, '29', '9'),
(default, '60', '20'),
(default, '67', '11'),
(default, '5', '2'),
(default, '39', '5'),
(default, '52', '12'),
(default, '35', '2'),
(default, '31', '18'),
(default, '15', '8'),
(default, '34', '10'),
(default, '47', '12'),
(default, '61', '20'),
(default, '48', '8'),
(default, '55', '17'),
(default, '1', '4'),
(default, '41', '7'),
(default, '3', '1'),
(default, '9', '3');


select * from roles_employee;
























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































 



select * from employees;
/*
 Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
 */