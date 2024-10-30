<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* Center the entire page content */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-image: url("https://c4.wallpaperflare.com/wallpaper/132/599/770/modern-dining-area-wallpaper-preview.jpg"); /* Path to your image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* Styling the form */
        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 1.5em;
            background-color: rgba(23, 23, 23, 0.9); /* Adding transparency */
            border-radius: 15px;
            transition: .4s ease-in-out;
            max-width: 300px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form:hover {
            transform: scale(1.05);
            border: 1px solid black;
        }

        #heading {
            text-align: center;
            margin: 1em 0;
            color: rgb(255, 255, 255);
            font-size: 1.2em;
        }

        .field {
            display: flex;
            align-items: center;
            gap: 0.5em;
            border-radius: 15px;
            padding: 0.5em;
            border: none;
            outline: none;
            color: white;
            background-color: #171717;
            box-shadow: inset 2px 5px 10px rgb(5, 5, 5);
        }

        .input-icon {
            height: 1.3em;
            width: 1.3em;
            fill: white;
        }

        .input-field {
            background: none;
            border: none;
            outline: none;
            width: 100%;
            color: #d3d3d3;
        }

        /* Styling error message */
        .error-message {
            color: #ff4d4d;
            background-color: rgba(255, 0, 0, 0.1);
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 10px;
            font-size: 0.9em;
        }

        .form .btn {
            display: flex;
            justify-content: center;
            flex-direction: row;
            margin-top: 1.5em;
        }

        .button1, .button2, .button3 {
            padding: 0.5em;
            border-radius: 5px;
            border: none;
            outline: none;
            transition: .4s ease-in-out;
            background-color: #252525;
            color: white;
            font-size: 0.9em;
        }

        .button1 {
            margin-right: 0.5em;
        }

        .button1:hover, .button2:hover {
            background-color: black;
            color: white;
        }

        .button2 a {
            text-decoration: none;
            color: inherit;
        }

        .button3 a {
           text-decoration: none;
            color: inherit;
        }

        .button3:hover {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
    <form class="form" action="login" method="post">
        <p id="heading">Login</p>

        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>

        <div class="field">
            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z"></path>
            </svg>
            <input autocomplete="off" placeholder="Username" class="input-field" type="text" name="email" required>
        </div>

        <div class="field">
            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
            </svg>
            <input placeholder="Password" class="input-field" type="password" name="password" required>
        </div>

        <div class="btn">
            <button class="button1" type="submit">Login</button>
            <button class="button2"><a href="register.jsp">Sign Up</a></button>
        </div>
        <button class="button3"><a href="forgot_password.jsp">Forgot Password</a></button>
    </form>
</body>
</html>
