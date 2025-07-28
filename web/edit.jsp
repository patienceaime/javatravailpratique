<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nom = "", prenom = "";
    int age = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            nom = rs.getString("nom");
            prenom = rs.getString("prenom");
            age = rs.getInt("age");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Modifier utilisateur</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h2>Modifier</h2>
    <form action="UserServlet" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        <input type="text" name="nom" value="<%=nom%>" required><br>
        <input type="text" name="prenom" value="<%=prenom%>" required><br>
        <input type="number" name="age" value="<%=age%>" required><br>
        <input type="submit" name="update" value="Modifier" class="btn">
    </form>
</div>
</body>
</html>
