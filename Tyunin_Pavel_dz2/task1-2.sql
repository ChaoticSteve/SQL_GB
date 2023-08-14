-- Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE
drop table if exists sales;

create table sales (
	id int primary key,
    order_date date,
    count_product int
);

insert into sales(id, order_date, count_product) values
	(1, '2022-01-01', 156),
    (2, '2022-01-02', 180),
    (3, '2022-01-03', 21),
    (4, '2022-01-04', 124),
    (5, '2022-01-05', 341);
-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
select
	if (count_product < 100, 'Меньше 100',
		if (count_product between 100 and 300, '100-300', 'Больше 300')) as sales_group,
    count(*) as amount_sales
from sales
group by sales_group
order by amount_sales
