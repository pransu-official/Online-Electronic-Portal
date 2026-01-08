
package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/aps")
public class AddProductServlet extends HttpServlet
{  
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		HttpSession session =req.getSession(false);
		if(session==null)
		{
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
			
			
		}
		else
		{
			ProductBean pb = new ProductBean();
			pb.setpCode(req.getParameter("pcode"));
			pb.setpName(req.getParameter("pname"));
			pb.setpCompany(req.getParameter("pcompany"));
			pb.setpPrice(req.getParameter("pprice"));
			pb.setpQty(req.getParameter("pqty"));
			
			int rowCount = new AddProductDAO().insertProduct(pb);
			
			if(rowCount==0) 
			{
				throw new RuntimeException("Product Data Not inserted");
				
			}
			else
			{
				req.setAttribute("msg", "Product Data inserted");
				req.getRequestDispatcher("AdminLogin.html").forward(req, res);
			}
			
		}
		
		
		
	}

}
