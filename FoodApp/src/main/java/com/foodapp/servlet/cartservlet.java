package com.foodapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.menuDAO;
import com.foodapp.DAOImp.menuDAOImp;
import com.foodapp.model.cart;
import com.foodapp.model.cartItem;
import com.foodapp.model.menu;

@WebServlet("/addToCart")
public class cartservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        cart cart = (cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new cart();
            session.setAttribute("cart", cart);
        }
        String action = req.getParameter("action");
        if (action.equals("add")) {
            addItem(req, cart);
        } else if (action.equals("update")) {
            updateItem(req, cart);
        } else if (action.equals("remove")) {
            removeItem(req, cart);
        } else if (action.equals("increase") || action.equals("decrease")) {
            adjustQuantity(req, cart, action.equals("increase") ? 1 : -1);
        }
        String redirectPage = req.getParameter("redirectPage");
        if (redirectPage != null && redirectPage.equals("billing")) {
            resp.sendRedirect("Billing_items.jsp");
        } else {
            resp.sendRedirect("cart.jsp");
        }

    }

    private void adjustQuantity(HttpServletRequest req, cart cart, int delta) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        cartItem item = cart.getItems().get(itemId);

        if (item != null) {
            int newQuantity = item.getQuantity() + delta;
            if (newQuantity > 0) {
                item.setQuantity(newQuantity);
            } else {
                cart.removeItem(itemId);
            }
        }
    }

    private void removeItem(HttpServletRequest req, cart cart) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        cart.removeItem(itemId);
    }

    private void updateItem(HttpServletRequest req, cart cart) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        cart.updateItem(itemId, quantity);
    }

    private void addItem(HttpServletRequest req, cart cart) throws ServletException {
        try {
            int itemId = Integer.parseInt(req.getParameter("itemId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            menuDAO dao = new menuDAOImp();
            menu menuItem = (menu) dao.getmenu1(itemId); 

            if (menuItem != null) {
                cartItem item = new cartItem(
                    menuItem.getMenuId(),
                    menuItem.getRestarent_id(),
                    menuItem.getMenuname(),
                    quantity,
                    menuItem.getPrice(),
                    menuItem.getImgpath()
                );
                cart.addItem(item);
            }
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid itemId or quantity", e);
        }
    }
}