package com.foodapp.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.orderDAO;
import com.foodapp.DAO.orderhistoryDAO;
import com.foodapp.DAO.orderitemDAO;
import com.foodapp.DAOImp.orderDAOImp;
import com.foodapp.DAOImp.orderhistoryDAOImp;
import com.foodapp.DAOImp.orderitemDAOImp;
import com.foodapp.model.cart;
import com.foodapp.model.cartItem;
import com.foodapp.model.orderhistory;
import com.foodapp.model.orderitem;
import com.foodapp.model.ordertable;
import com.foodapp.model.user;


@WebServlet("/processpayment")
public class process_payment extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paymentMode = req.getParameter("paymentMode");
        HttpSession session = req.getSession();
        user u = (user) session.getAttribute("user");
        int userId = u.getId();
        int restaurantId = (int) session.getAttribute("restarent_id");
        cart cart = (cart) session.getAttribute("cart");

        if (cart != null) {
            Map<Integer, cartItem> cartItems = cart.getItems();
            float total = 0.0f;
            String status = "delivered"; // Fixed spelling

            orderDAO dao = new orderDAOImp();
            int itemId = 0;
            int itemQuantity = 0;
            float itemTotal = 0.0f;

            // Retrieve the maximum orderId
            int orderId = 0;
			try {
				orderId = dao.getMaxOrderId() + 1;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // Increment max orderId for new order

            // Create a new order object with itemTotal initialized to 0
            ordertable order = new ordertable(restaurantId, userId, total, status, paymentMode);
            order.setOrderId(orderId); // Set the new orderId

            dao.addorder(order); // Insert order into the database

            // Loop through the cart items to calculate total and insert into orderitem table
            for (cartItem item : cartItems.values()) {
                itemId = item.getItemId();
                itemQuantity = item.getQuantity();
                float itemPrice = (float) item.getPrice();
                itemTotal = itemPrice * itemQuantity;

                // Calculate total amount
                total += itemTotal;

                // Create a new order item object
                orderitem oi = new orderitem(orderId, itemId, itemQuantity, itemTotal);
                orderitemDAO oritem = new orderitemDAOImp();

                // Insert into orderitem table
                oritem.addOrder(oi);
            }

            // Update the order's total in the database after processing all items
            order.setTotalamount(total);  // Update the total in the order object
            try {
				dao.updateOrderTotal(orderId, total);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  // Update the total in the order table
            
            orderhistoryDAO oh=new orderhistoryDAOImp();
            orderhistory oht=new orderhistory(orderId,userId,total,status);
            oh.addorderhistoty(oht);
            // Clear the cart after processing
            session.setAttribute("cart", null);
            resp.sendRedirect("ordersuccsess.jsp"); // Redirect to success page
        } else {
            resp.sendRedirect("orderFailed.jsp"); // Redirect to failure page
        }
    }
}