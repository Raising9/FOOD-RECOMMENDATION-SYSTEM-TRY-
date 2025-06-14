# 🍽️ Food Recommendation System 

A web-based platform that intelligently recommends food to users based on personal preferences, allergies, medical conditions (e.g. gout, pregnancy), and health goals (e.g. stamina boosting, diet). Built using Java (Servlets, JSP), MySQL, and follows the MVC architecture.

---

## 📌 Project Overview

In today's digital era, people are often overwhelmed with food choices. Our system aims to simplify decision-making by providing **personalized food recommendations**, enriched with **images, health information, and ingredient breakdowns**. It also allows users to submit reviews and ratings, providing real-time feedback that enhances suggestion quality.

---

## 👥 Group Members

| No | Name                                             | Matric No | Module Assigned                                |
|----|--------------------------------------------------|-----------|-------------------------------------------------|
| 1  | Nurul Syamimi Binti Kamaruddin                   | S70166    | Register & Login (User Management)              |
| 2  | Muhammad Sharmin Aiman Bin Jafri                 | S62899    | Admin Food Management                           |
| 3  | Wan Muhammad Zakwan Al-Hakim Bin Wan Mohd Azman | S63769    | Web Facts & User Reviews Module                 |
| 4  | Nur Ainin Sofia Binti Suhaimi                    | S72050    | Ingredient List & Health Recommendation Module  |

---

## 💡 Main Features

- 👥 **Login/Registration** (User/Admin role-based access)
- 🍛 **Food Management**: Add, edit, delete food with image, description, health tags
- 🧠 **Smart Recommendation**: Suggest foods based on preferences and restrictions
- 🌿 **Ingredient Warnings**: Show ingredients to avoid (e.g., for pregnancy/gout)
- 🌟 **Rating & Review**: Users can leave reviews with star ratings
- 📢 **Facts Section**: Admin updates fun developer or system facts

---

## 🧰 Technologies Used

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java Servlets, JDBC
- **Database**: MySQL (via phpMyAdmin)
- **Tools**: Apache Tomcat, NetBeans IDE
- **Architecture**: MVC (Model-View-Controller)

---

## 🧱 Project Structure

```
FoodRecSystem/
├── Web Pages/
│   ├── adminDashboard.jsp
│   ├── index.jsp
│   ├── login.jsp
│   ├── logout.jsp
│   ├── register.jsp
│   ├── userDashboard.jsp
│   └── WEB-INF/
│       ├── web.xml
│   └── images/
│       ├── curry.jpg
│       ├── login-bg.jpg
│       ├── logout-bg.jpg
│       ├── protein.jpg
│       ├── register.jpg
│       ├── salad.jpg
├── Source Packages/
│   ├── controller/
│   │   ├── LoginServlet.java, RegisterServlet.java
│   ├── dao/
│   │   └── UserDAO.java
│   └── model/
│       └── User.java
│   └── util/
│       └── DBConnection.java
├── db/
│   └── studentdb.sql
├── db.properties (excluded via .gitignore)
└── README.md
```

---

## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/your-username/FoodRecSystem.git
```

### 2. Open in NetBeans

- File → Open Project → Select the FoodRecSystem folder

### 3. Import Dependencies

Ensure the following libraries are added to your project:
- `mysql-connector-j-9.3.0.jar`
- `jstl-1.2.jar`
- `taglibs-standard-impl-1.2.5.jar`
- `taglibs-standard-jstlel-1.2.5.jar`
- `taglibs-standard-spec-1.2.5.jar`


### 4. Configure MySQL

- Create a database named `fooddb`
- Run the SQL dump: `fooddb.sql` [`db/fooddb.sql`](db/fooddb.sql) to create tables and sample data.

#### Option A: Edit `db.properties`
Update the file with your actual MySQL credentials:

```properties
jdbcURL = "jdbc:mysql://localhost:3306/fooddb";
jdbcUsername = "root";
jdbcPassword = "admin";
```

#### Option B: Use Environment Variables (No Code Changes)
You can also configure database settings via system environment variables:

- `JDBC_URL`
- `DB_USER`
- `DB_PASSWORD`

✅ If these environment variables are present, you do **not** need to modify the `DBConnection.java` file.


🚫 **Note**: This file is ignored by Git using .gitignore and should be stored in a secure, non-public location.

---

### 5. Deploy & Run

- Clean and build the project
- Deploy via NetBeans Tomcat or GlassFish
- Visit: [http://[localhost:8080/FoodRecSystem](http://localhost:8080/FoodRecSystem/)]

---

---

## 📌 Notes
- Protected pages require login session.

---
