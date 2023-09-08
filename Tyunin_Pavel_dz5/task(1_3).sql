USE semimar_4;
/*. Создайте представление, в которое попадет информация о пользователях (имя, фамилия,
город и пол), которые не старше 20 лет.
*/
/*CREATE VIEW users_under_20 AS
SELECT
    u.firstname,
    u.lastname,
    p.hometown AS city,
    p.gender
FROM
    users AS u
JOIN
    profiles AS p ON u.id = p.user_id
WHERE
    TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) <= 20;*/

/*Найдите кол-во, отправленных сообщений каждым пользователем и выведите
ранжированный список пользователей, указав имя и фамилию пользователя, количество
отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным
количеством сообщений) . (используйте DENSE_RANK)
*/
/*SELECT
    u.firstname,
    u.lastname,
    COUNT(m.id) AS message_count,
    DENSE_RANK() OVER (ORDER BY COUNT(m.id) DESC) AS ranking
FROM
    users AS u
LEFT JOIN
    messages AS m ON u.id = m.from_user_id
GROUP BY
    u.id
ORDER BY
    ranking;
*/

/*Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления
(created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося
списка. (используйте LEAD или LAG)
*/
SELECT
    id,
    created_at,
    LEAD(created_at) OVER (ORDER BY created_at) AS next_message_created_at,
    TIMESTAMPDIFF(SECOND, created_at, LEAD(created_at) OVER (ORDER BY created_at)) AS time_diff_seconds
FROM
    messages
ORDER BY
    created_at;
