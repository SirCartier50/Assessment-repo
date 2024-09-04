# Frontend

## Frameworks and tools
Next.js
Material-UI (React UI framework)
Json server

## Getting Started

To run the development server for the Next.js app:

```bash
npm run dev


Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

To run the Json server:

```bash
json-server --watch app/database/db.json --port 8000
Open [http://localhost:8000](http://localhost:8000) with your browser.



## Task 1

### Summary
For the first task I made a todo list component that takes in input from a textfield, using a button, and adds a clickable checkbox with the task right after it.

### Thoughts and challenges
when designing the component I wanted to make a list of tasks that gave a feature to show that the task was done so I went with a checkbox that can be clicked to do just that. I had a little trouble with keeping the list in the middle and aligned in a column so I u

## Task 2 & 3

### Summary

For the second and third tasks I made a Next.js app that starts off at a homepage with buttons that navigates to an about page, users page, and a page that uses the todo list component to provide a todo list tool on the app. In the users page, there's a button that when pressed, fetches all user data from the JSON server and displays it using components from Material-UI. It first fetches a server side file named route.js which makes a GET request to the server and returns the response to the frontend.

### THoughts and challenges
When designing the user page, I wanted user data to be displayed like a spreadsheet to show all their information, which possed challenging when trying to align because I had issues like data not displaying in columns per user. I ended up solving this and found a component that would give it a top to down look and centered it to make it look more organized under the User List title.



