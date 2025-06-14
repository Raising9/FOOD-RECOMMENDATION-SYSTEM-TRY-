<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Food</title>
    <style>
        body { font-family: Arial; padding: 40px; background-color: #f0f0f0; }
        .container { max-width: 500px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; }
        input[type="text"], select {
            width: 100%; padding: 10px; margin: 10px 0; font-size: 16px;
        }
        input[type="submit"] {
            background-color: #28a745; color: white; padding: 12px; border: none; border-radius: 4px; font-size: 16px; cursor: pointer;
        }
        input[type="submit"]:hover { background-color: #218838; }
        a { display: block; margin-top: 20px; text-align: center; color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Food Item</h2>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String name = "", type = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");

                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM food WHERE id = ?");
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    name = rs.getString("food_name");
                    type = rs.getString("food_type");
                }

                conn.close();
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>

        <form action="updateFood.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <label>Food Name:</label>
            <input type="text" name="foodName" value="<%= name %>" required>

            <label>Food Type:</label>
            <select name="foodType" required>
                <option value="Dessert" <%= type.equals("Dessert") ? "selected" : "" %>>Dessert</option>
                <option value="Fruit" <%= type.equals("Fruit") ? "selected" : "" %>>Fruit</option>
                <option value="Meals" <%= type.equals("Meals") ? "selected" : "" %>>Meals</option>
            </select>

            <input type="submit" value="Update Food">
        </form>
        <a href="adminFoodList.jsp">← Back to Food List</a>
    </div>
</body>
</html>
