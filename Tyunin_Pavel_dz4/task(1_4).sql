use semimar_4;

/*Подсчитать общее количество лайков, которые получили пользователи
младше 12 лет.*/

/*select count(likes.id) as total_likes from likes
	join media on likes.media_id = media.id
    join profiles on likes.user_id = profiles.user_id
    where timestampdiff(year, profiles.birthday, curdate()) < 12;*/
    
/*Определить кто больше поставил лайков (всего): мужчины или
женщины.*/

/*select profiles.gender, sum(1) as total_likes from likes
	join profiles on likes.user_id = profiles.user_id
    group by profiles.gender;*/
    
-- Вывести всех пользователей, которые не отправляли сообщения.

/*select users.* from users
	left join messages on users.id = messages.to_user_id
    where messages.to_user_id is null;*/

/*Пусть задан некоторый пользователь. Из всех друзей
этого пользователя найдите человека, который больше всех написал
ему сообщений.*/

select 
	u.id as frend_id,
    u.firstname as friend_firtsname,
    u.lastname as friend_lastname,
    count(m.id) as message_count
from
	friend_requests as fr
join
	users as u on (fr.initiator_user_id = u.id OR fr.target_user_id = u.id)
left join
	messages as m on (m.from_user_id = u.id and m.to_user_id = 1)
where
	(fr.initiator_user_id = 1 OR fr.target_user_id = 1) and fr.status = 'approved'
group by u.id
order by message_count desc 
limit 1;


