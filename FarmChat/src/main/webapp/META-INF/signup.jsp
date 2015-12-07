<%-- 
    Document   : signup
    Created on : Nov 25, 2015, 2:57:41 PM
    Author     : Mits
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/connection.jsp" %>
<%@include file="includes/dbconnection.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@include  file="includes/header.jsp"%>
        <%
String firstname=request.getParameter("fname");
pageContext.setAttribute("firstname",firstname,PageContext.SESSION_SCOPE);

String lastname=request.getParameter("lname");
pageContext.setAttribute("lastname",lastname,PageContext.SESSION_SCOPE);

String username_db=request.getParameter("username");
pageContext.setAttribute("username",username,PageContext.SESSION_SCOPE);

String email=request.getParameter("email");
pageContext.setAttribute("email",email,PageContext.SESSION_SCOPE);

String password_db=request.getParameter("password");
pageContext.setAttribute("password",password,PageContext.SESSION_SCOPE);

String password2=request.getParameter("password2");
pageContext.setAttribute("password2",password2,PageContext.SESSION_SCOPE);



String sql="insert into users(username,first_name,last_name,email,password,activated) values('"+username_db+"','"+firstname+"','"+lastname+"','"+email+"','"+password_db+"',0)";
%>
<mysql:query dataSource="${snapchat}" var="un_db">
SELECT username from users;
</mysql:query>

<mysql:query dataSource="${snapchat}" var="email_db">
SELECT email from users;
</mysql:query>
<%
if(username.equals("un_db") || email.equals("email_db"))
{%>
This username or email already exists
<jsp:include page="index.jsp"/>
<%}
 if(!password.equals(password2)){%>
    Passwords does not match
    <jsp:include page="index.jsp"/>
    <%}
 if(password.length()>25){%>
    Passwords does not match
    <jsp:include page="index.jsp"/>
    <%}
 if(firstname.length()>25 || lastname.length()>25 || username.length()>25 ){%>
    The maximum length of username/first name/last name does not exceed 25 characters !
    <jsp:include page="index.jsp"/>
    <%}
 else{%>
    <% 
   
    try{
   int action=conn.createStatement().executeUpdate(sql);
    conn.setAutoCommit(true);
     if(action==1){%>
         
            
     <jsp:forward page="profile.jsp"/>
     
         
    <%}
     else{%>
     Couldnot Register in Database
     <jsp:include page="index.jsp"/>
     <%}
    }
    catch(Exception e){
    e.printStackTrace();
    }
    
    %>
   
    
    <%}

%>
    </body>
</html>
