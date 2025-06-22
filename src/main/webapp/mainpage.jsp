<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Laptop Service Dashboard</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;600&display=swap" rel="stylesheet">

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f2f2f2;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    header {
      background: linear-gradient(to right, #38B189, #2f8f72);
      color: white;
      padding: 30px 20px;
      text-align: center;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    h1 {
      margin-bottom: 10px;
      font-size: 28px;
    }

    .container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      padding: 40px 30px;
      flex: 1;
    }

    .card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
      padding: 25px 20px;
      text-align: center;
      transition: 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card h3 {
      color: #2f8f72;
      font-size: 20px;
      margin-bottom: 10px;
    }

    .card p {
      font-size: 14px;
      color: #555;
      margin-bottom: 20px;
    }

    .btn {
      padding: 10px 22px;
      background: linear-gradient(to right, #38B189, #2f8f72);
      color: white;
      font-weight: bold;
      text-decoration: none;
      border-radius: 25px;
      transition: 0.3s ease;
      display: inline-block;
    }

    .btn:hover {
      background: linear-gradient(to right, #2f8f72, #38B189);
      transform: scale(1.05);
    }

    footer {
      text-align: center;
      padding: 15px;
      background: #2f8f72;
      color: white;
      font-size: 14px;
      margin-top: auto;
    }
  </style>
</head>

<body>

<jsp:include page="header.jsp" />
  

  <div class="container">

    <div class="card">
      <h3>🛠️ Book a Service</h3>
      <p>Submit a new service request for your laptop.</p>
      <a href="BookServiceServlet.jsp" class="btn">Book Now</a>
    </div>

    <div class="card">
      <h3>📜 View Service History</h3>
      <p>Check your past service records and feedback.</p>
     <!-- <a href="viewhistory.jsp" class="btn">View History</a>-->
      <a href="ViewServiceHistoryServlet" class="btn">View History</a>
      
    </div>

    <div class="card">
      <h3>🧾 Invoice Generation</h3>
      <p>Download your service invoice or receipt.</p>
      <a href="invoice.jsp" class="btn">Get Invoice</a>
    </div>

    <div class="card">
      <h3>⭐ Rate and Review</h3>
      <p>Give feedback on the service you received.</p>
      <a href="rateReview.jsp" class="btn">Leave Review</a>
    </div>

    <div class="card">
      <h3>📩 Contact Support</h3>
      <p>Need help? Contact our support team.</p>
      <a href="contact.jsp" class="btn">Contact Us</a>
    </div>

    <div class="card">
      <h3>📝 Browse Laptops</h3>
      <p>Explore a range of laptops from low to high specs.</p>
      <a href="laptops.jsp" class="btn">View Laptops</a>
    </div>

  </div>

  <footer>
    &copy; 2025 Laptop Service Management System | Designed by Praveenkumar
  </footer>
</body>
</html>
