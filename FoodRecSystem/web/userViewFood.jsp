<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
   if (session == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Food List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            padding: 20px;
        }
        h1 {
            margin-bottom: 20px;
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .food-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .food-card {
            background: white;
            padding: 10px;
            width: 30%;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 5px;
            text-align: center;
        }
        .food-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 5px;
            background: #eee;
        }
        .food-card h3 {
            margin: 10px 0 5px;
        }
        .food-card p {
            color: #666;
        }
        .back-button {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1>Available Foods</h1>

<div class="top-bar">
    <form method="get" action="userViewFood.jsp">
        <label>Filter:</label>
        <select name="filter" onchange="this.form.submit()">
            <option value="All" <%= "All".equals(request.getParameter("filter")) ? "selected" : "" %>>All</option>
            <option value="Dessert" <%= "Dessert".equals(request.getParameter("filter")) ? "selected" : "" %>>Dessert</option>
            <option value="Fruit" <%= "Fruit".equals(request.getParameter("filter")) ? "selected" : "" %>>Fruit</option>
            <option value="Meals" <%= "Meals".equals(request.getParameter("filter")) ? "selected" : "" %>>Meals</option>
        </select>
    </form>
    <a class="back-button" href="userDashboard.jsp">← Back to Dashboard</a>
</div>

<div class="food-container">
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");
        Statement stmt = conn.createStatement();
        String filter = request.getParameter("filter");
        String query;

        if (filter != null && !filter.equals("All")) {
            query = "SELECT * FROM food WHERE food_type = '" + filter + "'";
        } else {
            query = "SELECT * FROM food";
        }

        ResultSet rs = stmt.executeQuery(query);
        boolean hasData = false;

        while (rs.next()) {
            hasData = true;
            String name = rs.getString("food_name");
            String type = rs.getString("food_type");
            String imagePath = rs.getString("image_path");
%>
      <div class="food-card">
        <img src="<%= imagePath %>" alt="Food Image">
        <h3><%= name %></h3>
        <p>Type: <%= type %></p>
        <form action="ingredientsUser.jsp" method="get">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button type="submit" style="margin-top:10px; padding: 8px 12px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer;">
                View More
            </button>
        </form>
    </div>

<%
        }

        if (!hasData) {
%>
    <p>No food items found.</p>
<%
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</div>

</body>
</html>
