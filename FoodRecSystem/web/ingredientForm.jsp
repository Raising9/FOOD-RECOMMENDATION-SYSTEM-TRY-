<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String foodName = request.getParameter("food_name");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Ingredient</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 40px; }
        .form-container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
        }
        button:hover {
            background-color: #218838;
        }
        h2 { text-align: center; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Ingredient</h2>
    <form action="IngredientServlet" method="post">
        <label>Food Name:</label>
        <input type="text" name="food_name" value="<%= foodName %>" readonly>

        <label>Ingredient Name:</label>
        <input type="text" name="ingredient_name" required>

        <label>Quantity:</label>
        <input type="text" name="quantity" required>

        <button type="submit">Add Ingredient</button>
    </form>
</div>
</body>
</html>
