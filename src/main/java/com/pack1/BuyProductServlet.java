package com.pack1;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@WebServlet("/BuyProductServlet")
public class BuyProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            resp.sendRedirect("CustomerLogin.html?error=PleaseLogin");
            return;
        }

        CustomerBean c = (CustomerBean) session.getAttribute("customer");
        String pcode = req.getParameter("pcode");
        int qty = Integer.parseInt(req.getParameter("pqty"));

        Map<String, Object> product = productDAO.getProduct(pcode);
        if (product == null) {
            resp.sendRedirect("ViewProduct.jsp?error=InvalidProduct");
            return;
        }

        double price = Double.parseDouble(product.get("price").toString());
        double amount = price * qty;
        String reqNo = "REQ-" + UUID.randomUUID().toString().substring(0,8);

        boolean updated = productDAO.updateQty(pcode, qty);
        if (!updated) {
            resp.sendRedirect("BuyProduct.jsp?pcode="+pcode+"&error=InsufficientStock");
            return;
        }

        boolean orderOk = orderDAO.createOrder(reqNo, c.getCustId(), pcode, qty, amount);
        if (orderOk) {
            req.setAttribute("reqNo", reqNo);
            req.setAttribute("amount", amount);
            RequestDispatcher rd = req.getRequestDispatcher("OrderConfirmed.jsp");
            rd.forward(req, resp);
        } else {
            resp.sendRedirect("ViewProduct.jsp?error=OrderFailed");
        }
    }
}
