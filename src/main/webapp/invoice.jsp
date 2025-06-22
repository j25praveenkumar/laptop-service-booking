<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.laptopbooking.model.ServiceRequest" %>
<%
    ServiceRequest sr = (ServiceRequest) request.getAttribute("serviceRequest");

    String customerName = sr.getCustomerName();
    String phone = sr.getPhone();
    String issue = sr.getIssue();
    int amount = 0;

    switch(issue.toLowerCase()) {
        case "replace battery": amount = 1500; break;
        case "replace keyboard": amount = 1000; break;
        case "general service": amount = 700; break;
        default: amount = 500; // fallback
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Invoice</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    .invoice-box {
      border: 1px solid #ddd;
      padding: 20px;
      border-radius: 10px;
      max-width: 600px;
      margin: auto;
    }
    h2 { text-align: center; color: #2f8f72; }
    table { width: 100%; margin-top: 20px; }
    td { padding: 8px; }
    .btn {
      display: block;
      width: 200px;
      margin: 30px auto 0;
      padding: 10px;
      background: #2f8f72;
      color: white;
      text-align: center;
      text-decoration: none;
      border-radius: 5px;
    }
  </style>
</head>
<body>

<div class="invoice-box">
  <h2>Laptop Service Invoice</h2>
  <table>
    <tr><td><strong>Customer Name:</strong></td><td><%= customerName %></td></tr>
    <tr><td><strong>Phone:</strong></td><td><%= phone %></td></tr>
    <tr><td><strong>Issue:</strong></td><td><%= issue %></td></tr>
    <tr><td><strong>Amount:</strong></td><td>₹<%= amount %></td></tr>
    <tr><td><strong>Warranty:</strong></td><td>6 Months Service Warranty</td></tr>
  </table>

  <form action="GenerateInvoicePDF" method="post">
    <input type="hidden" name="name" value="<%= customerName %>"/>
    <input type="hidden" name="phone" value="<%= phone %>"/>
    <input type="hidden" name="issue" value="<%= issue %>"/>
    <input type="hidden" name="amount" value="<%= amount %>"/>
    <button class="btn" type="submit">📄 Download PDF</button>
  </form>
</div>

</body>
</html>
    