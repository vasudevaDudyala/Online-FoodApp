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

@WebServlet("/resetpassword")
public class forgotpassword extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        userDAO DAO = new userDAOImp();
        user u = DAO.getUser(email);

        if (u != null) {
            if (newPassword.equals(confirmPassword)) {
                u.setPassword(confirmPassword);  // Update the user's password in the model
                int result = DAO.updateuser(email, u.getUsername(), u.getPassword(), u.getAddress(), u.getPhonenumber());

                if (result > 0) {
                    // Redirect to updated.jsp if the password is successfully updated
                    resp.sendRedirect("update.jsp");
                } else {
                    // Set error message and forward to the same page
                    req.setAttribute("errorMessage", "Failed to update password. Please try again.");
                    req.getRequestDispatcher("forgot_password.jsp").forward(req, resp);
                }
            } else {
                // Set error message for password mismatch
                req.setAttribute("errorMessage", "Passwords do not match. Please try again.");
                req.getRequestDispatcher("forgot_password.jsp").forward(req, resp);
            }
        } else {
            // Set error message for invalid email
            req.setAttribute("errorMessage", "Email not found. Please check and try again.");
            req.getRequestDispatcher("forgot_password.jsp").forward(req, resp);
        }
    }
}
