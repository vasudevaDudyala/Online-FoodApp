package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.DAO.restarentDAO;
import com.foodapp.DAOImp.restarentDAOImp;
import com.foodapp.DAOImp.restarentDAOImp;
import com.foodapp.model.restarent;

@WebServlet("/search")
public class searchservlet extends HttpServlet {
    private restarentDAO restaurantDAO;

    public void init() {
        restaurantDAO = new restarentDAOImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        List<restarent> searchResults = restaurantDAO.searchRestaurants(query);
        request.setAttribute("searchResults", searchResults);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }
}
