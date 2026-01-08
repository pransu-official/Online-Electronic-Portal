<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
   List<Map<String,Object>> products = (List<Map<String,Object>>) request.getAttribute("products");
   if (products == null) products = new ArrayList<>();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products</title>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
      
       background: linear-gradient(to right, #052726, #0b6c6b);
        color: #120202;
    }

    h3 {
        text-align: center;
        margin: 30px 0 20px 0;
        font-size: 32px;
        color: hsl(125, 66%, 54%);
        text-shadow: 1px 1px 2px rgb(228, 53, 53);
    }

    table {
        width: 90%;
        max-width: 1000px;
        margin: 0 auto 30px auto;
        border-collapse: collapse;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        border-radius: 10px;
        overflow: hidden;
         background: #586465;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
    }

    th {
        background: linear-gradient(to right, #5c2795, #2575fc);
        color: #c2e75d;
        font-size: 18px;
    }

    tr:nth-child(even) {
        background: #586465;
    }

    tr:hover {
        background: #7c7fdd;
        transform: scale(1.02);
        transition: 0.3s;
    }

    button {
        padding: 8px 15px;
        border: none;
        border-radius: 6px;
        background: #380c3e;
        color: #a9c9e7;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #f7397e;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-bottom: 30px;
        font-size: 18px;
        font-weight: bold;
        color: #3c82f9;
        text-decoration: none;
        transition: 0.3s;
    }

    .back-link:hover {
        color: #994ee8;
    }

    @media (max-width: 768px) {
        th, td {
            padding: 10px 8px;
            font-size: 14px;
        }

        h3 {
            font-size: 28px;
        }

        button {
            padding: 6px 12px;
            font-size: 14px;
        }

        .back-link {
            font-size: 16px;
        }
    }

    @media (max-width: 480px) {
        table, th, td {
            font-size: 12px;
        }

        th, td {
            padding: 8px 5px;
        }

        button {
            padding: 5px 10px;
        }
    }
</style>
</head>
<body>
<h3>Products</h3>
<table border="1">
    <tr>
        <th>PCode</th>
        <th>Name</th>
        <th>Company</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Action</th>
    </tr>
    <% for (Map<String,Object> p : products) { %>
    <tr>
        <td><%= p.get("pcode") %></td>
        <td><%= p.get("pname") %></td>
        <td><%= p.get("pcompany") %></td>
        <td><%= p.get("price") %></td>
        <td><%= p.get("qty") %></td>
        <td>
            <form action="BuyProduct.jsp" method="get">
                <input type="hidden" name="pcode" value="<%= p.get("pcode") %>"/>
                <button type="submit">Buy</button>
            </form>
        </td>
    </tr>
    <% } %>
</table>
<a href="CustomerHome.jsp" class="back-link">← Back to Home</a>
</body>
</html>
