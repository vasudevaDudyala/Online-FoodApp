<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.restarent" %>
<%@ page import="com.foodapp.model.menu" %>
<%@ page import="com.foodapp.DAOImp.menuDAOImp" %>
<%@ page import="com.foodapp.DAOImp.restarentDAOImp" %>
<%@ page import="com.foodapp.model.user" %>

<%
    user loggedInUser = (user) session.getAttribute("user");
    List<restarent> restaurants = new ArrayList<>();
    List<restarent> popular_restaurants = new ArrayList<>();

    List<menu> menu = new ArrayList<>();

    try {
        restarentDAOImp restaurantDAO = new restarentDAOImp(); 
        restaurants = restaurantDAO.getAll();
        menuDAOImp menudao = new menuDAOImp();
        menu = menudao.getAllmenu();
        popular_restaurants=restaurantDAO.getpopularrestarents(10);
 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Food App</title>
    <!-- Google Fonts Import -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> 
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background-color: #2c2c2c; /* Light black background */
            color: #ffffff; /* White font color */
        }
        header {
            background-color: #333333; /* Darker black for header */
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            position: sticky;
            top: 0;
            z-index: 1000;
            color: #ffffff; /* White font color */
        }
        .nav-links {
            display: flex;
            justify-content: center;
            background: #ffffff; /* White background */
            padding: 20px 15px;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }
        .nav-links li {
            list-style: none;
            margin: 0 12px;
        }
        .nav-links li a {
            position: relative;
            color: #333333; /* Dark font color */
            font-size: 18px;
            font-weight: 500;
            padding: 6px 0;
            text-decoration: none;
        }
        .nav-links li a:before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            width: 0%;
            background: #ff5722; /* Swiggy orange */
            border-radius: 12px;
            transition: all 0.4s ease;
        }
        .nav-links li a:hover:before {
            width: 100%;
        }
        .nav-links li.active a {
            font-weight: bold;
            color: #ff5722; /* Swiggy orange */
        }
        .nav-links {
            display: flex;
            justify-content: center;
            background: #2c2c2c; /* Light black background */
            padding: 20px 15px;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }
        .nav-links li {
            list-style: none;
            margin: 0 12px;
        }
        .nav-links li a {
            position: relative;
            color: #ffffff; /* White font color */
            font-size: 20px;
            font-weight: 500;
            padding: 6px 0;
            text-decoration: none;
        }
        .nav-links li a:before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            width: 0%;
            background: #555555; /* Gray for underline */
            border-radius: 12px;
            transition: all 0.4s ease;
        }
                /* Banner Section */
       .banner {
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
            background: linear-gradient(to left, #f0f0f0, #c0c0c0, #808080, #404040, #000000);
		    
		    /*background-color:Orange; /* Dark background similar to Swiggy */
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    padding: 20px;
		    margin-bottom: 20px;
		    color: #ffffff; /* White font color */
		}
		
		.banner-text {
		    flex: 1;
		    margin-right: 20px;
		    max-width: 50%;
		    padding-left: 10px; /* Move description slightly to the right */
		}
		
		.banner-text h2 {
		    font-size: 2.5em; /* Larger title */
		    margin-bottom: 10px;
		    font-weight: 700; /* Bold title */
		}
		
		.banner-text p {
		    font-size: 1.2em;
		    line-height: 1.4;
		    font-weight: 300; /* Light description */
		}
		
		.banner-image {
		    flex: 1;
		    max-width: 70%;
		    display: flex;
		    justify-content: center; /* Center the images horizontally */
		    gap: 10px; /* Space between the images */
		}
		
		.banner-image img {
		    width: 50%;
		    height: auto;
		    border-radius: 10px;
		    object-fit: cover;
		}
        main {
            margin: 20px auto;
            max-width: 1200px;
            padding: 0 15px;
        }
        .section-title {
            font-size: 1.8em;
            color: #ffffff; /* Dark font color */
            margin-bottom: 20px;
        }
        .section {
            background-color: #3c3c3c; /* Dark gray for sections */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 5px;
            margin-bottom: 20px;
            color: #ffffff; /* White font color */
        }
         #new-items .button-container {
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            margin-top: 10px;
            gap: 10px; /* Space between buttons */
        }
        .button {
            width: 40px; /* Adjust size as needed */
            height: 40px; /* Adjust size as needed */
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: none; /* Remove border */
            background-color: transparent; /* Transparent background */
        }
        .arrow {
            font-size: 24px; /* Adjust arrow size as needed */
            color: #ffffff; /* Dark font color */
        }
        .button:active {
            transform: scale(0.97);
        }
        #new-items ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: nowrap; /* Prevent wrapping */
            overflow-x: auto; /* Allow horizontal scroll if needed */
            gap: 20px;
            justify-content: center;
        }
        #new-items ul li {
            background-color: transparent; /* Medium gray for list items */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 150px; /* Adjust width if needed */
            max-width: 150px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #ffffff; /* White font color */
        }
        #new-items ul li img {
            width: 100px; /* Circular image diameter */
            height: 100px; /* Circular image diameter */
            object-fit: cover;
            border-radius: 50%; /* Circular images */
            border: 3px solid #dddddd; /* Light gray border */
            margin-top: 10px;
        }
        #new-items ul li div {
            padding: 10px;
        }
        #new-items ul li h3 {
            margin: 0;
            font-size: 1.2em;
            color: #ffffff; /* White font color */
        }
		#top-restaurants {
		    background-color: balck; /* Light gray background */
		    padding: 40px 20px;
		    border-radius: 10px;
		    margin-bottom: 30px;
		}
		
		#top-restaurants .button-container {
		    display: flex;
		    justify-content: flex-end; /* Align buttons to the right */
		    margin-top: 10px;
		    gap: 10px; /* Space between buttons */
		}
		
		#top-restaurants .button {
		    width: 40px; /* Adjust size as needed */
		    height: 40px; /* Adjust size as needed */
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    cursor: pointer;
		    border: none; /* Remove border */
		    background-color: transparent; /* Transparent background */
		}
		
		#top-restaurants .arrow {
		    font-size: 24px; /* Adjust arrow size as needed */
		    color: white; /* Dark font color */
		}
		
		#top-restaurants .button:active {
		    transform: scale(0.97);
		}
		
		#top-restaurants ul {
		    list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
		}
		
		#top-restaurants ul li {
		    background-color: #4c4c4c; /* Medium gray for list items */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(25% - 20px);
            max-width: 280px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #ffffff; 
		}
		#top-restaurants ul li:hover {
            transform: translateY(-15px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }
        #top-restaurants ul li a {
            text-decoration: none;
            color: #ffffff; /* White font color for links */
            font-weight: bold;
            display: inline-block;
            margin-top: 10px;
            margin-left: 20px;
            margin-right: 20px;
        }
		#top-restaurants ul li img {
		    width: 100%;
		    height: 150px;
		    object-fit: cover;
		    border-bottom: 1px solid #ddd;
		    border-radius: 10px; 
		}
		
		#top-restaurants ul li div {
            padding: 3px;
            text-align: left;
        }
		
		#top-restaurants ul li h3 {
		    margin: 10px 0 5px;
		    font-size: 1.5em;
		    font-weight: 600;
		    color: #ffffff; /* Dark font color */
		}
		
		#top-restaurants ul li p {
            margin: 5px 0;
            color: #cccccc; /* Light gray for restaurant details */
        }
        #restaurants ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        #restaurants ul li {
            background-color: #4c4c4c; /* Medium gray for list items */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(25% - 20px);
            max-width: 280px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #ffffff; /* White font color */
        }
        #restaurants ul li:hover {
            transform: translateY(-15px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }
        #restaurants ul li img {
	    width: 100%;
	    height: 150px;
	    object-fit: cover;
	    border-bottom: 1px solid #ddd;
	    border-radius: 10px; /* Adjust the value for the desired roundness */
	    }

        #restaurants ul li div {
            padding: 3px;
            text-align: left;
        }
        #restaurants ul li h3 {
            margin: 0;
            font-size: 1.4em;
            color: #ffffff; /* White font color */
        }
        #restaurants ul li p {
            margin: 5px 0;
            color: #cccccc; /* Light gray for restaurant details */
        }
        #restaurants ul li a {
            text-decoration: none;
            color: #ffffff; /* White font color for links */
            font-weight: bold;
            display: inline-block;
            margin-top: 10px;
        }
        
        .rating {
            display: flex;
            align-items: center;
            font-weight: bold;
            color: orange; /* Swiggy orange */
        }
        .rating i {
            color: #ff5722; /* Same orange for the star */
            margin-right: 5px;
        }
        .rating-value {
            margin-left: 5px;
            color: #ffffff; /* Swiggy orange for the rating value */
        }
	        
	      footer {
  background-color: #1a1a1a; /* Dark background */
  color: #f5f5f5; /* Light text color */
  padding: 40px 0;
}

.footer-container {
  display: flex;
  justify-content: space-between;
  align-items: start;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  flex-wrap: wrap;
}

.footer-logo img {
  width: 100px; /* Circular image diameter */
            height: 100px; /* Circular image diameter */
            object-fit: cover;
            border-radius: 50%; /* Circular images */
            border: 3px solid #dddddd; /* Light gray border */
            margin-top: 10px;
}

.footer-logo p {
  color: #b5b5b5;
}

.footer-links {
  display: flex;
  gap: 30px;
}

.column h4 {
  color: #f5a623; /* Accent color */
  font-weight: 600;
  margin-bottom: 10px;
}

.column ul {
  list-style: none;
  padding: 0;
}

.column li {
  margin: 8px 0;
}

.column li a {
  color: #e5e5e5;
  text-decoration: none;
}

.column li a:hover {
  color: #f5a623;
  text-decoration: underline;
}

.footer-social p {
  color: #b5b5b5;
  font-weight: 600;
  margin-bottom: 10px;
}

.footer-social a {
  color: #f5f5f5;
  margin-right: 15px;
  font-size: 20px;
  transition: color 0.3s;
}

.footer-social a:hover {
  color: #f5a623;
}
.email-subscription input[type="email"] {
  padding: 8px;
  width: 100%;
  max-width: 250px;
  margin-right: 5px;
  border-radius: 4px;
  border: 1px solid #ccc;
  outline: none;
}

.email-subscription button {
  background-color: #f5a623; /* Accent color */
  color: #fff;
  border: none;
  padding: 8px 15px;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 14px;
}

.email-subscription button:hover {
  background-color: #e48b17; /* Darker accent color on hover */
}
.footer-circle-images img {
  width: 80px;             /* Matches footer logo width */
  height: 80px;            /* Matches footer logo height */
  object-fit: cover;       /* Fills the circular shape without distortion */
  border-radius: 50%;      /* Makes images circular */
  border: 2px solid #dddddd; /* Light gray border */
  margin-top: 10px;        /* Space from top */
  transition: transform 0.3s ease;
}

.footer-circle-images img:hover {
  transform: scale(1.1);   /* Zoom on hover for interactivity */
}

.profile-icon {
            position: relative;
            display: inline-block;
        }

        /* Tooltip styling */
        .profile-icon .tooltip {
            visibility: hidden;
            background-color: black;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%; /* Position the tooltip above the icon */
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
            white-space: nowrap;
        }

        /* Show the tooltip when hovering over the icon */
        .profile-icon:hover .tooltip {
            visibility: visible;
            opacity: 1;
        }

        /* Styling the tooltip arrow */
        .profile-icon .tooltip::after {
            content: '';
            position: absolute;
            top: 100%; /* At the bottom of the tooltip */
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: black transparent transparent transparent;
        }

        
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Our Restaurant</h1>
        <nav>
            <ul class="nav-links">
            
                <li><a href="home1.jsp" class="<%= (loggedInUser == null ? "" : "active") %>">Home</a></li>
                <% if (loggedInUser != null) { %>
                    <li><a href="cart.jsp">View Cart</a></li>
                    <li><a href="orderhistory">Order History</a></li>
                    <li><a href="logoutservlet">Logout</a></li>
                    <li class="profile-icon">
                    <i class="fas fa-user"></i>
                        <span class="tooltip"><%= loggedInUser.getUsername() %></span>
                    </li>
                <% } else { %>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jsp">Sign Up</a></li>                    
                <% } %>
            </ul>
        </form>
        </nav>
        
    </header>
     <div class="banner">
        <div class="banner-text">
            <h2>Online food Delivery</h2>
            <p>Delicious meals delivered to your door, anytime, anywhere.</p>
        </div>
        <div class="banner-image">
            <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_1002,h_600/v1678428358/portal/m/seo_web/dweb_header.png" alt="Banner Image">
         
            <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_1002,h_600/v1678428358/portal/m/seo_web/dweb_header.png" alt="Banner Image">
        </div>
        
    </div>
    <main>
        <section id="new-items" class="section">
            <h2 class="section-title">Categories</h2>
            <div class="button-container">
                <div id="prev-btn" class="button">
                    <div class="arrow">&#9664;</div> <!-- Left arrow -->
                </div>
                <div id="next-btn" class="button">
                    <div class="arrow">&#9654;</div> <!-- Right arrow -->
                </div>
            </div>
            <ul>
                <% for(menu m : menu) { %>
                    <li>
                        <img src="<%=m.getImgpath() %>" alt="<%= m.getMenuname() %>">
                        <div>
                            <h3><%= m.getMenuname() %></h3>
                        </div>
                    </li>
                <% } %>  
            </ul>
        </section>
        <section id="top-restaurants" class="section">
		    <h2 class="section-title">Popular Restaurants</h2>
		    <div class="button-container">
		        <div id="prev-top-btn" class="button">
		            <div class="arrow">&#9664;</div> <!-- Left arrow -->
		        </div>
		        <div id="next-top-btn" class="button">
		            <div class="arrow">&#9654;</div> <!-- Right arrow -->
		        </div>
		    </div>
		    <ul>
		        <% for (restarent pr : popular_restaurants) { %>
		            <li>
		                <a href="resmenulist?restarent_Id=<%= pr.getRestarent_id() %>&restarent_name=<%= pr.getRestarent_name() %>&rating=<%= pr.getRatings() %>&delivery_time=<%= pr.getDelivery_time() %>&address=<%= pr.getAddress() %>">
		                    <img src="<%=pr.getImgpath() %>" alt="<%= pr.getRestarent_name() %>">
		                    <div>
		                        <h3><%= pr.getRestarent_name() %></h3>
		                        <div class="rating">
				                    <% int rating = (int) Math.round(pr.getRatings()); %>
				                    <% for (int i = 0; i < 1; i++) { %>
				                        <i class="fa fa-star"></i> <!-- Star icon -->
				                    <% } %>
				                    <span class="rating-value"><%=pr.getRatings() %> &#183; <%= pr.getDelivery_time() %>-<%= pr.getDelivery_time()+5%> min</span>
				                </div>
		                        <p><%= pr.getAddress() %> &#183; <%= pr.getCuisinetype() %></p>
		                    </div>
		                </a>
		            </li>
		        <% } %>    
		    </ul>
		</section>
        <section id="restaurants" class="section">
            <h2 class="section-title">Featured Restaurants</h2>
            <ul>
                
                     <% for (restarent restaurant : restaurants) { %>
				    <li>
				        <a href="resmenulist?restarent_Id=<%= restaurant.getRestarent_id() %>&restarent_name=<%= restaurant.getRestarent_name() %>&rating=<%= restaurant.getRatings() %>&delivery_time=<%= restaurant.getDelivery_time() %>&address=<%= restaurant.getAddress() %>"> 
				        <img src="<%=restaurant.getImgpath() %>" alt="<%= restaurant.getRestarent_name() %>">
				            <div>
				                <h3><%= restaurant.getRestarent_name() %></h3>
				                <div class="rating">
				                    <% int rating = (int) Math.round(restaurant.getRatings()); %>
				                    <% for (int i = 0; i < 1; i++) { %>
				                        <i class="fa fa-star"></i> <!-- Star icon -->
				                    <% } %>
				                    <span class="rating-value"><%= restaurant.getRatings() %> &#183; <%= restaurant.getDelivery_time() %>-<%= restaurant.getDelivery_time()+5%> min</span>
				                </div>
				                <p><%= restaurant.getAddress() %> &#183; <%= restaurant.getCuisinetype() %></p>
   				                <p><%= restaurant.getAddress() %> &#183; <%= restaurant.getIsactive() %></p>
				                
				            </div>
				        </a> <!-- Close the link -->
				    </li>
			     <% } %>
 
                
            </ul>
        </section>
    </main>
   <footer>
  <div class="footer-container">
    <div class="footer-logo">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn7eaTHYrwbIDLDcu6q9UGxpa6vZ8aRoMzfQ&s" alt="Logo">
      <p style="color: orange;">FoodApp</p>
    </div>
    <div class="footer-links">
      <div class="column">
        <h4>About</h4>
        <ul>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Our Team</a></li>
          <li><a href="#">Careers</a></li>
          <li><span>Phone: +123 456 7890</span></li>
          <li><span>Email: contact@yourcompany.com</span></li>
        </ul>
        <div class="email-subscription">
          <input type="email" id="email" placeholder="Enter your email">
          <button type="submit">Send</button>
        </div>
      </div>
      <div class="column">
        <h4>Services</h4>
        <ul>
          <li><a href="#">Delivery</a></li>
          <li><a href="#">Takeaway</a></li>
          <li><a href="#">Online Order</a></li>
          <li><a href="#">Corporate Catering</a></li>
          <li><a href="#">Event Catering</a></li>
          <li><a href="#">Subscription Plans</a></li>
          <li><a href="#">Gift Cards</a></li>
        </ul>
      </div>
      <div class="column">
        <h4>Contact</h4>
        <ul>
          <li><a href="#">Help Center</a></li>
          <li><a href="#">Support</a></li>
          <li><a href="#">Feedback</a></li>
        </ul>
      </div>
      <div class="column">
        <h4>Available In</h4>
        <ul>
          <li><a href="#">Hyderabad</a></li>
          <li><a href="#">Chennai</a></li>
          <li><a href="#">Bangalore</a></li>
          <li><a href="#">pune</a></li>
          <li><a href="#">Kerala</a></li>
          <li><a href="#">Vizag</a></li>
          
        </ul>
      </div>
    </div>
    <div class="footer-social">
      <p>Follow Us</p>
      <a href="#"><i class="fab fa-facebook"></i></a>
      <a href="#"><i class="fab fa-twitter"></i></a>
      <a href="#"><i class="fab fa-instagram"></i></a>
      <a href="#"><i class="fab fa-youtube"></i></a>
      <a href="#"><i class="fab fa-linkedin"></i></a><br>
       <div class="footer-logo">
          <img src="images/steak.jpg" alt="Logo">
          <img src="images/shasimi.jpg" alt="Logo"><br>
          <img src="images/tacos.jpg" alt="Logo">
          <img src="images/pasta.jpg" alt="Logo">
      </div>
        
      
    </div>
  </div>
</footer>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const items = document.querySelectorAll("#new-items ul li");
            let currentIndex = 0;
            const itemsToShow = 6; // Number of items to show at a time

            function updateDisplay() {
                items.forEach((item, index) => {
                    item.style.display = (index >= currentIndex && index < currentIndex + itemsToShow) ? "block" : "none";
                });
            }

            document.getElementById("prev-btn").addEventListener("click", function() {
                if (currentIndex > 0) {
                    currentIndex -= itemsToShow;
                    updateDisplay();
                }
            });

            document.getElementById("next-btn").addEventListener("click", function() {
                if (currentIndex + itemsToShow < items.length) {
                    currentIndex += itemsToShow;
                    updateDisplay();
                }
            });

            updateDisplay(); 
        });
        
        
        document.addEventListener("DOMContentLoaded", function() {
            const topItems = document.querySelectorAll("#top-restaurants ul li");
            let topCurrentIndex = 0;
            const topItemsToShow = 4; // Number of items to show at a time

            function updateTopDisplay() {
                topItems.forEach((item, index) => {
                    item.style.display = (index >= topCurrentIndex && index < topCurrentIndex + topItemsToShow) ? "block" : "none";
                });
            }

            document.getElementById("prev-top-btn").addEventListener("click", function() {
                if (topCurrentIndex > 0) {
                    topCurrentIndex -= topItemsToShow;
                    updateTopDisplay();
                }
            });

            document.getElementById("next-top-btn").addEventListener("click", function() {
                if (topCurrentIndex + topItemsToShow < topItems.length) {
                    topCurrentIndex += topItemsToShow;
                    updateTopDisplay();
                }
            });

            updateTopDisplay(); 
        });
    </script>
</body>
</html>
