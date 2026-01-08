<%@ page session="true" %>
<%
   session.invalidate();
   response.sendRedirect("CustomerLogin.html");
%>
