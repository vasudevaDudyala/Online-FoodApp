package com.foodapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.restarentDAO;
import com.foodapp.DAOImp.restarentDAOImp;
import com.foodapp.model.restarent;


@WebServlet("/restarents")
public class getallrestarent extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		restarentDAO DAO=new restarentDAOImp();
		ArrayList<restarent> restarents=(ArrayList<restarent>)DAO.getAll();
		HttpSession session=req.getSession();
		session.setAttribute("restarents", restarents);
		resp.sendRedirect("home.jsp");
	}
}
