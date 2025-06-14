<%-- 
    Document   : index
    Created on : Jun 9, 2025, 2:08:49 AM
    Author     : acer
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");
%>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">

    <title>Food Recommendation System</title>
    <style>
    body {
    font-family: 'Segoe UI', sans-serif;
    margin: 0;
    padding: 0;
    background: url("images/logout-bg.jpg") no-repeat center center fixed;
    background-size: cover;
    color: #333;
}

header {
    padding: 20px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    background: rgba(255, 255, 255, 0.8); /* optional semi-transparent white */
}

header h1 {
    font-family: 'Montserrat', sans-serif;
    font-size: 36px;
    color: #1e1e1e;
    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.6);
    margin: 0;
}


.auth-buttons a {
    background: #007bff;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    border-radius: 6px;
    margin-left: 10px;
    font-weight: bold;
}
.auth-buttons a:hover {
    background: #0056b3;
}

.intro {
    padding: 60px 40px;
    text-align: center;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
}

.intro-box {
    background: rgba(0, 0, 0, 0.6);
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
    max-width: 800px;
}

.intro p {
    font-size: 20px;
    margin-bottom: 30px;
    font-weight: 500;
    color: #f1f1f1;
}

.intro button {
    background-color: #28a745;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
}
.intro button:hover {
    background-color: #218838;
}

/* ✅ Update review section to be transparent */
.reviews {
    padding: 60px 40px;
    text-align: center;
    background: transparent;
}

.reviews h2 {
    background: rgba(0, 0, 0, 0.6);
    color: #f1f1f1;
    padding: 20px 40px;
    border-radius: 12px;
    display: inline-block;
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
}

.review-list {
    display: flex;
    justify-content: center;
    gap: 20px;
    flex-wrap: wrap;
    margin-top: 30px;
}

.review {
    background: rgba(255, 255, 255, 0.85);
    padding: 30px;
    width: 350px;
    font-size: 18px;
    line-height: 1.6;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    border-radius: 10px;
    transition: transform 0.3s ease;
}
.review:hover {
    transform: scale(1.03);
}

</style>

</head>
<body>
    <header>
        <h1>Food Recommendation System</h1>
        <div class="auth-buttons">
            <a href="login.jsp">Log in</a>
            <a href="register.jsp">Register</a>
        </div>
    </header>
    <main>
        <section class="intro">
            <div class="intro-box">
                <p>Discover food that fits your taste, lifestyle, and health needs — all in one smart platform. Personalized recommendations, real user reviews, and nutrition-conscious suggestions, tailored just for you.</p>
                <button>View Recommendations</button>
            </div>
        </section>
        <section class="reviews">
            <h2>Reviews</h2>
            <div class="review-list">
                <div class="review">“The chocolate mousse was amazing!”<br>– Mr Yuzu L 🌟🌟🌟🌟</div>
                <div class="review">“The grilled chicken was tasty...”<br>– Ms Sarah K 🌟🌟🌟🌟</div>
                <div class="review">“Super fresh and juicy oranges...”<br>– Mr Chen T.H 🌟🌟🌟🌟</div>
            </div>
        </section>
    </main>
</body>
</html>
