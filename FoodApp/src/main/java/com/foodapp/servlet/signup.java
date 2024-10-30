package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.DAO.userDAO;
import com.foodapp.DAOImp.userDAOImp;
import com.foodapp.model.user;

@WebServlet("/registeruser")
public class signup extends HttpServlet {
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			String address=req.getParameter("address");
			String phonenumber=req.getParameter("phone");
			user user=new user(email,name,password,address,phonenumber);
			userDAO DAO=new userDAOImp();
			int status=DAO.adduser(user);
			if(status==1) {
				resp.sendRedirect("succsess.jsp");
			}
			else {
				resp.sendRedirect("failure.jsp");
			}
		}
}
