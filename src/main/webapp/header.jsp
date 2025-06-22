<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String username = null;
    if (session != null) {
        username = (String) session.getAttribute("username");
    }
%>

<header style="background: linear-gradient(to right, #38B189, #2f8f72); color: white; padding: 30px 20px; text-align: center; position: relative; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
  <h1 style="margin: 0;">Welcome to Laptop Service Portal</h1>
  <p style="margin-top: 5px;">Manage all your laptop service needs in one place</p>

  <!-- Top-Right Login or Logout -->
  <div style="position: absolute; top: 20px; right: 20px; font-size: 14px;">
    <% if (username != null) { %>
      👤 <strong><%= username %></strong> |
      <a href="index.jsp" style="color: white; text-decoration: underline;">Logout</a>
    <% } else { %>
      <a href="index.jsp" style="color: white; text-decoration: underline;">Login</a>
    <% } %>
  </div>
</header>
