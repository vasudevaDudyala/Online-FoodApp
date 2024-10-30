package com.foodapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.orderitemDAO;
import com.foodapp.DAOImp.orderitemDAOImp;
import com.foodapp.model.orderdetails;


@WebServlet("/viewOrderDetails")
public class vieworderdetails extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int order_id=Integer.parseInt(req.getParameter("orderId"));
		orderitemDAO dao=new orderitemDAOImp();
		ArrayList<orderdetails> items=(ArrayList<orderdetails>) dao.getorder(order_id);
    	HttpSession session = req.getSession();
    	session.setAttribute("items", items);
    	resp.sendRedirect("viewitems.jsp");
	}
	 

}
