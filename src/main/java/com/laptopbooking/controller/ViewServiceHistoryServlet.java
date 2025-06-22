package com.laptopbooking.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;	

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.laptopbooking.model.ServiceRequest;

@WebServlet("/ViewServiceHistoryServlet")
public class ViewServiceHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("index.html");
            return;
        }

        String userEmail = ((String) session.getAttribute("userEmail")).trim().toLowerCase();
        System.out.println("Email from session: " + userEmail);

        ArrayList<ServiceRequest> historyList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Customerdata", "root", "Thunder@123");
                 PreparedStatement stmt = conn.prepareStatement(
                         "SELECT * FROM service_requests WHERE LOWER(email) = ?")) {

                stmt.setString(1, userEmail);

                try (ResultSet rs = stmt.executeQuery()) {
                    int count = 0;
                    while (rs.next()) {
                        ServiceRequest sr = new ServiceRequest();
                        sr.setCustomerName(rs.getString("customer_name"));
                        sr.setLaptopName(rs.getString("laptop_name"));
                        sr.setIssue(rs.getString("issue"));
                        sr.setPhone(rs.getString("phone"));
                        sr.setDescription(rs.getString("description"));
                        historyList.add(sr);
                        count++;
                    }
                    System.out.println("✅ Total service records found: " + count);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("history", historyList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewhistory.jsp");
        dispatcher.forward(request, response);
    }
}
