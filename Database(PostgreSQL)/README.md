# Database

## Task 7

### Summary
The schema has a users, posts, and columns table. In the users table, it has an id column:placement in the table, a username, email, password, and created_at column:records the date and time that it was created. The posts table has an id column, a title column: title of the post, a context column: description of the post, a user_name column: name of the user which is referenced from the users table, created_at column, and the updated_at column:time and date the record was updated. The comments table has id column, a context column: description of the comment, a post_id column:references the id of the post from the posts table, a user_name column, created_at column, and the updated_at column.

### Thoughts and Challenges
When designing the schema, I wanted to make sure that the tables identified the user's information, user's posts info like the title and description, and the comments per posts like the comment text. The only challenge I had was trying to make the username unique which I solved by adding a constraint to the user_name column.

## Task 8

### Summary
The SQLQueries file contains two lines that retrieves all of a given user's posts and the number of comments that the user's specific post has.

### Thoughts and Challenges
I wanted to be able to figure out how to iterate throught the columns, which didn't work, so I thought to get id of the last comment of the post but realized that the incrementing id I used in the columns table wouldn't work because it accumulates for every row. I then realized that I could just use COUNT() with input as * to count all the rows that have the user_name of the user that made the post and solved the issue.
