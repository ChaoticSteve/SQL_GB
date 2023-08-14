-- Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE
drop table if exists orders;

create table orders (
	id int primary key,
    employee_id varchar(20),
    amount decimal(10, 2),
    order_status varchar(45)
);

insert into orders (id, employee_id, amount, order_status) values
	(1, 'e03', 15.00, 'OPEN'),
    (2, 'e01', 25.50, 'OPEN'),
    (3, 'e05', 100.75, 'CLOSED'),
    (4, 'e02', 22.18, 'OPEN'),
    (5, 'e04', 9.50, 'CANCELED');

select 
	id,
    employee_id,
    amount,
    order_status,
	case
		when order_status = 'CLOSED' then 'Полный'
        else 'Не полный'
	end as full_order_status
from orders;


/*Чем NULL отличается от 0?
NULL - отсутствие значения или значение неопределено
0 - это конкретное число, которое имеет значение 0
*/