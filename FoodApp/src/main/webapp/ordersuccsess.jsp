<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <!-- You can use Font Awesome for the tick mark icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .success-container {
            background-color: #ffffff;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-radius: 10px;
            max-width: 400px;
            width: 100%;
        }

        .success-icon {
            font-size: 4em;
            color: #28a745;
            margin-bottom: 20px;
        }

        .success-container h1 {
            color: #28a745;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .success-container p {
            font-size: 1.1em;
            color: #555555;
            margin-bottom: 20px;
        }

        .success-container .order-id {
            font-weight: bold;
            color: #333;
        }

        .success-container .btn {
            background-color: #28a745;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .success-container .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <!-- Success tick mark using Font Awesome -->
        <i class="fas fa-check-circle success-icon"></i>

        <h1>Order Placed Successfully!</h1>
        <p>Thank you for your order.</p>
        <p>We are now processing your order and will notify you once it’s ready.</p>
        <a href="home1.jsp" class="btn">Return to Home</a>
    </div>
</body>
</html>
