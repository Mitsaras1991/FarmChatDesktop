<%-- 
    Document   : profile
    Created on : Nov 27, 2015, 3:28:49 AM
    Author     : Mits
--%>

asdsad
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/initheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%@include file="includes/dbconnection.jsp" %>

<% 
String usernamelog=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
String sql_post="select * from posts where user_posted_to='"+usernamelog+"'order by id desc limit 10";
ResultSet rs=conn.createStatement().executeQuery(sql_post);


%>
<sql:query dataSource="${snapchat}" sql="select id from users where username="<%=usernamelog %>var="profile_info" ></sql:query>

<div class="postForm"> 
    
        <textarea id="post" name="post" rows="4" cols="58"></textarea>
        <input type="submit" onclick="javascript:send_post()" name="send" value="Post" style="background-color:#006fc4; float: right; border:1px solid #666;"/>
    
  </div>
<div class="profilePost">
  <%  
    
    while(rs.next()){
    int id=rs.getInt(1);
    String body=rs.getString(2);
    java.sql.Date date_added=rs.getDate(3);
    String added_by=rs.getString(4);
    String user_posted_to=rs.getString(5);
  
    out.println("<div class='posted_by'><a href='"+added_by+"''"+user_posted_to+"'"+date_added+"</a></div>'");
    out.println("&nbsp;&nbsp;'"+body+"'");
  }
%>  //do the post form redirect line 40 in loop
  

</div>//do the pictures update
<img src="img/default_pic.jpg" height="250" width="200" alt=<%=usernamelog%>"s Profile" title=<%=usernamelog %>"'s Profile"/><br/>
<div class="textHeader"><%=usernamelog%>'s Profile</div>
<div class="profileLeftSideContent">Some Content about this person's profile

<%
String user_lastname=null,user_firstname=null,user_bio=null;
String sql_user_info=("select first_name,last_name,bio from users where username='"+usernamelog+"'");
ResultSet user_info=conn.createStatement().executeQuery(sql_user_info);
while(user_info.next()){
 user_firstname=user_info.getString(1);
 pageContext.setAttribute("user_firstname",user_firstname,pageContext.SESSION_SCOPE);
 user_lastname=user_info.getString(2);
 user_bio=user_info.getString(3);
}



%>

<p><%=user_firstname%></p>
<p><%=user_lastname%></p>
<p><%=user_bio%></p>




</div>
<form action="<%=usernamelog%>" method="POST">
    
    <input type="submit" name="addfriend" value="Add as Friend"/>
        <input type="submit" name="sendmsg" value="Send Message"/>

    
</form>
<div class="textHeader"><%=usernamelog%>'s Friends</div>
<div class="profileLeftSideContent">
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;  
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
    <img  src='#' height="50" width='40'/>&nbsp;&nbsp;
</div>










 <%@include file="includes/footer.jsp" %>