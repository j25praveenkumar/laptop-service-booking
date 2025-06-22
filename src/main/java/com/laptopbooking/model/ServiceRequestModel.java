package com.laptopbooking.model;

import java.sql.*;

public class ServiceRequestModel {

    public boolean bookService(String customerName, String laptopName, String issue, String phone, String description,String email) {
        boolean status = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Customerdata", "root", "Thunder@123");

            String sql = "INSERT INTO service_requests (customer_name, laptop_name, issue, phone, description, email) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, customerName);
            stmt.setString(2, laptopName);
            stmt.setString(3, issue);
            stmt.setString(4, phone);
            stmt.setString(5, description);
            stmt.setString(6, email);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                status = true;
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
           // System.out.println("SQL Exception Message: " + e.getMessage());
        }

        return status;
    }
}

