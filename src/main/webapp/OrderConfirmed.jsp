<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmed</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        background: #516008;
        color: #beabab;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        background: #3f3804;
        padding: 40px 30px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(74, 157, 172, 0.879);
        text-align: center;
        height: 400px;
        width: 500px;
    }

    h3 {
        color: #43f76d;
        font-size: 32px;
        margin-bottom: 25px;
    }

    p {
        font-size: 18px;
        margin: 10px 0;
    }

    b {
        color: #759ee4;
    }

    .links {
        margin-top: 25px;
    }

    .links a {
        text-decoration: none;
        color: #fff;
        background: #01112c;
        padding: 10px 20px;
        border-radius: 8px;
        font-weight: bold;
        margin: 0 10px;
        display: inline-block;
        transition: 0.3s;
    }

    .links a:hover {
        background: #926dba;
    }

    @media (max-width: 480px) {
        .container {
            padding: 30px 20px;
        }

        h3 {
            font-size: 28px;
        }

        p {
            font-size: 16px;
        }

        .links a {
            padding: 8px 15px;
            font-size: 14px;
            margin: 5px;
        }
    }
</style>
</head>
<body>
<div class="container">
    <h3>Order Confirmed</h3>
    <p>Request No: <b><%= request.getAttribute("reqNo") %></b></p>
    <p>Total Amount: ₹<b><%= request.getAttribute("amount") %></b></p>
    <div class="links">
        <a href="ViewCuProduct">Buy More</a>
        <a href="CustomerHome.jsp">Home</a>
    </div>
</div>
</body>
</html>
