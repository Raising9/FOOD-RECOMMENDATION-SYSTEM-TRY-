<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Food Item</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 40px; background-color: #f7f7f7; }
        .container { max-width: 600px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; }
        form { display: flex; flex-direction: column; }
        input[type="text"], select {
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a.back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
    <h2>Add New Food</h2>
    <form action="processAddFood.jsp" method="post" enctype="multipart/form-data">
        <label>Food Name:</label><br>
        <input type="text" name="foodName" required><br>

        <label>Food Type:</label><br>
        <select name="foodType" required>
            <option value="Dessert">Dessert</option>
            <option value="Fruit">Fruit</option>
            <option value="Meals">Meals</option>
        </select><br>

        <label>Upload Image:</label><br>
        <input type="file" name="image" accept="image/*"><br><br>

        <input type="submit" value="Add Food">
    </form>
</body>
</html>
