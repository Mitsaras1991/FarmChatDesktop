<%-- 
    Document   : send_message
    Created on : 2 Φεβ 2016, 5:33:10 πμ
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

String user_logged=request.getParameter("user_login");
pageContext.setAttribute("username",user_logged, PageContext.SESSION_SCOPE);
String user_msg_to=(String) request.getParameter("user_view"); 
pageContext.setAttribute("user_msg_to",user_msg_to,pageContext.SESSION_SCOPE);

ResultSet date_added=null;
%>
   Date dNow = new Date();
   SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
   date_added=out.print(ft.format(dNow);
 
 <%
if(request.getParameter("send_message")!=null){ 
String msg_body=(String)request.getParameter("msg_body");
if(msg_body!=""){
     String opened="no";
String sql_send_msg=("insert into pvt_messages('user_from','user_to','msg_body','date','opened') values('"+user_logged+"','"+user_msg_to+"','"+msg_body+"','"+date_added+"','"+opened+"'");
int rs_msg_sent=conn.createStatement().executeUpdate(sql_send_msg);
if(rs_msg_sent!=0){
 %>
 <script type="text/javascript"> alert("Your message has been send");</script>
 

<%
    response.sendRedirect("send_msg.jsp?msg_to='"+user_msg_to+"'");
    
}
}
}
 %>
 <h2>Message to <%=user_msg_to%></h2>
 <form action="send_message.jsp" method="GET">
   
     <textarea cols="50" rows="12" placeholder="Enter Your message" name="msg_body"></textarea> 
     <input type="submit" name="send_message" value="Send Message"/>
 </form>

 
    <%@include file="includes/footer.jsp" %>
