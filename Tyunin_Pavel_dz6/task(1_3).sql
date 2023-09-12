USE semimar_4;
/*Создайте таблицу users_old, аналогичную таблице users. 
Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
(использование транзакции с выбором commit или rollback — обязательно).*/

/*DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old AS SELECT * FROM users WHERE 1 = 0;
DELIMITER //
CREATE PROCEDURE moveUserToOld(IN user_id int)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка перемещения user в user_old';
	 END;
	START TRANSACTION;
    INSERT INTO users_old SELECT * FROM users WHERE id = user_id;
    DELETE FROM users WHERE id = user_id;
    COMMIT;
END //
DELIMITER ;users_old*/

/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в
зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать 
фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

/*DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello() RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE current_hour INT;
    DECLARE greeting VARCHAR(50);

    SET current_hour = HOUR(NOW());

    IF current_hour >= 6 AND current_hour < 12 THEN
        SET greeting = 'Доброе утро';
    ELSEIF current_hour >= 12 AND current_hour < 18 THEN
        SET greeting = 'Добрый день';
    ELSEIF current_hour >= 18 AND current_hour < 24 THEN
        SET greeting = 'Добрый вечер';
    ELSE
        SET greeting = 'Доброй ночи';
    END IF;

    RETURN greeting;
END //
DELIMITER ;*/

/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах 
users, communities и messages в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа.*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    record_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=ARCHIVE;

DELIMITER //
CREATE TRIGGER users_after_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, record_id)
    VALUES ('users', NEW.id);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER communities_after_insert
AFTER INSERT ON communities
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, record_id)
    VALUES ('communities', NEW.id);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER messages_after_insert
AFTER INSERT ON messages
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, record_id)
    VALUES ('messages', NEW.id);
END;
//
DELIMITER ;
