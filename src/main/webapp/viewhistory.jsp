<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.laptopbooking.model.ServiceRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Service History</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Fonts & Style -->
  <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f0f0f0;
      margin: 0;
      padding: 0;
    }

    header {
      background: #2f8f72;
      color: white;
      text-align: center;
      padding: 25px;
    }

    .container {
      max-width: 1000px;
      margin: 40px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    }

    h2 {
      margin-bottom: 20px;
      text-align: center;
      color: #2f8f72;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 14px 18px;
      text-align: left;
    }

    th {
      background-color: #38B189;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .back-btn {
      margin-top: 30px;
      display: inline-block;
      background: #38B189;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
    }

    .back-btn:hover {
      background: #2f8f72;
    }

    footer {
      text-align: center;
      padding: 15px;
      background: #2f8f72;
      color: white;
      margin-top: 50px;
    }

    .no-data {
      text-align: center;
      padding: 40px;
      color: #777;
      font-style: italic;
    }
  </style>
</head>
<body>

<%
  List<ServiceRequest> history = (List<ServiceRequest>) request.getAttribute("history");
%>

<header>
  <h1>Service History</h1>
  <p>Here are your past service requests</p>
</header>

<div class="container">
  <h2>Your Submitted Requests</h2>

  <table>
    <thead>
      <tr>
        <th>Customer Name</th>
        <th>Laptop Name</th>
        <th>Issue</th>
        <th>Phone</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <%
        if (history != null && !history.isEmpty()) {
          for (ServiceRequest s : history) {
      %>
      <tr>
        <td><%= s.getCustomerName() %></td>
        <td><%= s.getLaptopName() %></td>
        <td><%= s.getIssue() %></td>
        <td><%= s.getPhone() %></td>
        <td><%= s.getDescription() %></td>
      </tr>
      <%
          }
        } else {
      %>
      <tr><td colspan="5" class="no-data">No service history found.</td></tr>
      <%
        }
      %>
    </tbody>
  </table>

  <a href="mainpage.jsp" class="back-btn">⬅ Back to Dashboard</a>
</div>

<footer>
  &copy; 2025 Laptop Service Management | Powered by Praveenkumar
</footer>

</body>
</html>
