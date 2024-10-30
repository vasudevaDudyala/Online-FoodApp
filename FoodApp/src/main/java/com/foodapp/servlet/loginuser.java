package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.userDAO;
import com.foodapp.DAOImp.userDAOImp;
import com.foodapp.model.user;


@WebServlet("/login")
public class loginuser extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		userDAO DAO=new userDAOImp();
		user u=DAO.getUser(email);
		if(u!=null) {
			if(password.equals(u.getPassword())){
				HttpSession session = req.getSession();
				session.setAttribute("user", u);
				resp.sendRedirect("home1.jsp");
			}
			else {
				req.setAttribute("errorMessage", "Invalid username or password. Please try again.");
	            req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("errorMessage", "Invalid username or password. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		
	}

}
