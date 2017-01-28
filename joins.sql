--1
SELECT * FROM "users";

--2
SELECT * FROM "posts" WHERE "users_id" = 100;

--3
SELECT users.first_name, users.last_name, posts.*
FROM "users"
INNER JOIN "posts" on posts.users_id = users_id
WHERE users_id = 200;

--4
SELECT DISTINCT users.username, posts.*
FROM "users"
INNER JOIN "posts" on posts.users_id = users.id
WHERE first_name = 'Norene' and last_name = 'Schmitt';

--5
SELECT users.username
FROM "users"
INNER JOIN "posts" on posts.users_id = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';

--6
SELECT posts.title, posts.content, users.username
FROM "users"
INNER JOIN "posts" on posts.users_id = users.id
WHERE users.created_at < '2015-01-01 00:00:00-10';

--7
SELECT comments.*, posts.title AS "Post Title"
FROM "posts"
INNER JOIN "comments" on comments.posts_id = posts.id;

--8 
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM "posts"
INNER JOIN "comments" on comments.posts_id = posts.id
WHERE posts.created_at < '2015-01-01 00:00:00-10';

--9
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM "posts"
INNER JOIN "comments" on comments.posts_id = posts.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';

--10
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM "posts"
INNER JOIN "comments" on comments.posts_id = posts.id
WHERE comments.body LIKE '%USB%';

--11 (855)
SELECT posts.title AS "post_title", users.first_name, users.last_name, comments.body AS "comment_body"
FROM "users"
INNER JOIN "posts" on posts.users_id = users.id
INNER JOIN "comments" on comments.posts_id = posts.id
WHERE comments.body LIKE '%matrix%';

--12 (102)
SELECT users.first_name, users.last_name, comments.body AS "comment_body"
FROM "users"
INNER JOIN "posts" on posts.users_id = users.id
INNER JOIN "comments" on comments.posts_id = posts.id
WHERE comments.body LIKE '%SSL%' and posts.content LIKE '%dolorum%';


--13
SELECT users.first_name AS "post_author_first_name", users.last_name AS "post_author_last_name", posts.title AS "post_title", users.username AS "comment_author_username", comments.body AS "comment_body"
FROM "users"
INNER JOIN "posts" on posts.users_id = users.id
INNER JOIN "comments" on comments.posts_id = posts.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%')
AND posts.content LIKE '%nemo%'; 









