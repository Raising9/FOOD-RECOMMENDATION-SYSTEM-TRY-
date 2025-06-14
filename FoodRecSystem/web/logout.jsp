<%-- 
    Document   : logout
    Created on : Jun 9, 2025, 2:46:39 AM
    Author     : acer
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    session.invalidate();
%>
<html>
<head>
    <title>Logged Out</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/logout-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .logout-box {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
        }
        h2 {
            color: #333;
            margin-bottom: 10px;
        }
        p {
            color: #555;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin: 5px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="logout-box">
        <h2>You have been logged out.</h2>
        <p>Thank you for using our Food Recommendation System!</p>
        <a href="login.jsp">Log in again</a>
        <a href="index.jsp">Return to Home</a>
    </div>
</body>
</html>


