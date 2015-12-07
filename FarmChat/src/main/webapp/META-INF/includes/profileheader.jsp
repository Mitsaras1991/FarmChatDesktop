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
<script scr="./js/main.js" text="text/javascript"></script>
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
	 <form action="search.php" method="GET" id="search">
	 <input type="text" name="q" size="60" placeholder="Search"
	 </form>
	 
	 </div>
	 <div id="menu">
	 <a href=""><%=usernamelog %></a>
	  <a href="">Account Settings</a>
	   <a href="">LogOut</a>
	 </div>
</div>
<div id='wrapper'></div><br/><br/><br/><br/><br/>
    </body>
</html>
