<%@ page import="com.pack1.ProductDAO" %>
<%@ page import="java.util.Map" %>
<%
   String pcode = request.getParameter("pcode");
   ProductDAO dao = new ProductDAO();
   Map<String,Object> prod = null;
   if (pcode != null) prod = dao.getProduct(pcode);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Buy Product</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #246b33, #11034b);
        color: #0e0e01;
    }

    .container {
        max-width: 500px;
        margin: 50px auto;
        background: linear-gradient(to right, #e6e5c5, #360cdc);
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        padding: 30px;
    }

    h3 {
        text-align: center;
        color: #430c27;
        font-size: 28px;
        margin-bottom: 25px;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    form b {
        color: #333;
    }

    input[type="number"] {
        padding: 10px;
        border-radius: 8px;
        border: 2px solid #010316;
        font-size: 16px;
        width: 100%;
        box-sizing: border-box;
        transition: 0.3s;
    }

    input[type="number"]:focus {
        border-color: #929fb7;
        box-shadow: 0 0 5px #63d3d8;
        outline: none;
    }

    button {
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: #250103;
        color: #ffffff;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #325207;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        font-weight: bold;
        color: #380e47;
        text-decoration: none;
        transition: 0.3s;
    }

    .back-link:hover {
        color: #090445;
    }

    p.message {
        text-align: center;
        font-size: 18px;
        margin: 30px 0;
    }

    @media (max-width: 480px) {
        .container {
            margin: 30px 20px;
            padding: 20px;
        }

        h3 {
            font-size: 24px;
        }

        input[type="number"], button {
            font-size: 14px;
        }
    }
</style>
</head>
<body>

<div class="container">
<% if (prod == null) { %>
    <p class="message">Product not found.</p>
    <a href="viewProducts" class="back-link">← Back to Products</a>
<% } else { %>
    <h3>Buy - <%= prod.get("pname") %></h3>
    <form action="BuyProductServlet" method="post">
        <input type="hidden" name="pcode" value="<%= prod.get("pcode") %>"/>
        Name: <b><%= prod.get("pname") %></b><br>
        Company: <b><%= prod.get("pcompany") %></b><br>
        Price: <b>$<%= prod.get("price") %></b><br>
        Available Qty: <b><%= prod.get("qty") %></b><br>
        Quantity to buy: <input type="number" name="pqty" min="1" max="<%= prod.get("qty") %>" value="1"/>
        <button type="submit">Confirm Buy</button>
    </form>
    <a href="ViewCuProduct.jsp" class="back-link">Back to Home</a>
<% } %>
</div>

</body>
</html>
