<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard | Electronic Portal</title>

<style>
  /* ======= Global Reset ======= */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
  }

  body {
    background: radial-gradient(circle at top, #10121b, #060608);
    color: #fff;
    min-height: 100vh;
    overflow-x: hidden;
  }

  /* ======= Curved Header Section ======= */
  .header {
    position: relative;
    background: linear-gradient(135deg, #121428, #191b33);
    padding: 80px 20px 140px;
    border-bottom-left-radius: 50% 20%;
    border-bottom-right-radius: 50% 20%;
    text-align: center;
    color: white;
    box-shadow: 0 5px 20px rgba(0,0,0,0.6);
  }

  .header h1 {
    font-size: 2.5em;
    background: linear-gradient(90deg, #a855f7, #22d3ee);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    font-weight: 700;
    letter-spacing: 1px;
  }

  .header p {
    color: #ccc;
    margin-top: 10px;
    font-size: 1.1em;
  }

  /* ======= Navigation Bar ======= */
  .nav {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 25px;
    flex-wrap: wrap;
  }

  .nav a {
    text-decoration: none;
    padding: 12px 25px;
    border-radius: 25px;
    color: #fff;
    background: linear-gradient(90deg, #2563eb, #38bdf8);
    transition: all 0.3s ease;
    font-weight: 500;
  }

  .nav a:hover {
    transform: scale(1.05);
    background: linear-gradient(90deg, #a855f7, #22d3ee);
    box-shadow: 0 0 10px rgba(56,189,248,0.5);
  }

  /* ======= Dashboard Main Section ======= */
  .dashboard {
    max-width: 1100px;
    margin: -60px auto 40px;
    padding: 30px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 25px;
  }

  .card {
    background: #151728;
    border-radius: 20px;
    padding: 25px;
    box-shadow: 0 0 20px rgba(0,0,0,0.3);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
    backdrop-filter: blur(8px);
    border: 1px solid rgba(255,255,255,0.05);
  }

  .card:hover {
    transform: translateY(-8px);
    box-shadow: 0 0 25px rgba(168,85,247,0.4);
  }

  .card img {
    width: 80px;
    height: 80px;
    margin-bottom: 15px;
    filter: drop-shadow(0 0 8px rgba(56,189,248,0.6));
  }

  .card h3 {
    margin-bottom: 10px;
    font-size: 1.3em;
    background: linear-gradient(90deg, #a855f7, #22d3ee);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .card p {
    font-size: 0.9em;
    color: #bbb;
  }

  /* ======= Footer ======= */
  footer {
    text-align: center;
    color: #777;
    padding: 20px 0 40px;
    font-size: 0.9em;
  }

  footer span {
    color: #22d3ee;
  }

  @media(max-width: 600px){
    .header h1 { font-size: 1.8em; }
    .nav a { padding: 10px 18px; font-size: 0.9em; }
  }
</style>
</head>

<body>

  <!-- ======= Header ======= -->
  <div class="header">
    <h1>Admin Dashboard</h1>
    <p>
      <%
        AdminBean abean = (AdminBean)session.getAttribute("abean");
        if(abean != null) {
            out.print("Welcome Mr. " + abean.getaFname() + " 👋");
        } else {
            out.print("Welcome, Admin 👋");
        }
      %>
    </p>
    <div class="nav">
      <a href="AddProduct.html">Add Product</a>
      <a href="view1">View Products</a>
      <a href="CustomerLogin.html">View Customers</a>
    </div>
  </div>

  <!-- ======= Dashboard Cards ======= -->
  <div class="dashboard">
    <div class="card">
      <img src="https://cdn-icons-png.flaticon.com/512/2830/2830330.png" alt="Add Product">
      <h3> <a href="AddProduct.html">Add Product</a></h3>
      <p>Add new electronic items to your online store easily.</p>
      
    </div>

    <div class="card">
      <img src="https://cdn-icons-png.flaticon.com/512/2921/2921222.png" alt="View Products">
      <h3> <a href="view1">View Products</a></h3>
      <p>See and manage all products currently in your catalog.</p>
    </div>

    <div class="card">
      <img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="Customers">
      <h3><a href="CustomerLogin.html">View Customers</a></h3>
      <p>Check details of your registered customers and their activities.</p>
    </div>

  <!-- ======= Footer ======= -->
  <footer>
    © 2025 <span>Electronic Portal</span>
  </footer>

</body>
</html>
