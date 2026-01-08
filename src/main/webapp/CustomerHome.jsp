<%@ page import="com.pack1.CustomerBean" %>
<%@ page session="true" %>
<%
    CustomerBean c = (CustomerBean) session.getAttribute("customer");
    if (c == null) {
        response.sendRedirect("CustomerLogin.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
       background: linear-gradient(to right, #613195, #680635);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .welcome-container {
         background: #ddd0ce;
        padding: 40px 30px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    .welcome-container h3 {
        margin-bottom: 30px;
        font-size: 28px;
         color: #120101;
    }

    .welcome-container a {
        display: inline-block;
        margin: 10px 15px;
        padding: 12px 25px;
        text-decoration: none;
        font-weight: bold;
        border: 1px solid #050516;
        color: #030008;
        background: #ab96ae;
        transition: 0.3s;
    }

    .welcome-container a:hover {
        background: #540241;
    }

    @media (max-width: 500px) {
        .welcome-container {
            padding: 30px 20px;
        }

        .welcome-container a {
            margin: 10px 5px;
            padding: 10px 20px;
        }
    }
</style>
</head>
<body>
  <div class="welcome-container">
    <h3>Welcome <%= c.getFirstname() != null ? c.getFirstname() : c.getUsername() %></h3>
    
    <a href="ProductListServlet">View Products</a>
    <a href="logout2.jsp">Logout</a>
  </div>
</body>
</html>
