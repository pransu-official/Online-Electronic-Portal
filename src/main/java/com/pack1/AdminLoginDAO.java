package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO 
{
	public AdminBean chech_adminlogin(String userName,String password)
	{
		AdminBean a_bean=null;
		try 
		{
			Connection con= DBConnect.connect();
			PreparedStatement pstmt = con.prepareStatement("select * from admin where uname=? and pword=?");
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			
			 
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				a_bean=new AdminBean();
				a_bean.setaName(rs.getString(1));
				a_bean.setaPwd(rs.getString(2));
				a_bean.setaFname(rs.getString("fname"));
			}
			
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
			
		}	
		return a_bean;	
	}

}
