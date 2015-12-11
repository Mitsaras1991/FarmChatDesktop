<%-- 
    Document   : send_post
    Created on : Nov 28, 2015, 3:06:32 PM
    Author     : Mits
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/initheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%@include file="includes/dbconnection.jsp" %>

 <%
 String post=(String)request.getAttribute("post");
 pageContext.setAttribute("post",post,pageContext.SESSION_SCOPE);
 String user_logged=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
 ResultSet rs=null;
 java.sql.Date date_added=rs.getDate(1);
 String user_posting_to=(String)request.getAttribute("name");
 
 %>
 <% 
 if(post!=""){
     
     
 if(user_logged== user_posting_to){    
 try{
     String sql=("insert into posts values('"+post+"','"+date_added+"','"+user_logged+"','"+user_posting_to+"'");
 int action=conn.createStatement().executeUpdate(sql);
    conn.setAutoCommit(true);
 response.sendRedirect("profile.jsp");
 }
 

 
 
 catch(Exception e){e.printStackTrace();}
 }
 
 
 
 }
 if(user_logged!=user_posting_to){
 
 try{
     String sql=("insert into posts values('"+post+"','"+date_added+"','"+user_logged+"','"+user_posting_to+"'");
 int action=conn.createStatement().executeUpdate(sql);
    conn.setAutoCommit(true);
 response.sendRedirect("profile_other_user.jsp?name='"+user_posting_to+"'");
 }
 

 
 
 catch(Exception e){e.printStackTrace();}
 
 
 
 }
 
 else{
     
 %>

 <script type="javascript">alert("Put something to post")</script>
 <%}
 
 %>
 
 
 
