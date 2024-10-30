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
            background-color: #333333; /* Dark background */
            color: #f4f4f4; /* Light text color */
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
        .cart-container {
            width: 90%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color:#444444; /* Slightly lighter dark for the container */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .cart-item {
            display: flex;
            align-items: center;
            border: 1px solid #333; /* Darker border */
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000); /* Slightly darker background for menu items */
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
            color: #ff6f61; /* Bright color for item name */
        }
        .cart-item-info p {
            margin: 5px 0;
            color: white; /* Lighter text for details */
        }
        .empty-cart {
            text-align: center;
            font-size: 1.5em;
            color: #888; /* Slightly brighter for empty cart message */
            padding: 20px;
        }
        .cart-total1 {
            margin-top: 20px;
            font-size: 1.4em;
            font-weight: bold;
            text-align: right;
            color: #ff6f61; /* Bright color for total */
        }
        
        .cart-total {
            margin-top: 20px;
            font-size: 1.4em;
            font-weight: bold;
            text-align: right;
            color: #ff6f61; /* Bright color for total */
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
        }
        .checkout-button {
            display: block;
            text-align: right;
            margin-top: 20px;
        }
        .checkout-button button {
            background-color: #ff6f61;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 1.2em;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .checkout-button button:hover {
            background-color: #e55b4f;
        }

        /* Styles for Shipping Address */
        .shipping-address {
            margin-top: 20px;
        }
        .shipping-address h2 {
            font-size: 1.4em;
            color: #ff6f61; /* Bright color for section heading */
            margin-bottom: 10px;
        }
        .shipping-address textarea {
            width: 40%; /* Full width for better layout */
            padding: 10px;
            border: 1px solid #555; /* Dark border for textarea */
            border-radius: 4px;
            font-size: 1em;
            resize: none;
            background-color: #2a2a2a; /* Dark background for textarea */
            color: #e0e0e0; /* Light text color for textarea */
        }

        /* Styles for Payment Section */
        .payment-method-section {
            margin-top: 30px;
        }
        .payment-method-section h2 {
            font-size: 1.4em;
            color: #ff6f61; /* Bright color for section heading */
            margin-bottom: 10px;
        }
        .payment-method-section label {
            font-size: 1em;
            color: white; /* Lighter label color */
            margin-right: 10px;
        }
        .payment-method-section select {
            padding: 8px;
            font-size: 1em;
            border: 1px solid #555; /* Dark border for select */
            border-radius: 4px;
            background-color: #2a2a2a; /* Dark background for select */
            color: #e0e0e0; /* Light text color for select */
        }
        .payment-method-section .checkout-button {
            margin-top: 20px;
            text-align: left;
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
				
				</a> <ul class="nav-links">
                <li><a href="home1.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="logoutservlet">Sign out</a></li>
            </ul>
        </div>
    </nav>
	
    <div class="cart-container">
        <% 
            cart cart = (cart) session.getAttribute("cart");

            if (cart == null || cart.getItems().isEmpty()) {
        %>
            <div class="empty-cart">Your cart is empty.</div>
        <% 
            } else {
                double total = 0.0;
                Map<Integer, cartItem> items = cart.getItems();
                for (cartItem item : items.values()) {
                    double itemprice= item.getPrice() * item.getQuantity();
                    total+=itemprice;
        %>
            <div class="cart-item">
                <img src="<%=item.getImgpath() %>" alt="Item Image"> <!-- Use image path from item -->
                <div class="cart-item-info">
                    <h3><%= item.getName() %></h3>
                    <p>Price: ₹<%= item.getPrice() %></p>
                    <p>Quantity: 
                        <div class="quantity-controls">
                            <form action="addToCart" method="post" style="display: inline;">
							    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
							    <input type="hidden" name="action" value="decrease">
							    <input type="hidden" name="redirectPage" value="billing">
							    <button type="submit">-</button>
							</form>
                            <span><%= item.getQuantity() %></span>
                            <form action="addToCart" method="post" style="display: inline;">
							    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
							    <input type="hidden" name="action" value="increase">
							    <input type="hidden" name="redirectPage" value="billing">
							    <button type="submit">+</button>
							</form>
                        </div>
                    </p>
                    <p class="cart-total1">Item Price: ₹<%= itemprice %></p>
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
            <div class="cart-total">Total: ₹<%= total %></div>
            
            <!-- Shipping Address Section -->
            <div class="shipping-address">
                <h2>Shipping Address</h2>
                <textarea name="address" placeholder="Enter your full address, including city, state, and ZIP code" rows="4" required></textarea>
            </div>

            <!-- Payment Method Section -->
            <div class="payment-method-section">
                <h2>Select Payment Mode</h2>
                <form id="paymentForm" action="processpayment" method="post">
                    <label for="paymentMode">Payment Method:</label>
                    <select id="paymentMode" name="paymentMode" required>
                        <option value="" disabled selected>Select a payment method</option>
                        <option value="Online">PhonePe</option>
                        <option value="COD">Cash on Delivery (COD)</option>
                        <option value="UPI">UPI</option>
                    </select>
                    <div class="checkout-button">
                        <button type="submit">Proceed to Pay</button>
                    </div>
                </form>
            </div>
        <% 
            } 
        %>
    </div>
</body>
</html>
