<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*" %>
<%
    String name = null;
    String type = null;
    String imagePath = null;

    String savePath = application.getRealPath("/") + "images";
    File fileSaveDir = new File(savePath);
    if (!fileSaveDir.exists()) {
        fileSaveDir.mkdir();
    }

    try {
        MultipartRequest multi = new MultipartRequest(request, savePath, 10 * 1024 * 1024); // 10MB max
        name = multi.getParameter("foodName");
        type = multi.getParameter("foodType");
        String imageFileName = multi.getFilesystemName("image");
        imagePath = "images/" + imageFileName;

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addfood", "root", "admin");

        String sql = "INSERT INTO food (food_name, food_type, image_path) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, type);
        ps.setString(3, imagePath);

        int result = ps.executeUpdate();
        conn.close();

        if (result > 0) {
%>
<script>
    alert("Food successfully added!");
    window.location.href = "adminFoodList.jsp";
</script>
<%
        } else {
%>
<script>
    alert("Failed to add food.");
    window.history.back();
</script>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
