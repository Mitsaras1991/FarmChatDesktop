<%-- 
    Document   : updateprofile
    Created on : Nov 30, 2015, 12:25:42 AM
    Author     : Mits
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/initheader.jsp" %>
<%@include file="includes/dbconnection.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%
 String oldpassword=request.getParameter("oldpassword");
 String newpassword=request.getParameter("newpassword");
 String newpassword2=request.getParameter("newpassword2");
 String firstname=request.getParameter("firstname");
 String lastname=request.getParameter("lastname");
 String bio_profile=request.getParameter("aboutyou");
 String usernamelog=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
 

 String sql_user="select password from user where username='"+usernamelog+"'";
String db_password=null;
ResultSet rs=conn.createStatement().executeQuery(sql_user);
while(rs.next()){
db_password=rs.getString(6);

}
if("changepassword"!=null){
    if(db_password==oldpassword){
  if(newpassword==newpassword2){
  String resetPass="update users set password='"+newpassword+"where username='"+usernamelog+"'";
  ResultSet resetPassword=conn.createStatement().executeQuery(resetPass);
  }
  
  else if(newpassword!=newpassword2){%>
  Please Retype New Password....They donot match..
  <jsp:include page="account_settings.jsp"/>
  
  
  
  <%}
  
  else{%>
  There is nothing to be commited
  <jsp:include page="account_settings.jsp"/>
  
  
  <%}
  
    }
    
    else{%>
    
    The password you have given doesnot match this account
    <jsp:include page="account_settings.jsp"/>
    <%}
 

}
 %>
 
 
 <%
 if("editprofile"!=null){
 String sql_edit_profile=("select first_name,last_name,bio from users where username='"+usernamelog+"'");
 ResultSet profileInfo=conn.createStatement().executeQuery(sql_user);
String user_firstname=(String)pageContext.getAttribute("user_firstname", PageContext.SESSION_SCOPE);
String user_lastname=(String) pageContext.getAttribute("user_lastname", PageContext.SESSION_SCOPE);
String user_bio=(String) pageContext.getAttribute("user_bio", PageContext.SESSION_SCOPE);

 if(firstname!=null && firstname!=user_firstname ){
  String sql_update_firstname=("update users set first_name='"+firstname+"where username='"+usernamelog+"'");
 ResultSet update_firstname=conn.createStatement().executeQuery(sql_update_firstname);
 }
 if(lastname!=null && lastname!=user_lastname){
 String sql_update_lastname=("update users set last_name='"+lastname+"where username='"+usernamelog+"'");
 ResultSet update_lastname=conn.createStatement().executeQuery(sql_update_lastname);
 
 }
 
 if(bio_profile!=null && bio_profile!=user_bio){
 
  String sql_update_bio=("update users set bio='"+bio_profile+"where username='"+usernamelog+"'");
  ResultSet update_lastname=conn.createStatement().executeQuery(sql_update_bio);
 }
 else{%>
 There is nothing to Change
 <jsp:include page="account_settings.jsp"></jsp:include>
<% }
 
         }
 
 
 
 %>