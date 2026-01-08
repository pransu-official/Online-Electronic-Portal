package com.pack1;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CustomerRegistrationServlet")
public class CustomerRegisterServlet extends HttpServlet {
    private CustomerDAO dao = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        CustomerBean c = new CustomerBean();
        c.setUsername(req.getParameter("username"));
        c.setPassword(req.getParameter("password"));
        c.setFirstname(req.getParameter("firstname"));
        c.setLastname(req.getParameter("lastname"));
        c.setAddress(req.getParameter("address"));
        c.setEmail(req.getParameter("email"));
        c.setMobile(req.getParameter("mobile"));

        boolean ok = dao.register(c);
        if (ok) {
            resp.sendRedirect("CustomerLogin.html");
        } else {
            resp.sendRedirect("CustomerRegister.html?error=RegistrationFailed");
        }
    }
}
