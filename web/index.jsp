<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des utilisateurs</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Utilisateurs</h1>
    <a href="add.jsp" class="btn">Ajouter</a>
    <table>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Âge</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("nom") %></td>
            <td><%= rs.getString("prenom") %></td>
            <td><%= rs.getInt("age") %></td>
            <td>
                <a href="edit.jsp?id=<%=rs.getInt("id")%>">Modifier</a> |
                <a href="UserServlet?action=delete&id=<%=rs.getInt("id")%>">Supprimer</a>
            </td>
        </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("Erreur: " + e.getMessage());
            }
        %>
    </table>
</div>
</body>
</html>
