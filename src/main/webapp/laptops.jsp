<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Browse Laptops</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google Fonts + Basic Styles -->
  <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    header {
      background: #2f8f72;
      color: white;
      padding: 20px;
      text-align: center;
    }

    h2 {
      margin: 0;
      font-size: 26px;
    }

    .container {
      padding: 30px;
      max-width: 1000px;
      margin: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    th, td {
      padding: 15px 20px;
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
      margin-top: 20px;
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
      background-color: #2f8f72;
      color: white;
      text-align: center;
      padding: 15px;
      margin-top: 40px;
    }
  </style>
</head>
<body>

<header>
  <h2>Available Laptops</h2>
  <p>Explore laptops from basic to high-end configurations</p>
</header>

<div class="container">
  <table>
    <tr>
      <th>Brand</th>
      <th>Model</th>
      <th>Processor</th>
      <th>RAM</th>
      <th>Price</th>
    </tr>

    <!-- Sample Static Data -->
    <tr>
      <td>HP</td>
      <td>14s</td>
      <td>Intel i3 11th Gen</td>
      <td>8 GB</td>
      <td>₹38,999</td>
    </tr>
    <tr>
      <td>Dell</td>
      <td>Inspiron 3511</td>
      <td>Intel i5 12th Gen</td>
      <td>16 GB</td>
      <td>₹58,990</td>
    </tr>
    <tr>
      <td>Asus</td>
      <td>VivoBook 15</td>
      <td>Ryzen 5</td>
      <td>8 GB</td>
      <td>₹45,500</td>
    </tr>
    <tr>
      <td>Lenovo</td>
      <td>IdeaPad Slim 5</td>
      <td>Intel i7 13th Gen</td>
      <td>16 GB</td>
      <td>₹78,000</td>
    </tr>
    <tr>
      <td>Apple</td>
      <td>MacBook Air M2</td>
      <td>Apple M2</td>
      <td>8 GB</td>
      <td>₹1,08,000</td>
    </tr>
  </table>

  <a href="mainpage.jsp" class="back-btn">⬅ Back to Dashboard</a>
</div>

<footer>
  &copy; 2025 Laptop Service Management | Powered by Praveenkumar
</footer>

</body>
</html>
    