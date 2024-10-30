package com.foodapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.DAO.menuDAO;
import com.foodapp.DAOImp.menuDAOImp;
import com.foodapp.model.menu;

@WebServlet("/resmenulist")
public class menulist extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int res_id=Integer.parseInt(req.getParameter("restarent_Id"));
		String res_name=req.getParameter("restarent_name");
		float rating=Float.parseFloat(req.getParameter("rating"));
		int delivery_time=Integer.parseInt(req.getParameter("delivery_time"));
		String address=req.getParameter("address");
		menuDAO DAO=new menuDAOImp();
		List<menu> li= DAO.getmenu(res_id);
		HttpSession session=req.getSession();
		session.setAttribute("restarent_id",res_id);
		session.setAttribute("menuitems", li);
		session.setAttribute("restarent_name", res_name);
		session.setAttribute("rating", rating);
		session.setAttribute("delivery_time", delivery_time);
		session.setAttribute("address", address);
		resp.sendRedirect("menu.jsp");
	}
}
