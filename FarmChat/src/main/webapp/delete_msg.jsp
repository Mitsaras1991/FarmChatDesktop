<%-- 
    Document   : delete_msg
    Created on : Dec 16, 2015, 6:56:16 PM
    Author     : Mits
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/initheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%@include file="includes/dbconnection.jsp" %>
<%

String msg_to_delete=(String)request.getParameter("id_msg");
String sql_delete_msg=("delete * from pvt_messages where id='"+msg_to_delete+"'");
try{
   int action=conn.createStatement().executeUpdate(sql_delete_msg);
    conn.setAutoCommit(true);
if(action==1){

response.sendRedirect("my_messages.jsp");

}
else{%>

<script type="javascript"> alert("Message has not been deleted ")</script>

<%
response.sendRedirect("my_messages.jsp");

}
}



catch(Exception e){
    e.printStackTrace();
    }
%>
 <%@include file="includes/footer.jsp" %>