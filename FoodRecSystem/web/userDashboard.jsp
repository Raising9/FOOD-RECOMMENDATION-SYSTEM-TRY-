<%@ page language="java" contentType="text/html; charset=UTF-8" session="true" %>
<%
    if (session == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: url("images/logout-bg.jpg") no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        .dashboard {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 260px;
            background: rgba(0, 0, 0, 0.8);
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 2px 0 8px rgba(0,0,0,0.3);
        }

        .sidebar h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 24px;
            margin-bottom: 30px;
            color: #f1f1f1;
        }

        .sidebar a {
            color: #ccc;
            text-decoration: none;
            margin-bottom: 20px;
            display: block;
            font-size: 16px;
        }

        .sidebar a:hover {
            color: #00d9ff;
        }

        .logout a {
            color: #ff4d4d;
            font-weight: bold;
        }

        .main-content {
            flex-grow: 1;
            padding: 60px 40px;
            background: rgba(255, 255, 255, 0.95);
            color: #333;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            overflow-y: auto;
        }

        .main-content h1 {
            margin-bottom: 30px;
            font-size: 32px;
            font-family: 'Montserrat', sans-serif;
        }

        .card-grid {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            flex: 1 1 240px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.2);
        }

        .card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <div class="sidebar">
        <div>
            <h2>User Menu</h2>
            <a href="userViewFood.jsp">📝 Review Foods</a>
            
        </div>
        <div class="logout">
            <a href="logout.jsp">🚪 Logout</a>
        </div>
    </div>
    <div class="main-content">
        <h1>Recommended for You</h1>
        <div class="card-grid">
            <div class="card">
                <img src="images/protein.jpg" alt="High Protein Meal">
                🍲 High Protein Meal
            </div>
            <div class="card">
                <img src="images/salad.jpg" alt="Diet-Friendly Salad">
                🥗 Diet-Friendly Salad
            </div>
            <div class="card">
                <img src="images/curry.jpg" alt="Allergy-Safe Curry">
                🍛 Allergy-Safe Curry
            </div>
        </div>
    </div>
</div>
</body>
</html>