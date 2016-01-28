<%-- 
    Document   : logout
    Created on : Nov 27, 2015, 3:19:28 AM
    Author     : Mits
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="includes/dbconnection.jsp" %>--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%--<%@include file="includes/connection.jsp" %>--%>

<%
     Connection conn = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmchat", "root", "");

                if(conn!=null){
                    out.println("Connected");
                }else{
                    out.println("Cannot connect");
                }
            
            }catch(Exception e){
                e.printStackTrace();
            }
String user_logged=request.getParameter("user_login");
pageContext.setAttribute("username","");
session.invalidate();
response.sendRedirect("index.jsp");
%>
