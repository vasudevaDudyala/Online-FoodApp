package com.foodapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.orderhistoryDAO;
import com.foodapp.DAOImp.orderhistoryDAOImp;
import com.foodapp.model.orderhistory;
import com.foodapp.model.user;

@WebServlet("/orderhistory")
public class orderhistoryservlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session = req.getSession();
		user loggedInUser = (user) session.getAttribute("user");
		int id=loggedInUser.getId();
    	orderhistoryDAO dao = new orderhistoryDAOImp();
        ArrayList<orderhistory> orders = (ArrayList<orderhistory>) dao.getorders(id);
        session.setAttribute("orders", orders);
        resp.sendRedirect("history.jsp");
    }
}
