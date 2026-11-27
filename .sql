-- 1. users: stores account info
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. posts: linked to users via user_id
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 3. comments: linked to both posts and users
CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER,
    user_id INTEGER,
    comment_text TEXT ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 4. likes: linked to both posts and users
CREATE TABLE likes (
    like_id SERIAL PRIMARY KEY,
    post_id INTEGER,
    user_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 1. Users 
INSERT INTO users (username, email, full_name, created_at) VALUES
('amina_k',  'amina.k@example.com',  'Amina Kamau',    '2026-10-01 09:00:00'),
('brian_o',  'brian.o@example.com',  'Brian Otieno',   '2026-10-02 10:15:00'),
('claire_w', 'claire.w@example.com', 'Claire Wanjiku', '2026-10-03 11:30:00'),
('david_m',  'david.m@example.com',  'David Mwangi',   '2026-10-04 14:20:00'),
('esther_n', 'esther.n@example.com', 'Esther Njeri',   '2026-10-05 16:45:00');
SELECT * FROM users;

-- 2. Posts
INSERT INTO posts (user_id, content, created_at) VALUES
(1, 'Good morning everyone! Excited to start learning PostgreSQL today.', '2026-10-06 08:00:00'),
(2, 'Just finished setting up my local development environment.',           '2026-10-06 10:30:00'),
(1, 'SQL JOINs make much more sense once you draw out the tables.',      '2026-10-07 12:00:00'),
(3, 'Sharing my notes on foreign keys and data integrity.',               '2026-10-08 09:15:00'),
(4, 'Weekend hike in the hills was refreshing!',                        '2026-10-09 15:00:00'),
(2, 'What is your favorite VS Code extension for SQL?',                  '2026-10-10 11:20:00'),
(3, 'Practicing GROUP BY and aggregate functions this afternoon.',        '2026-10-11 13:45:00'),
(5, 'Tip for beginners: test every query on a small sample first.',       '2026-10-12 17:10:00');
SELECT * FROM posts;
-- 3. Comments
INSERT INTO comments (post_id, user_id, comment_text, created_at) VALUES
(1, 2, 'Welcome to PostgreSQL! You are going to love it.',       '2026-10-06 08:30:00'),
(1, 3, 'Great start, Amina!',                                    '2026-10-06 09:05:00'),
(2, 1, 'Nice! Which OS are you using?',                          '2026-10-06 11:00:00'),
(3, 4, 'Drawing tables really helps visualize relationships.',       '2026-10-07 13:10:00'),
(4, 1, 'Thanks for sharing these notes!',                          '2026-10-08 10:00:00'),
(4, 2, 'Foreign keys save so much trouble later.',               '2026-10-08 10:40:00'),
(5, 3, 'Looks like great weather for a hike.',                   '2026-10-09 16:00:00'),
(6, 5, 'I like using the built-in terminal and table extensions.','2026-10-10 12:00:00'),
(7, 1, 'GROUP BY clicks once you see how rows get grouped.',     '2026-10-11 14:15:00'),
(8, 2, 'Solid advice for anyone learning SQL.',                  '2026-10-12 18:00:00');
SELECT * FROM users;

-- 3. Comments (10 comments across different posts and users)
INSERT INTO comments (post_id, user_id, comment_text, created_at) VALUES
(1, 2, 'Welcome to PostgreSQL! You are going to love it.',       '2026-10-06 08:30:00'),
(1, 3, 'Great start, Amina!',                                    '2026-10-06 09:05:00'),
(2, 1, 'Nice! Which OS are you using?',                          '2026-10-06 11:00:00'),
(3, 4, 'Drawing tables really helps visualize relationships.',       '2026-10-07 13:10:00'),
(4, 1, 'Thanks for sharing these notes!',                          '2026-10-08 10:00:00'),
(4, 2, 'Foreign keys save so much trouble later.',               '2026-10-08 10:40:00'),
(5, 3, 'Looks like great weather for a hike.',                   '2026-10-09 16:00:00'),
(6, 5, 'I like using the built-in terminal and table extensions.','2026-10-10 12:00:00'),
(7, 1, 'GROUP BY clicks once you see how rows get grouped.',     '2026-10-11 14:15:00'),
(8, 2, 'Solid advice for anyone learning SQL.',                  '2026-10-12 18:00:00');

-- 4. Likes
INSERT INTO likes (post_id, user_id, created_at) VALUES
(1, 2, '2026-10-06 08:15:00'),
(1, 3, '2026-10-06 08:45:00'),
(1, 4, '2026-10-06 09:20:00'),
(2, 1, '2026-10-06 10:50:00'),
(3, 2, '2026-10-07 12:30:00'),
(3, 3, '2026-10-07 13:00:00'),
(4, 1, '2026-10-08 09:40:00'),
(4, 4, '2026-10-08 11:10:00'),
(5, 2, '2026-10-09 15:30:00'),
(6, 3, '2026-10-10 11:45:00');
SELECT * FROM likes;



-- 1. Display all registered users.
SELECT * FROM users;

-- 2. Display all posts.
SELECT * FROM posts;

-- 3. Display all comments.
SELECT * FROM comments;

-- 4. Display all posts created by a particular user (e.g., user_id = 1).
SELECT * FROM posts WHERE user_id = 1;

-- 5. Display all users whose usernames start with the letter a.
SELECT * FROM users WHERE username ILIKE 'a%';

-- 6. Display posts created after a specific date.
SELECT * FROM posts WHERE created_at > '2026-10-08 00:00:00';

-- 7. Display all posts in descending order of creation date.
SELECT * FROM posts ORDER BY created_at DESC;

-- 8. Display the total number of registered users.
SELECT COUNT(*) AS total_users FROM users;

-- 9. Display the total number of posts.
SELECT COUNT(*) AS total_posts FROM posts;

-- 10. Display the total number of comments.
SELECT COUNT(*) AS total_comments FROM comments;-- ============================================================================

-- 1. Display each post alongside the username of the person who created it.
SELECT p.post_id, p.content, p.created_at, u.username
FROM posts p
JOIN users u ON p.user_id = u.user_id;

-- 2. Display each comment alongside the username of the person who wrote it.
SELECT c.comment_id, c.comment_text, u.username, c.created_at
FROM comments c
JOIN users u ON c.user_id = u.user_id;

-- 3. Display each comment alongside the post it belongs to.
SELECT c.comment_id, c.comment_text, p.post_id, p.content AS post_content
FROM comments c
JOIN posts p ON c.post_id = p.post_id;

-- 4. Display all posts alongside their comments, including posts that have no comments.
SELECT p.post_id, p.content AS post_content, c.comment_id, c.comment_text
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id;

-- 5. Display each post alongside the number of likes it has received.
SELECT p.post_id, p.content, COUNT(l.like_id) AS like_count
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.content;

-- 6. Display usernames alongside the posts they have created.
SELECT u.username, p.post_id, p.content, p.created_at
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id;

-- 1. Update a user's full name using their user ID.
UPDATE users
SET full_name = 'Amina Kamau Wanjiku'
WHERE user_id = 1;

-- 2. Change the content of an existing post.
UPDATE posts
SET content = 'Updated post: SQL JOINs and LEFT JOINs are super useful!'
WHERE post_id = 3;

-- 3. Delete a comment using its comment ID.
DELETE FROM comments
WHERE comment_id = 10;

-- 4. Delete a post using its post ID.

DELETE FROM comments
WHERE post_id = 8;

DELETE FROM likes
WHERE post_id = 8;

DELETE FROM posts
WHERE post_id = 8;


-- 1. Add a bio column to the users table.
ALTER TABLE users
ADD COLUMN bio TEXT;

-- 2. Add a profile_picture column to the users table.
ALTER TABLE users
ADD COLUMN profile_picture VARCHAR(255);

-- 3. Change the maximum length of the username column to 100 characters.
ALTER TABLE users
ALTER COLUMN username TYPE VARCHAR(100);

-- 4. Create an index on the posts table using the user_id column.
CREATE INDEX idx_posts_user_id ON posts(user_id);

SELECT * FROM users;

-- 1. Display the username of each user and the total number of posts they have created.
-- Include users who have not created any posts.
SELECT u.username, COUNT(p.post_id) AS total_posts
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
ORDER BY total_posts DESC;

-- 2. Display the five most liked posts, showing the post content, author's username and number of likes.
SELECT p.content, u.username AS author_username, COUNT(l.like_id) AS total_likes
FROM posts p
JOIN users u ON p.user_id = u.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.content, u.username
ORDER BY total_likes DESC
LIMIT 5;

-- 3. Find users who have never created a post.
SELECT u.user_id, u.username, u.full_name
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
WHERE p.post_id IS NULL;

-- 4. Display the username, post content and comment text for all posts that have received comments.
SELECT u.username, p.content AS post_content, c.comment_text
FROM comments c
JOIN posts p ON c.post_id = p.post_id
JOIN users u ON c.user_id = u.user_id;



