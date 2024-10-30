<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.foodapp.model.menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<title>Menu List</title>
<style>
	   body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 0;
	    background-color:#444444; /* Light black background */
	    color: #ffffff; /* White font color */
		}
		
          /* Navbar Section */
.navbar {
    background-color: #444444;
    padding: 10px 20px;
    color: #ffffff;
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
    color: white;
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
		.menu-container  {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    padding: 20px;
		}
		
		.menu-item {
		    display: flex;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    width: 80%;
		    max-width: 800px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    margin-bottom: 20px;
		    overflow: hidden;
		    background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000); /* Slightly darker background for menu items */
		    color: #ffffff; /* White text color */
		    text-align: left;
		    align-items: center;
		}
		
		.menu-item img {
		    width: 30%;
		    height: auto;
		    object-fit: cover;
		    border-bottom: 1px solid #ddd;
		    border-radius: 10px;
		}
		
		.menu-item .info {
		    padding: 15px;
		    width: 50%;
		}
		
		.menu-item .info h3 {
		    margin: 0 0 10px 0;
		    font-size: 1.5em;
		}
		
		.menu-item .info p {
		    margin: 5px 0;
		    font-size: 1.2em;
		}
		
		.menu-item form {
		    margin-top: 10px;
		}
		
		.menu-item button {
		    background-color: #ff5722;
		    color: #fff;
		    border: none;
		    border-radius: 4px;
		    padding: 10px 15px;
		    cursor: pointer;
		}
		
		.menu-item button:hover {
		    background-color: #e64a19;
		}
		
		.menu-item input[type="number"] {
		    width: 60px;
		    padding: 5px;
		    margin-right: 10px;
		}
		
		.menu-item1 {
		    display: flex;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    width: 80%;
		    max-width: 800px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    margin-bottom: 20px;
		    overflow: hidden;
		    background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000);/* Same dark background */
		    color: #ffffff; /* White text */
		    text-align: left;
		    align-items: center;
		}
		
		.info1 {
		    padding: 15px;
		    width: 100%;
		}
		
		.restaurant-details {
		    background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000); /* Darker background for details */
		    padding: 15px;
		    border-radius: 8px;
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
		    margin-bottom: 20px;
		    position: relative;
		    color: #ffffff; /* White text */
		}
		
		.restaurant-details h3, .outlet, .delivery-time {
		    color: #ffffff; /* White text */
		}

        .rating {
            display: flex;
            align-items: center;
            font-weight: bold;
            color: #388E3C;
        }
        .rating i {
            color: orange;
            margin-right: 5px;
        }
        .rating-value {
            margin-left: 5px;
            color: #ffffff;
        }
		
		.vertical-progress-bar {
		    position: absolute;
		    left: 5px;
		    top: 45px;
		    height: 40px;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: space-between;
		}
		
		.progress-point {
		    width: 5px;
		    height: 5px;
		    background-color: #ff9800;
		    border-radius: 50%;
		    z-index: 1;
		}
		
		.progress-line {
		    width: 2px;
		    height: 100%;
		    background-color: #ff9800;
		    z-index: 0;
		}
		
		.delivery-time {
		    font-size: 14px;
		    color: #ff5722;
		    margin-top: 10px;
		    padding-left: 10px;
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
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="logoutservlet">Sign Out</a></li>
            </ul>
        </div>
    </nav>
    <% 
    
    HttpSession session1 = request.getSession(false);

    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<menu> menulist = (ArrayList<menu>) session.getAttribute("menuitems");
    String restarent_name =(String)session.getAttribute("restarent_name");
    float rating =(float)session.getAttribute("rating");
    int delivery_time =(int)session.getAttribute("delivery_time");
    String address =(String)session.getAttribute("address");
    if (menulist == null) {
        out.println("<p>No menu items found.</p>");
    } else {
    %>
    <h1 style="margin-left: 370px;"><%=restarent_name %></h1>
    <div style="margin-left: 365px;">
      <div class="menu-item1">
        <div class="info1">
            <div class="restaurant-details">
                <h3 class="rating"><i class="fa fa-star"></i> <%= rating %></h3>
                <h3 class="outlet">Outlet: <%= address %></h3>
                <div class="vertical-progress-bar">
                    <div class="progress-point"></div>
                    <div class="progress-line"></div>
                    <div class="progress-point"></div>
                </div>
                <p class="delivery-time">Delivery Time: <%= delivery_time %> - <%= delivery_time + 5 %> mins</p>
            </div>
        </div>
      </div>
    </div>
    <div class="menu-container">
        <% for (menu u : menulist) { %>
        <div class="menu-item">
            <div class="info">
                <h3><%= u.getMenuname() %></h3>
                <p>Price: ₹<%= u.getPrice() %></p>
                <p><%= u.getDescription() %></p>
                <p>Available: <%= u.getIsAvailable() %></p>
                <form action="addToCart" method="post">
                    <input type="hidden" name="itemId" value="<%= u.getMenuId() %>">
                    <input type="hidden" name="imgPath" value="<%= u.getImgpath() %>">
                    <input type="hidden" name="quantity" value="1">
                    <button type="submit">Add to Cart</button>
                    <input type="hidden" name="action" value="add"> 
                </form>
            </div>
            <img src="<%=u.getImgpath() %>" alt="Menu Image">
        </div>
        <% } %>
    </div>
    <% } %>
</body>
</html>
