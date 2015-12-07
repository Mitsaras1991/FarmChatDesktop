<%-- 
    Document   : logout
    Created on : Nov 27, 2015, 3:19:28 AM
    Author     : Mits
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.invalidate();
pageContext.release();
response.sendRedirect("index.jsp");

%>
