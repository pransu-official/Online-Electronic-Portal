<%@page import="com.pack1.ProductBean"%>
<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product | Admin Panel</title>

<style>
  body {
    margin: 0;
    padding: 0;
    font-family: "Segoe UI", sans-serif;
    background: linear-gradient(135deg, #226696, #343030);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .container {
    width: 400px;
    background: #c8c3c3;
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0 5px 25px rgba(24, 1, 1, 0.1);
    text-align: center;
  }

  h2 {
    color: #03214d;
    margin-bottom: 10px;
  }

  p {
    color: #011b0f;
    font-size: 14px;
    margin-bottom: 25px;
  }

  label {
    display: block;
    text-align: left;
    font-weight: 600;
    margin-bottom: 5px;
    color: #790505;
  }

  input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #bbb;
    border-radius: 10px;
    margin-bottom: 20px;
    transition: 0.3s;
  }

  input[type="text"]:focus {
    border-color: #0d3b7f;
    outline: none;
    box-shadow: 0 0 5px rgba(3, 17, 39, 0.4);
  }

  .btn {
    background: #00050b;
    color: rgb(226, 220, 220);
    border: none;
    padding: 10px 20px;
    border-radius: 25px;
    cursor: pointer;
    font-weight: 600;
    transition: 0.3s;
  }

  .btn:hover {
    background: #694f0b;
    transform: scale(1.05);
  }

  .cancel-btn {
    background: #2a0202;
    color: #e7dede;
    margin-left: 10px;
  }

  .cancel-btn:hover {
    background: #224680;
  }
</style>
</head>
<body>
<%
  AdminBean ab = (AdminBean)session.getAttribute("abean");
  ProductBean pb = (ProductBean)request.getAttribute("pbean");
%>


<div class="container">
  <h2>Hello, Mr. <%= ab.getaFname() %> 👋</h2>
  <p>Below are the product details available for editing.</p>

  <form action="update" method="post">
    <label>Product Price</label>
    <input type="text" name="pprice" value="<%=pb.getpPrice()%>" required>

    <label>Product Quantity</label>
    <input type="text" name="pqty" value="<%=pb.getpQty()%>" required>

    <input type="hidden" name="pcode" value="<%=pb.getpCode()%>">

    <button type="submit" class="btn">Update Product</button>
    <a href="viewProducts" class="btn cancel-btn">Cancel</a>
  </form>
</div>

</body>
</html>
