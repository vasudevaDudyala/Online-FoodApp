<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Updated</title>
    <style>
        /* Center the entire page content */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }

        /* Styling the container */
        .container {
            padding: 2em;
            background-color: rgba(23, 23, 23, 0.9);
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #d3d3d3;
        }

        p {
            color: white;
            margin: 1em 0;
        }

        .button {
            display: inline-block;
            padding: 0.5em 1em;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50; /* Green */
            color: white;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049; /* Darker green */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Password Updated Successfully!</h1>
        <p>Your password has been updated. You can now log in with your new password.</p>
        <a class="button" href="login.jsp">Go to Login</a>
    </div>
</body>
</html>
