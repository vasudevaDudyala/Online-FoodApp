<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.foodapp.model.orderdetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #333333; /* Light black background */
            color: #ffffff; /* Light text color for better contrast */
        }

        .navbar {
    background-color: #333333;
    padding: 10px 20px;
    color: #fff;
    font-family: Arial, sans-serif;
    position: sticky;
    top: 0;
    z-index: 1000;
    width: 100%;
}

/* Navbar container */
.navbar-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
}

/* Logo with Image */
.logo img {
    width: 50px; /* Circular image diameter */
            height: 50px; /* Circular image diameter */
            object-fit: cover;
            border-radius: 50%; /* Circular images */
            border: 3px solid #dddddd; /* Light gray border */
            margin-top: 10px;
}

/* Navigation Links */
.nav-links {
    list-style: none;
    display: flex;
    gap: 20px;
    margin: 0;
    padding: 0;
}

.nav-links li {
    display: inline;
}

.nav-links a {
    color: #fff;
    text-decoration: none;
    font-size: 1.5em;
    padding: 5px 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.nav-links a:hover {
    background-color: #555;
    color: #ff6f61;
}

/* Responsive Design */
	@media (max-width: 768px) {
	    .navbar-container {
	        flex-direction: column;
	    }
	
	    .nav-links {
	        flex-direction: column;
	        gap: 10px;
	        text-align: center;
	        margin-top: 10px;
	    }
	 }
    
        .order-container {
            width: 90%;
            max-width: 700px;
            margin: 20px auto; /* Center the container */
            padding: 20px;
            background-color: #444444; /* Darker container background */
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
        }

        .order-item {
            display: flex;
            align-items: center;
            border: 1px solid #555; /* Darker border */
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000); /* Slightly darker background */
        }

        .order-item img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 15px; /* Space between image and text */
        }

        .order-item-info {
             flex: 1;
            padding: 0 15px;
        }

        .order-item-info h3 {
            margin: 0;
            font-size: 1.2em;
            color: white; /*  /* Light text for item name */
        }

        .order-item-info p {
            margin: 5px 0;
            color: white; /* Lighter gray for item details */
        }

        .empty-orders {
            text-align: center;
            font-size: 1.5em;
            color: #888; /* Lighter gray for empty orders message */
            padding: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar">
        <div class="navbar-container">
        <a href="home1.jsp" class="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn7eaTHYrwbIDLDcu6q9UGxpa6vZ8aRoMzfQ&s" alt=""> <!-- Replace with your logo path -->
             <p style="color: orange;">FoodApp</p>
       
        </a> 
            <ul class="nav-links">
                <li><a href="home1.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="logoutservlet">Sign out</a></li>
            </ul>
        </div>
    </nav>
    <center>
        <h1>Order Details</h1>

        <%
            ArrayList<orderdetails> orders = (ArrayList<orderdetails>) session.getAttribute("items");
            if (orders != null && !orders.isEmpty()) {
        %>
        <div class="order-container">
            <% for (orderdetails h : orders) { %>
                <div class="order-item">
                    <img src="<%= h.getImage() %>" alt="Item Image">
                    <div class="order-item-info">
                        <h3>Item Name: <%= h.getMenuName() %></h3>
                        <p><strong>Price:</strong> <%= h.getPrice() %></p>
                        <p><strong>Quantity:</strong> <%= h.getQuantity() %></p>
                        <p><strong>SubTotal:</strong> <span style="color: black;"><%= h.getSubtotal() %></span></p>
                    </div>
                </div>
            <% } %>
        </div>
        
        <% } else { %>
            <p class="empty-orders">No order history found.</p>
        <% } %>
    </center>
</body>
</html>
