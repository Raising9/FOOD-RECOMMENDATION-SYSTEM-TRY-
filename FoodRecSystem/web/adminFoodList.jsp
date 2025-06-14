<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Food List</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f9f9f9; }
        .top-bar { display: flex; justify-content: space-between; margin-bottom: 20px; }
        .food-container { display: flex; gap: 20px; flex-wrap: wrap; }
        .food-card { background: white; padding: 10px; width: 30%; box-shadow: 0 2px 5px #ccc; border-radius: 5px; text-align: center; }
        .food-card img { width: 100%; height: 180px; object-fit: cover; border-radius: 5px; background: #eee; }
        .actions button { margin: 5px; }
        .add-button { padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <h1>Admin Food List</h1>

    <div class="top-bar">
        <div>
            <form method="get" action="adminFoodList.jsp">
        <label>Filter:</label>
        <select name="filter" onchange="this.form.submit()">
            <option value="All" <%= "All".equals(request.getParameter("filter")) ? "selected" : "" %>>All</option>
            <option value="Dessert" <%= "Dessert".equals(request.getParameter("filter")) ? "selected" : "" %>>Dessert</option>
            <option value="Fruit" <%= "Fruit".equals(request.getParameter("filter")) ? "selected" : "" %>>Fruit</option>
            <option value="Meals" <%= "Meals".equals(request.getParameter("filter")) ? "selected" : "" %>>Meals</option>
        </select>
            </form>
        </div>

        <a href="addFoodList.jsp"><button class="add-button">Add Food</button></a>
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
                int id = rs.getInt("id");
                String name = rs.getString("food_name");
                String type = rs.getString("food_type");
                String imagePath = rs.getString("image_path");

    %>
        <div class="food-card">
            

            <img src="<%= imagePath %>" alt="Food Image">

            
            <h3><%= name %></h3>
            <p>Type: <%= type %></p>
            <div class="actions">
                <form action="viewFoodDetails.jsp" method="get" style="display:inline;">
    <input type="hidden" name="id" value="<%= id %>">
    <button type="submit" style="background:#007bff;color:white;">View</button>
</form>

                <form action="editFood.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit" style="background:#ffc107;color:white;">Edit</button>
                </form>

                <form action="deleteFood.jsp" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this food?');">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit" style="background:#dc3545;color:white;">Delete</button>
                </form>
            </div>
        </div>
    <%
            }

            if (!hasData) {
    %>
        <p>No food items available. Please add some.</p>
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
