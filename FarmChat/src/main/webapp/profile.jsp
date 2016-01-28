<%-- 
    Document   : profile
    Created on : Nov 27, 2015, 3:28:49 AM
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
String sql_post="select * from posts where user_posted_to='"+user_logged+"'order by date_added desc limit 10";
ResultSet rs=conn.createStatement().executeQuery(sql_post);
String username_post;

%>
<sql:query dataSource="${snapchat}" sql="select id from users where username="<%=user_logged%> var="profile_info" ></sql:query>

<div class="postForm"> 
     <form action="send_post.jsp?name=<%=user_logged%>" method="POST">
        <textarea id="post" name="post" rows="4" cols="58"></textarea>
        <input type="submit" name="send" value="Post" style="background-color:#006fc4; float: right; border:1px solid #666;"/>
        
    </form>
       
        
    
  </div>
<div class="profilePost">
  <%  
    
    while(rs.next()){
    
    String body=rs.getString(2);
    java.sql.Date date_added=rs.getDate(3);
    String added_by=rs.getString(4);
    String user_posted_to=rs.getString(5);
  
    out.println("<div class='posted_by'><a href='"+added_by+"''"+user_posted_to+"'"+date_added+"</a></div>'");
    out.println("&nbsp;&nbsp;'"+body+"'");
  }
//do the post form redirect line 40 in loop
  %>  
  

</div>
<img src="img/default_pic.jpg" height="250" width="200" alt=<%=user_logged%>"s Profile" title=<%=user_logged %>"'s Profile"/><br/>
<div class="textHeader"><%=user_logged%>'s Profile</div>
<div class="profileLeftSideContent">Some Content about this person's profile

<%
String user_lastname=null,user_firstname=null,user_bio=null;
String sql_user_info=("select first_name,last_name,bio from users where username='"+user_logged+"'");
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
<form action="view_albums.jsp" method="POST">
<div class="textHeader"><%=user_logged%>'s Albums
<input type="submit" name="View Albums" value="View Albums" style="background-color:#006fc4; float: right; border:1px solid #666;"/>
</div>
</form>
<br><br>
<div class="textHeader"><%=user_logged%>'s Friends</div>
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