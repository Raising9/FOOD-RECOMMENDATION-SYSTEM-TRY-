<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("foodName");
    String type = request.getParameter("foodType");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");

        PreparedStatement stmt = conn.prepareStatement("UPDATE food SET food_name = ?, food_type = ? WHERE id = ?");
        stmt.setString(1, name);
        stmt.setString(2, type);
        stmt.setInt(3, id);

        int result = stmt.executeUpdate();
        conn.close();

        if (result > 0) {
%>
            <script>alert('✅ Food updated successfully!'); window.location.href='adminFoodList.jsp';</script>
<%
        } else {
%>
            <script>alert('❌ Update failed!'); window.history.back();</script>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
