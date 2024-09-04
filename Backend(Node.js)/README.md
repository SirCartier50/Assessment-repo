# Backend

## Frameworks and tools
Express.js and PostgreSQL

## Get Started
I used nodemon to restart the server anytime there's a change in the files. So to run it I used:

```bash
npm run devStart

server is live: http://localhost:8080
go to this url to access api: http://localhost:8080/data
```



## Task 4

### Summary
Created a server using Express.js on a node.js environment. I made GET, POST, and DELETE routes that handle the requests accordingly with a respective status code depending on the situation. They all edit on an object of user names, accepting json bodies and providing json responses. I had 200 for if everything went well, 201 for creating a new a new user, 400 for a bad request, and 404 if the user doesn't exist. They would also return a body describing the result of their request. I tested this using the Postman application that let me send api calls to the server and look at the responses that were being returned.

### Thoughts and Challenges
I didn't want the api endpoint for retreiving data to be on the main file so I use a router to link the main page to another page to modularize the code. When making the endpoints, I had an issue with how I was parsing the request and how I was return the response, specifically, with how I accessed users and add users because I was using their index as their key and the names as values. I solved this by iterating through the object's key array to use includes and findIndex to perform searches for checking if a name already exist and to delete the user.


## Task 5

### Summary
Made a middleware function that logs and monitors all requests. It provides the url and method of the requests to better show what type of requests came in and where to.

### Thoughts
I wanted to make sure that all requests from all routes in different js files would get logged so I added the middleware at the begining of the main file.

## Task 6

### Summary

Made an Api endpoint to perform CRUD operations to a PostgreSQL users database that I setup to test it. It uses GET, POST, PUT, and DELETE methods to implement this and creates a client to connect to the database. I used the Postman appilcation to send api calls to communicate with the database and test the functionality of the endpoint.

### Thoughts
I wanted to not only get all users from the database, but get a specific user by parsing the url to get an id to identify the user.
