<%-- 
    Document   : profileheader
    Created on : Nov 27, 2015, 6:09:06 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <title>FindJob</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<script src="./js/main.js" type="text/javascript"></script>
    </head>
    <body>
        <% 
        String usernamelog=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
        
        %>
        <div class="headerMenu"></div>
<div id="wrapper">
    <div class="logo">
            <img src="./img/findjob.jpg"/>
     </div>
	 <div class="search_box">
	 <form action="search.jsp" method="POST" id="search">
	 <input type="text" name="find" size="60" placeholder="Search"/>
         <input type="submit" name="findFriend" />
	 
	 </div>
	 <div id="menu">
	 <a href="profile.jsp"><%=usernamelog %></a>
	  <a href="account_settings.jsp">Account Settings</a>
           <a href="my_messages.jsp">My Messages</a>
	   <a href="logout.jsp">LogOut</a>
	 </div>
</div>
<div id='wrapper'></div><br/><br/><br/><br/><br/>

