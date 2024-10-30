<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.foodapp.model.cart" %>
<%@ page import="com.foodapp.model.cartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #333333; /* Light black background */
            color: #ffffff; /* Light text color for better contrast */
        }

        /* Navbar Section */
.navbar {
    background-color: #333;
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


        /* Cart styles */
        .cart-container {
            width: 90%;
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
            background-color: #444444; /* Darker container background */
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
        }
        .cart-item {
            display: flex;
            align-items: center;
            border: 1px solid #555; /* Darker border */
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000); /* Slightly darker background */
        }
        .cart-item img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 8px;
        }
        .cart-item-info {
            flex: 1;
            padding: 0 15px;
        }
        .cart-item-info h3 {
            margin: 0;
            font-size: 1.2em;
            color: #f4f4f4; /* Light text for item name */
        }
        .cart-item-info p {
            margin: 5px 0;
            color: #bbb; /* Lighter gray for item details */
        }
        .empty-cart {
            text-align: center;
            font-size: 1.5em;
            color: #888; /* Lighter gray for empty cart message */
            padding: 20px;
        }
        .cart-total {
            margin-top: 20px;
            font-size: 1.4em;
            font-weight: bold;
            text-align: right;
            color: #f4f4f4; /* Light text for total */
        }
        .quantity-controls {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .quantity-controls button {
            background-color: #ff6f61; /* Swiggy-like orange */
            border: none;
            color: white;
            padding: 5px 10px;
            font-size: 1em;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 0 5px;
        }
        .quantity-controls button:hover {
            background-color: #e55b4f; /* Darker orange on hover */
        }
        .quantity-controls span {
            font-size: 1.2em;
            margin: 0 10px;
            color: #f4f4f4; /* Light text for quantity */
        }
        .explore-restaurants {
            text-align: center;
            margin-top: 20px;
        }
        .explore-restaurants img {
            width: 400px; /* Adjust based on your design */
            margin-bottom: 15px;
        }
        .explore-restaurants button {
            background-color: #ff6f61; /* Swiggy-like orange */
            padding: 10px 20px;
            border-radius: 4px;
            color: white;
            font-size: 1em;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }
        .explore-restaurants button:hover {
            background-color: #e55b4f; /* Darker orange on hover */
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
        
        </a> <!-- Logo link to homepage -->
        <ul class="nav-links">
            <li><a href="home1.jsp">Home</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="logoutservlet">Sign out</a></li>
        </ul>
    </div>
</nav>

    <!-- Cart Content Below -->
    <div class="cart-container">
        <% 
            cart cart = (cart) session.getAttribute("cart");

            if (cart == null || cart.getItems().isEmpty()) {
        %>
            <div class="explore-restaurants">
                <img src="images/empty.jpg" alt="Explore Restaurants" /> <!-- Replace with actual image path -->
                <div class="empty-cart">Your cart is empty.</div>
                <a href="home1.jsp" style="text-decoration: none;">
                    <button>
                        Explore Restaurants
                    </button>
                </a>
            </div>
        <% 
            } else {
                Map<Integer, cartItem> items = cart.getItems();
        %>
            <h2 style="text-align: center; color: #f4f4f4;">Cart Items</h2> <!-- Title Updated -->
            <% for (cartItem item : items.values()) { %>
            <div class="cart-item">
                <img src="<%=item.getImgpath() %>" alt="Item Image">
                <div class="cart-item-info">
                    <h3><%= item.getName() %></h3>
                    <p>Price: ₹<%= item.getPrice() %></p>
                    <p>Quantity: 
                        <div class="quantity-controls">
                            <form action="addToCart" method="post" style="display: inline;">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <input type="hidden" name="action" value="decrease">
                                <input type="hidden" name="redirectPage" value="cart">
                                <button type="submit">-</button>
                            </form>
                            <span><%= item.getQuantity() %></span>
                            <form action="addToCart" method="post" style="display: inline;">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <input type="hidden" name="action" value="increase">
                                <input type="hidden" name="redirectPage" value="cart">
                                <button type="submit">+</button>
                            </form>
                        </div>
                    </p>
                    <form action="addToCart" method="post" class="cart-item-form">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit">Remove</button>
                    </form>
                </div>
            </div>
        <% 
                }
        %>
           <div style="text-align: center; margin-top: 20px;">
                <a href="menu.jsp" style="text-decoration: none;">
                    <button style="background-color: #ff6f61; padding: 10px 20px; border-radius: 4px; color: white; font-size: 1em; cursor: pointer;">
                        Add more items
                    </button>
                </a>
                <a href="Billing_items.jsp" style="text-decoration: none;">
                    <button style="background-color: #ff6f61; padding: 10px 20px; border-radius: 4px; color: white; font-size: 1em; cursor: pointer;">
                        Checkout
                    </button>
                </a>
            </div>
        <% } %>
    </div>
</body>
</html>
