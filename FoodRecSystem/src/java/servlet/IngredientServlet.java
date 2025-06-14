package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class IngredientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String type = request.getParameter("form_type"); // either "ingredient" or "advice"
        String foodName = request.getParameter("food_name");

        Connection conn = null;
        PreparedStatement ps = null;

        try (PrintWriter out = response.getWriter()) {

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");

            if ("ingredient".equals(type)) {
                String ingredientName = request.getParameter("ingredient_name");
                String quantity = request.getParameter("quantity");

                String sql = "INSERT INTO ingredients (food_name, ingredient_name, quantity) VALUES (?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, foodName);
                ps.setString(2, ingredientName);
                ps.setString(3, quantity);
                ps.executeUpdate();

            } else if ("advice".equals(type)) {
                String benefit = request.getParameter("benefit");
                String advice = request.getParameter("advice");
                String adviceType = request.getParameter("type");

                String sql = "INSERT INTO health_advice (food_name, benefit, advice, type) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, foodName);
                ps.setString(2, benefit);
                ps.setString(3, advice);
                ps.setString(4, adviceType);
                ps.executeUpdate();
            }

            // Redirect back to viewFoodDetails.jsp using food ID
            response.sendRedirect("viewFoodDetails.jsp?id=" + getFoodId(conn, foodName));

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private int getFoodId(Connection conn, String foodName) throws SQLException {
        String query = "SELECT id FROM food WHERE food_name = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, foodName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        }
        return -1;
    }
}
