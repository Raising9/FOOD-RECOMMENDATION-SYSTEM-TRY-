<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Food Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
            margin: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            text-align: center;
        }

        .container img {
            max-width: 300px;
            height: auto;
            border-radius: 10px;
        }

        .section-wrapper {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            gap: 20px;
        }

        .box {
            flex: 1;
            background: #ffffff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 8px #ddd;
            max-height: 400px;
            overflow-y: auto;
        }

        .box h3 {
            text-align: center;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .box ul {
            list-style-type: none;
            padding: 0;
        }

        .box li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>
<body>

<%
    String foodId = request.getParameter("id");
    if (foodId == null) {
        out.println("<p>Invalid food ID</p>");
        return;
    }

    Connection conn = null;
    PreparedStatement psFood = null, psIng = null, psAdvice = null;
    ResultSet rsFood = null, rsIng = null, rsAdvice = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");

        // Get food info
        psFood = conn.prepareStatement("SELECT * FROM food WHERE id = ?");
        psFood.setInt(1, Integer.parseInt(foodId));
        rsFood = psFood.executeQuery();

        if (!rsFood.next()) {
            out.println("<p>Food not found.</p>");
            return;
        }

        String foodName = rsFood.getString("food_name");
        String foodType = rsFood.getString("food_type");
        String imagePath = rsFood.getString("image_path");
%>

<div class="container">
    <h2>Food Details</h2>
    <img src="<%= imagePath %>" alt="Food Image">
    <h3><%= foodName %></h3>
    <p><strong>Type:</strong> <%= foodType %></p>
</div>

<div class="section-wrapper">
    <!-- Ingredients Section -->
    <div class="box">
        <h3>Ingredients</h3>
        <ul>
        <%
            psIng = conn.prepareStatement("SELECT * FROM ingredients WHERE food_name = ?");
            psIng.setString(1, foodName);
            rsIng = psIng.executeQuery();

            boolean hasIng = false;
            while (rsIng.next()) {
                hasIng = true;
        %>
            <li><%= rsIng.getString("ingredient_name") %> - <%= rsIng.getString("quantity") %></li>
        <%
            }

            if (!hasIng) {
        %>
            <li>No ingredients listed.</li>
        <%
            }
        %>
        </ul>
    </div>

    <!-- Health Advice Section -->
    <div class="box">
        <h3>Health Advice</h3>
        <ul>
        <%
            psAdvice = conn.prepareStatement("SELECT * FROM health_advice WHERE food_name = ?");
            psAdvice.setString(1, foodName);
            rsAdvice = psAdvice.executeQuery();

            boolean hasAdvice = false;
            while (rsAdvice.next()) {
                hasAdvice = true;
        %>
            <li><strong><%= rsAdvice.getString("benefit") %>:</strong> <%= rsAdvice.getString("advice") %> (<%= rsAdvice.getString("type") %>)</li>
        <%
            }

            if (!hasAdvice) {
        %>
            <li>No health advice available.</li>
        <%
            }
        %>
        </ul>
    </div>
</div>

<%
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (conn != null) conn.close();
    }
%>

</body>
</html>
