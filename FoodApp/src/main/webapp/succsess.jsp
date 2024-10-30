<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #1a1a1a;
        }

        .success-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .success-container h1 {
            font-size: 2.5rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .success-container p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 30px;
        }

        .success-container .btn {
            padding: 12px 25px;
            background-color: #8e44ad;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .success-container .btn:hover {
            background-color: #732d91;
        }

        .success-container .icon {
            font-size: 4rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="success-container">
    <div class="icon">✔</div>
    <h1>Registration Successful</h1>
    <p>Congratulations! Your account has been successfully registered.</p>
    <a href="login.jsp" class="btn">Go to Login</a>
</div>

</body>
</html>
