/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        int age = Integer.parseInt(request.getParameter("age"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");

            if (request.getParameter("update") != null) {
                PreparedStatement ps = conn.prepareStatement("UPDATE users SET nom=?, prenom=?, age=? WHERE id=?");
                ps.setString(1, nom);
                ps.setString(2, prenom);
                ps.setInt(3, age);
                ps.setInt(4, Integer.parseInt(idStr));
                ps.executeUpdate();
            } else {
                PreparedStatement ps = conn.prepareStatement("INSERT INTO users (nom, prenom, age) VALUES (?, ?, ?)");
                ps.setString(1, nom);
                ps.setString(2, prenom);
                ps.setInt(3, age);
                ps.executeUpdate();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
                PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE id = ?");
                ps.setInt(1, id);
                ps.executeUpdate();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("index.jsp");
    }
}
