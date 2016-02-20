<%-- 
    Document   : send_message
    Created on : 18 Φεβ 2016, 2:18:43 πμ
    Author     : Tony-Driver
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
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
String user_logged = (String) pageContext.getAttribute("user_from", PageContext.SESSION_SCOPE);
pageContext.setAttribute("user_from",user_logged, PageContext.SESSION_SCOPE);
Object user_msg_to=session.getAttribute("user_to");
session.setAttribute("user_to", user_msg_to);
String msg_body=request.getParameter("msg_body");
pageContext.setAttribute("msg_body",msg_body,pageContext.SESSION_SCOPE);

String date_added = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
Random rn = new Random();
int id = rn.nextInt(Integer.MAX_VALUE);
String opened="no";

String sql_send_msg="insert into pvt_messages('user_from','user_to','msg_body','date','opened','id') values('"+user_logged+"','"+user_msg_to+"','"+msg_body+"','"+date_added+"','"+opened+"','"+id+"')";

if(msg_body!=""){ 
    try{
        int rs_msg_sent=conn.createStatement().executeUpdate(sql_send_msg);
        conn.setAutoCommit(true);
        
        if(rs_msg_sent==1)
            response.sendRedirect("profile_other_user?user_view='"+user_msg_to+"'");
        
        else
            response.sendRedirect("send_msg.jsp?user_msg_to='"+user_msg_to+"'");    
    }
    catch(Exception e){
        e.printStackTrace();
    }
}
else
    response.sendRedirect("send_msg.jsp?user_msg_to='"+user_msg_to+"'");
 %>