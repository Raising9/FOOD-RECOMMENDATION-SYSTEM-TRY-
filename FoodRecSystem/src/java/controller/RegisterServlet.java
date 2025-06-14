/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String username = req.getParameter("username");
    String email = req.getParameter("email");
    String password = req.getParameter("password");
    String repassword = req.getParameter("repassword");
    String role = req.getParameter("role");

    
    if (!password.equals(repassword)) {
        System.out.println("⚠️ Passwords do not match.");
        req.setAttribute("error", "Passwords do not match.");
        req.getRequestDispatcher("register.jsp").forward(req, res);
        return;
    }

    if (role == null || role.isEmpty()) {
        role = "user";
    }

    User user = new User(username, email, password, role);
    UserDAO dao = new UserDAO();

    boolean success = dao.registerUser(user);
    System.out.println("Register success? " + success);

    if (success) {
        res.sendRedirect("login.jsp");
    } else {
        req.setAttribute("error", "Failed to create account. Try again.");
        req.getRequestDispatcher("register.jsp").forward(req, res);
    }
}

}
