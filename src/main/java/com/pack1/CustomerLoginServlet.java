package com.pack1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CustomerLoginServlet") 
public class CustomerLoginServlet extends HttpServlet {
    private CustomerDAO dao = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
      {
    	System.out.println("Login servlet called...");
    	
    	
    	String username = req.getParameter("username");
    	String password = req.getParameter("password");


        CustomerBean c = dao.login(username, password);
        if (c != null) {
            HttpSession session = req.getSession();
            session.setAttribute("customer", c);
            resp.sendRedirect("CustomerHome.jsp");
        } else {
            resp.sendRedirect("CustomerLogin.html?error=Invalid");
        }
    }
}
