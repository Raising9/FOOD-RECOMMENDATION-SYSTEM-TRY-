<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");

        PreparedStatement stmt = conn.prepareStatement("DELETE FROM food WHERE id = ?");
        stmt.setInt(1, id);

        int result = stmt.executeUpdate();
        conn.close();

        if (result > 0) {
%>
            <script>alert('🗑️ Food deleted successfully!'); window.location.href='adminFoodList.jsp';</script>
<%
        } else {
%>
            <script>alert('❌ Failed to delete food.'); window.history.back();</script>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
