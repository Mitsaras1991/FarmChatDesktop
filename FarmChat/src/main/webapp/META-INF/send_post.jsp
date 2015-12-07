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
 String user=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
 ResultSet rs=null;
 java.sql.Date date_added=rs.getDate(1);
 String sql=("insert into posts values('"+post+"','"+date_added+"','"+user+"','"+user+"'");
 %>
 <% 
 if(post!=""){
 try{
 int action=conn.createStatement().executeUpdate(sql);
    conn.setAutoCommit(true);
 
 }
 
 catch(Exception e){e.printStackTrace();}
 }
 else{
     
 %>
 
 <script type="javascript">alert("Put something to post")</script>
 <%}
 
 %>
 
 
 
