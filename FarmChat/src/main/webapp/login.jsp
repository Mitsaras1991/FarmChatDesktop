<%-- 
    Document   : login
    Created on : Nov 27, 2015, 2:15:31 AM
    Author     : Mits
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="includes/dbconnection.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
  <%
      String user_logged=request.getParameter("user_login");
      pageContext.setAttribute("username",user_logged,pageContext.SESSION_SCOPE);
      
      String passwordLogin=request.getParameter("password_login");
    pageContext.setAttribute("password",passwordLogin,pageContext.SESSION_SCOPE);
  String sql_login="select id from users where username='"+user_logged+"'and password='"+passwordLogin+"'limit 1";
   if(user_logged!=null && passwordLogin!=null){
//  userLogin=userLogin.replaceAll("#[^A-Za-z0-9]#i",userLogin);
//  passwordLogin=passwordLogin.replaceAll("#[^A-Za-z0-9]#i", passwordLogin);
  ResultSet rs_login=conn.createStatement().executeQuery(sql_login);
    conn.setAutoCommit(true);
     if(rs_login.getRow()==1){
     
     %>
         
            
     <jsp:forward page="profile.jsp"/>
     
         
    <%
     
     
     }
     else{
       
    %>
     Your Password or Username doesnot match
    <jsp:include page="index.jsp"/>
     <%
     
     }
   
  }
  
  %>     
 