/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        UserDAO dao = new UserDAO();
        boolean valid = dao.validateUser(email, password, role);

        if (valid) {
            HttpSession session = req.getSession();
            session.setAttribute("email", email);
            session.setAttribute("role", role);

            if ("admin".equals(role)) {
                res.sendRedirect("adminDashboard.jsp");
            } else {
                res.sendRedirect("userDashboard.jsp");
            }
        } else {
            req.setAttribute("error", "Invalid email, password, or role.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}

