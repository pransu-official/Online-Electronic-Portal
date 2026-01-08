<%@page import="java.util.Iterator"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Products</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        margin:0;
        padding:0;
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(135deg,#1a1a2e,#162447);
        color: #fff;
    }
    .container {
        width: 90%;
        max-width: 1200px;
        margin: 120px auto 50px auto;
        display: grid;
        grid-template-columns: repeat(auto-fit,minmax(280px,1fr));
        gap: 20px;
    }
    .header {
        text-align: center;
        margin-top: 80px;
    }
    .header h1 {
        color: #9ACD32;
        margin-bottom: 10px;
    }
    .header p {
        color: #ccc;
        font-size: 1.1rem;
    }
    .product-card {
        background: rgba(30,30,40,0.95);
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.6);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 30px rgba(0,0,0,0.7);
    }
    .product-card h2 {
        margin-bottom: 10px;
        color: #00FF7F;
    }
    .product-card p {
        margin-bottom: 8px;
        color: #ccc;
    }
    .buttons {
        margin-top: 15px;
    }
    .buttons a {
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 8px;
        margin-right: 10px;
        font-weight: bold;
        transition: 0.3s ease;
    }
    .edit-btn {
        background: #4caf50;
        color: #fff;
    }
    .edit-btn:hover {
        background: #3e8e41;
    }
    .delete-btn {
        background: #f44336;
        color: #fff;
    }
    .delete-btn:hover {
        background: #c62828;
    }
    .logout {
        display: inline-block;
        margin: 40px auto 20px auto;
        padding: 12px 25px;
        background: #ff6f61;
        color: #fff;
        border-radius: 10px;
        text-decoration: none;
        transition: 0.3s ease;
    }
    .logout:hover {
        background: #ff3b2e;
    }
    @media(max-width:600px){
        .container {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>

<div class="header">
    <%
    AdminBean abean = (AdminBean) session.getAttribute("abean");
    if (abean != null) {
        out.println("<h1>Welcome, Mr. " + abean.getaFname() + "</h1>");
        out.println("<p>Below are your Product Details</p>");
    } else {
        // redirect to login page if admin not logged in
        response.sendRedirect("AdminLogin.html");
    }
    %>
</div>

<div class="container">
    <%
        ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
        if(al==null || al.size()==0){
            out.println("<p style='text-align:center; color:#ff6f61; font-size:1.2rem;'>Products are Not Available</p>");
        } else {
            Iterator<ProductBean> i=al.iterator();
            while(i.hasNext()){
                ProductBean pb=i.next();
    %>
        <div class="product-card">
            <h2><%=pb.getpName()%></h2>
            <p><strong>Code:</strong> <%=pb.getpCode()%></p>
            <p><strong>Company:</strong> <%=pb.getpCompany()%></p>
            <p><strong>Price:</strong> $<%=pb.getpPrice()%></p>
            <p><strong>Quantity:</strong> <%=pb.getpQty()%></p>
            <div class="buttons">
                <a href="edit?pcode=<%=pb.getpCode()%>" class="edit-btn">Edit</a>
                <a href="delete?pcode=<%=pb.getpCode()%>" class="delete-btn">Delete</a>
            </div>
        </div>
    <%
            }
        }
    %>
</div>

<center>
    <a href="logout" class="logout">Logout</a>
</center>

</body>
</html>
