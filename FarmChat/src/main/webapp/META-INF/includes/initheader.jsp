<%-- 
    Document   : header
    Created on : Nov 25, 2015, 4:07:38 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>FindJob</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>
<body>
    <% 
    
    String username_log=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
    if(username_log!=null){%>
    
    <jsp:include page="profileheader.jsp"/>
    
    <%}
    else{%>
    
    <jsp:include page="indexheader.jsp"/>
    
    <%}
    %>
