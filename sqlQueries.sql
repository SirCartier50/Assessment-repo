--This retrieves all posts made by a given user in this case some123
SELECT * FROM blogging.posts WHERE user_name = 'some123';

--This retrieves the total amount of comments from a post from a user
--in this case some123's first post
SELECT COUNT(*) AS comment_count FROM blogging.comments WHERE post_id = 1;