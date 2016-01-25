<%-- 
    Document   : logout
    Created on : Nov 27, 2015, 3:19:28 AM
    Author     : Mits
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/dbconnection.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>

<%
String user_logged=request.getParameter("user_login");
pageContext.setAttribute("username","");
session.invalidate();
response.sendRedirect("index.jsp");
%>
