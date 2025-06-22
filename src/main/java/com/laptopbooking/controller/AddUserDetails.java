package com.laptopbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUserDetails")

public class AddUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usern = request.getParameter("username");
		String em = request.getParameter("email");
		String pw = request.getParameter("password");

		try (PrintWriter out = response.getWriter()) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb1", "root", "Thunder@123");

			String query = "INSERT INTO laptopsp (username, email, password) VALUES (?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, usern);
			pstmt.setString(2, em);
			pstmt.setString(3, pw);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				response.sendRedirect("index.html?success=true");
			} else {
				out.println("<h3>Registration failed. Try again.</h3>");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			response.getWriter().println("<h3>Driver not found: " + e.getMessage() + "</h3>");
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println("<h3>SQL Error: " + e.getMessage() + "</h3>");
		}
	}
}
