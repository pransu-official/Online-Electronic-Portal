package com.pack1;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionListner implements HttpSessionListener,HttpSessionAttributeListener
{
	@Override
	public void sessionCreated(HttpSessionEvent hse)
	{
		System.out.println("Session Object Initialized");
		
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent hse)
	{
		System.out.println("Session Object Destroyed");
		
	}
	@Override
	public void attributeAdded(HttpSessionBindingEvent hsbe ) 
	{
		System.out.println("Attrinbute added to the Session Object");
		System.out.println("Attribute Name "+hsbe.getName());
		
	}
	@Override
	public void attributeRemoved(HttpSessionBindingEvent hsbe ) 
	{
		System.out.println("Attrinbute Removed from the Session Object");
		
	}

}
