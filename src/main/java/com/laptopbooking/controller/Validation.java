package com.laptopbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import jakarta.servlet.annotation.WebServlet;

@WebServlet("/Validation")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter();) {
			String uname = request.getParameter("username2");
			String email = request.getParameter("email2");
			String pwd = request.getParameter("password2");
			

			if (uname.equals("Admin") & email.equals("admin@gmail.com") && pwd.equals("Admin@123")) {
				out.println("welcome admin");
				

			    request.getSession().setAttribute("username", uname); 
			    request.getSession().setAttribute("userEmail", email);
				
				RequestDispatcher rr = request.getRequestDispatcher("mainpage.jsp");
				rr.forward(request, response);
				

			} else {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb1", "root",
						"Thunder@123");
				Statement stmt = con.createStatement();

				ResultSet rs = stmt.executeQuery("select * from laptopsp");
				int flag = 0;

				while (rs.next()) {
					String dbuser = rs.getString("username");
					String dbemail = rs.getString("email");
					String dbpassword = rs.getString("password");

					if (uname.equals(dbuser) & email.equals(dbemail) && pwd.equals(dbpassword)) {
						out.println("welcome user");
						flag = 1;
						   request.getSession().setAttribute("username", dbuser);
						   request.getSession().setAttribute("userEmail", email); 
						   
						   HttpSession session = request.getSession();
						   session.setAttribute("userEmail", email); // `email` must be what you read from DB
						   System.out.println("Login success, email stored in session: " + email);
						   
						RequestDispatcher rr = request.getRequestDispatcher("mainpage.jsp");
						rr.forward(request, response);
						

					}

				}
				if (flag == 0) {
					out.println("username or password incorrect");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.include(request, response);
				}
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}

