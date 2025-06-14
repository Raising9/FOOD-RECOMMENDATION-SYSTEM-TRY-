<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String foodName = request.getParameter("food_name");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Health Advice</title>
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
            background-color: #007bff;
            color: white;
            border: none;
        }
        button:hover {
            background-color: #0056b3;
        }
        h2 { text-align: center; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Health Advice</h2>
    <form action="IngredientServlet" method="post">
    <input type="hidden" name="form_type" value="advice">
    <input type="hidden" name="food_name" value="<%= foodName %>">
  

        <label>Food Name:</label>
        <input type="text" name="food_name" value="<%= foodName %>" readonly>

        <label>Benefit:</label>
        <input type="text" name="benefit" required>

        <label>Advice:</label>
        <input type="text" name="advice" required>
        <br><br>
        <label>Type:</label>
         <select name="type"     >
            <option value="General">General</option>
            <option value="Nutritional">Nutritional</option>
            <option value="Medical">Medical</option>
        </select><br><br>
        <button type="submit">Add Advice</button>
    </form>
</div>
</body>
</html>
