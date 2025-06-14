<%-- 
    Document   : register
    Created on : Jun 9, 2025, 2:09:33 AM
    Author     : acer
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register - Food Recommendation System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: url("images/register-bg.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-wrapper {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px;
            width: 400px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            backdrop-filter: blur(6px);
        }
        h2 {
            margin-bottom: 24px;
            text-align: center;
            color: #222;
            font-size: 26px;
            font-weight: 600;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #444;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            width: 100%;
            background: #007bff;
            color: #fff;
            padding: 12px;
            border: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #0056b3;
        }
        .switch-link {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        .switch-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 12px;
        }
    </style>
</head>
<body>
    <div class="form-wrapper">
        <h2>Create Your Account</h2>
        <form action="register" method="post">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" required>

            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>

            <label for="repassword">Re-type Password</label>
            <input type="password" name="repassword" id="repassword" required>

            <label for="role">Role</label>
            <select name="role" id="role" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>

            <button type="submit">Create Account</button>

            <p class="error"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
        </form>
        <div class="switch-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>

