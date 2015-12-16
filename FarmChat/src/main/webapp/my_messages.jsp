<%-- 
    Document   : my_messages
    Created on : Dec 16, 2015, 2:46:54 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/initheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%@include file="includes/dbconnection.jsp" %>

 
 
 <h2>My Unread Messages</h2><br/><br/>
<%
String usernamelog=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
String sql_fetch_msg=("Select * from pvt_messages where user_to='"+usernamelog+"and opened='no'");
ResultSet rs_my_msg=conn.createStatement().executeQuery(sql_fetch_msg);

while(rs_my_msg.next()){

 int id=rs_my_msg.getInt(1);
String user_from=rs_my_msg.getString(2);
String user_to=rs_my_msg.getString(3);
String msg_body=rs_my_msg.getString(4);
java.sql.Date date=rs_my_msg.getDate(5);
String opened=rs_my_msg.getString(6);
out.println("<b><a href=profile_other_user.jsp?username_other_user='"+user_from+"'>");
out.println("'"+user_from+"'</a></b>");
out.println(msg_body);
out.println("<hr/><br/>");
}
%>

 
  <h2>My Read Messages</h2><br/><br/>
<%

String sql_fetch_msg_ur=("Select * from pvt_messages where user_to='"+usernamelog+"and opened='yes'");
ResultSet rs_my_msg_ur=conn.createStatement().executeQuery(sql_fetch_msg_ur);

while(rs_my_msg_ur.next()){

 int id=rs_my_msg.getInt(1);
String user_from= rs_my_msg_ur.getString(2);
String user_to=rs_my_msg_ur.getString(3);
String msg_body=rs_my_msg_ur.getString(4);
java.sql.Date date=rs_my_msg_ur.getDate(5);
String opened= rs_my_msg_ur.getString(6);
out.println("<b><a href=profile_other_user.jsp?username_other_user='"+user_from+"'>");
out.println("'"+user_from+"'</a></b>");
out.println("<textarea cols='25' rows='10' value='"+msg_body+"'/>");
out.println("<a href=delete_msg.jsp?id_msg='"+id+"'>Delete</a>");
out.println("<a href=send_msg.jsp?msg_to='"+user_from+"'>Delete</a>");
}

if(rs_my_msg_ur==null){
out.println("You havenot any messages");
}
%>
 

 
 

 <%@include file="includes/footer.jsp" %>