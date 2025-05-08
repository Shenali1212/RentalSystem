package com.reguser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/checkUsername")
public class CheckUsernameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        // Perform database check (adjust database connection code as necessary)
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT COUNT(*) FROM regusers WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                response.getWriter().write("taken");
            } else {
                response.getWriter().write("available");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

