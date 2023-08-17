drop table if exists staff;

create table staff (
	id int primary key,
    firstname varchar(45),
    lastname varchar(45),
    post varchar(45),
    seniority int,
    salary int,
    age int
);

insert into staff (id, firstname, lastname, post, seniority, salary, age) values
	(1, 'Вася', 'Петров', 'Начальник', 40, 100000, 60),
    (2, 'Петр', 'Власов', 'Начальник', 8, 70000, 30),
    (3, 'Катя', 'Катина', 'Инженер', 2, 70000, 25),
    (4, 'Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    (5, 'Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    (6, 'Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
    (7, 'Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    (8, 'Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    (9, 'Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
    (10, 'Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    (11, 'Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
    (12, 'Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    
/*Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
возрастания*/
-- SELECT * FROM staff ORDER BY salary DESC;
-- SELECT * FROM staff ORDER BY salary ASC;

-- Выведите 5 максимальных заработных плат (saraly)
-- SELECT * FROM staff ORDER BY salary DESC LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
-- SELECT post, SUM(salary) as total_salary FROM staff GROUP BY post;

/*Найдите кол-во сотрудников с специальностью (post) « Рабочий» в возрасте от 24 до
49 лет включительно.*/
/*SELECT COUNT(*) as workers_count FROM staff 
	WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;*/

-- Найдите количество специальностей
-- SELECT COUNT(DISTINCT post) as posts_count FROM staff;\

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(age) as average_age FROM staff
	GROUP BY post
	HAVING AVG(age) < 30;

