<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");

    if (email == null || !"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            height: 100vh;
            
            background: url("images/logout-bg.jpg") no-repeat center center fixed;
            background-size: cover;

        }

        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 8px rgba(0,0,0,0.1);
        }

        .sidebar h2 {
            margin-bottom: 30px;
            font-size: 22px;
            font-weight: normal;
        }

        .sidebar a {
            display: block;
            color: #ccc;
            text-decoration: none;
            margin-bottom: 15px;
            padding: 8px;
            border-radius: 4px;
        }

        .sidebar a:hover {
            background-color: #495057;
            color: white;
        }

        .logout a {
            color: #ff4d4d;
            font-weight: bold;
        }

        .main-content {
            flex: 1;
            padding: 40px;
        }

        .main-content h1 {
            font-size: 28px;
            margin-bottom: 30px;
        }

        .card-grid {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            flex: 1 1 calc(33.333% - 20px);
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            min-width: 220px;
        }

        .card a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .card a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .card {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Welcome, Admin</h2>
    <a href="adminFoodList.jsp">Manage Food List</a>
    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="main-content">
    <h1>Admin Dashboard</h1>
    <div class="card-grid">
        <div class="card">
            🍽️ <a href="adminFoodList.jsp">Food Management</a><br/>
            Add, edit, or delete food items.
        </div>

    </div>
</div>
</body>
</html>
