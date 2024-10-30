<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.foodapp.model.orderhistory" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: black; /* Light black background */
            color: #e0e0e0; /* Light text for contrast */
            margin: 0;
            padding: 20px;
        }
        .navbar {
    background-color: black;
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
        h1 {
            color: #ff6347; /* Theme color (similar to Swiggy) */
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
            font-size: 2.5em;
        }
        .container {
            display: flex;
            flex-wrap: wrap; /* Allows the cards to wrap like restaurant displays */
            justify-content: center; /* Centers the items */
            gap: 20px; /* Space between cards */
        }
        .order-card {
            background-color: #333333; /* Darker card background for contrast */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* More subtle shadow */
            padding: 20px;
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #444; /* Dark border for subtle contrast */
        }
        .order-card:hover {
            transform: scale(1.05); /* Slightly more noticeable hover effect */
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
        }
        .order-card h3 {
            color: #ff6347;
            font-size: 1.8em;
            margin: 0;
        }
        .order-detail {
            margin: 10px 0;
            font-size: 1.1em;
        }
        .order-detail strong {
            color: #aaaaaa; /* Lighter text for labels */
        }
        .order-status {
            padding: 5px 10px;
            background-color: #333; /* Subtle dark background */
            border-radius: 4px;
            color: #4caf50; /* Green for success status */
            font-size: 0.9em;
            font-weight: bold;
        }
        .view-all-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #ff6347; /* Button matches theme */
            color: white;
            text-align: center;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
            font-size: 1em;
            transition: background-color 0.3s;
        }
        .view-all-btn:hover {
            background-color: #e05239; /* Darker hover effect */
        }
        .no-orders {
            font-size: 1.2em;
            color: #888;
            margin-top: 20px;
            text-align: center;
        }
        .explore-orders {
            text-align: center;
            margin-top: 30px;
        }
        .explore-orders img {
            width: 300px;
            height: auto;
        }
        .empty-orders {
            font-size: 1.2em;
            color: #ff6347;
            margin-top: 20px;
        }
        .explore-btn {
            margin-top: 20px;
            background-color: #4caf50;
            padding: 10px 20px;
            border-radius: 4px;
            color: white;
            font-size: 1em;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .explore-btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
	<!-- Navbar Section -->
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
        <h1>Order History</h1>
    
        <%
            ArrayList<orderhistory> orders = (ArrayList<orderhistory>) session.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
        %>
        <div class="container">
            <% for (orderhistory h : orders) { %>
                <div class="order-card">
                    <h3>Order ID: <%= h.getOrderId() %></h3>
                    <div class="order-detail"><strong>User ID:</strong> <%= h.getUserID() %></div>
                    <div class="order-detail"><strong>Order Date:</strong> <%= h.getorderDate() %></div>
                    <div class="order-detail"><strong>Status:</strong> <span class="order-status"><%= h.getStatus() %></span></div>
                    <div class="order-detail"><strong>Total Amount:</strong> ₹<%= h.getTotalamount() %></div>
                    <a href="viewOrderDetails?orderId=<%= h.getOrderId() %>" class="view-all-btn">View Details</a>
                </div>
            <% } %>
        </div>
        <% } else { %>
            <div class="explore-orders">
                <img src="images/history.png" alt="No Orders" />
                <div class="empty-orders">You have no previous orders.</div><br>
                <a href="home1.jsp" class="explore-btn">Explore Restaurants</a>
            </div>
        <% } %>
    </center>
</body>
</html>
