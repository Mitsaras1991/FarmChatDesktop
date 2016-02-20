<%-- 
    Document   : send_msg
    Created on : 2 Φεβ 2016, 5:33:10 πμ
    Author     : Mits
--%>
<!DOCTYPE html>
<body>
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
String user_logged = (String) pageContext.getAttribute("user_login", PageContext.SESSION_SCOPE);
pageContext.setAttribute("user_from",user_logged, PageContext.SESSION_SCOPE);
String user_msg_to = (String) pageContext.getAttribute("user_view", PageContext.SESSION_SCOPE);
session.setAttribute("user_to",user_msg_to);
%>
 
 <h2>Message to <%=user_msg_to%></h2>
 <table height='125' width='75'>
    <form action="send_message.jsp?user_to=<%=user_msg_to%>" method="POST">
        <div>
        <textarea name="msg_body1" id="msg_body1" cols="45" rows="15" ng-value="msg_body1"></textarea> 
        <a href="send_message.jsp" msg_body="%msg_body%">Send Message</a>
        </div>
    </form>
 </table>
</body> 
</html> 

    <%@include file="includes/footer.jsp" %>
