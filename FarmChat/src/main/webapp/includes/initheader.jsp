<%-- 
    Document   : header
    Created on : Nov 25, 2015, 4:07:38 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <% 
    
    String username_log=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
    if(username_log!=null || username_log!=""){%>
 
    <%--<%@include file="includes/profileheader.jsp" %>--%>
    <jsp:include page="profileheader.jsp"/>
    <%}
    else{%>
 
    <%--<%@include file="includes/indexheader.jsp"%>--%>
    <jsp:include page="indexheader.jsp"/>
    <%}
    %>
