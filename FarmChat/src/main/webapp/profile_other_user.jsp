<%-- 
    Document   : profile_other_user
    Created on : Dec 9, 2015, 3:03:26 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/profileheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%--<%@include file="includes/connection.jsp" %>--%>
 <%--<%@include file="includes/dbconnection.jsp" %>--%>
 
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
 
 String user_logged=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
 String user_view= (String) pageContext.getAttribute("username_other_user", PageContext.SESSION_SCOPE);
 String sql_post="select * from posts where user_posted_to='"+user_view+"'order by date_added desc limit 10";
 ResultSet rs_view_posts_other_user=conn.createStatement().executeQuery(sql_post);
 %>
 
 
 
 <div class="postForm"> 
     <form action="send_post.jsp?name=<%=user_view%>" method="POST">
        <textarea id="post" name="post" rows="4" cols="58"></textarea>
        <input type="submit" name="send" value="Post" style="background-color:#006fc4; float: right; border:1px solid #666;"/>
        
    </form>
 
 
 <div class="profilePost">
  <%  
    
    while(rs_view_posts_other_user.next()){
    
    String body=rs_view_posts_other_user.getString(2);
    java.sql.Date date_added=rs_view_posts_other_user.getDate(3);
    String added_by=rs_view_posts_other_user.getString(4);
    String user_posted_to= rs_view_posts_other_user.getString(5);
  
    out.println("<div class='posted_by'><a href='"+added_by+"''"+user_posted_to+"'"+date_added+"</a></div>'");
    out.println("&nbsp;&nbsp;'"+body+"'");
  }
%> 
 
<img src="img/default_pic.jpg" height="250" width="200" alt=<%=user_view%>"s Profile" title=<%= user_view %>"'s Profile"/><br/>
<div class="textHeader"><%=user_view%>'s Profile</div>
<div class="profileLeftSideContent">Some Content about this person's profile

<%
String user_lastname=null,user_firstname=null,user_bio=null;
String sql_user_info=("select first_name,last_name,bio from users where username='"+user_view+"'");
ResultSet user_info=conn.createStatement().executeQuery(sql_user_info);
while(user_info.next()){
 user_firstname=user_info.getString(3);
 pageContext.setAttribute("user_firstname",user_firstname,pageContext.SESSION_SCOPE);
 user_lastname=user_info.getString(4);
 user_bio=user_info.getString(9);
}



%>

<p><%=user_firstname%></p>
<p><%=user_lastname%></p>
<p><%=user_bio%></p>




</div>
 
 <form action="send_msg.jsp?msg_to=<%=user_view%>" method="POST">
    
        <input type="submit" name="send_msg" value="Send Message"/>
</form>
 
 <div class="textHeader"><%=user_view%>'s Friends</div>
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