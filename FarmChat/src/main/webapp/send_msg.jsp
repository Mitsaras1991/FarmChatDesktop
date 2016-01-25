<%-- 
    Document   : send_msg
    Created on : Dec 14, 2015, 3:31:45 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/profileheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%@include file="includes/dbconnection.jsp" %>
 
 
<% 
String user_logged=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
String user_msg_to=(String) request.getParameter("msg_to"); 
 ResultSet rs_msg_date=null;
java.sql.Date date_added=rs_msg_date.getDate(1);
 %>
 
 <%
if(request.getParameter("submit")!=null){
   
String msg_body=(String)request.getParameter("msg_body");
if(msg_body!=""){
     String opened="no";
String sql_send_msg=("insert into pvt_messages('user_from','user_to','msg_body','date','opened') values('"+user_logged+"','"+user_msg_to+"','"+msg_body+"','"+date_added+"','"+opened+"')");
int rs_msg_sent=conn.createStatement().executeUpdate(sql_send_msg);
if(rs_msg_sent==1){
 %>
    <script type="text/javascript"> alert("Your message has been send");</script>


<%
    response.sendRedirect("send_msg.jsp?msg_to='"+user_msg_to+"'");
}
}
}
 %>
  <h2>Message to <%=user_msg_to%></h2>
 <form action="send_msg.jsp" method="GET">
   
     <textarea cols="50" rows="12" placeholder="Enter Your message" name="msg_body"></textarea> 
     <input type="submit" name="submit" value="Send Message"/>
 </form>
 
 
   <%@include file="includes/footer.jsp" %>
