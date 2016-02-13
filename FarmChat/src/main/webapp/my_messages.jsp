<%-- 
    Document   : my_messages
    Created on : Dec 16, 2015, 2:46:54 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/profileheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%--<%@include file="includes/connection.jsp" %>--%>
 <%--<%@include file="includes/dbconnection.jsp" %>--%>

 
 
 <h2>My Unread Messages</h2><br/><br/>
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
String sql_fetch_msg=("Select * from pvt_messages where user_to='"+user_logged+"'and opened='no'");
//ResultSet rs_my_msg=conn.createStatement().executeQuery(sql_fetch_msg);

try{
    ResultSet rs_my_msg=conn.createStatement().executeQuery(sql_fetch_msg);
    conn.setAutoCommit(true);
    
    while(rs_my_msg.next()){
    
        String user_from=rs_my_msg.getString(1);
        String user_to=rs_my_msg.getString(2);
        String msg_body=rs_my_msg.getString(3);
        java.sql.Date date=rs_my_msg.getDate(4);
        String opened=rs_my_msg.getString(5);
        
        if(rs_my_msg==null)
            out.println("You havenot any messages");
        else
        {
        out.println("<table height='125' width='75'>");
        out.println("<b><a href=profile_other_user.jsp?username_other_user='"+user_from+"'>");
        out.println("'"+user_from+"'</a></b>");
        out.println("msg_body");
        out.println("<textarea cols='25' rows='10'>"+msg_body+"</textarea>");
        out.println("</hr></br>");
        out.println("</table>");
        String sql_update=("update pvt_messages set opened='yes' where user_to='"+user_to+"'");
        int action=conn.createStatement().executeUpdate(sql_update);
        }
    }
}
catch(Exception e){
    e.printStackTrace();
}
%>

 
  <h2>My Read Messages</h2><br/><br/>
<%

String sql_fetch_msg_ur=("select * from pvt_messages where user_to='"+user_logged+"'and opened='yes'");
try{
    ResultSet rs_my_msg_ur=conn.createStatement().executeQuery(sql_fetch_msg_ur);
    conn.setAutoCommit(true);

    while(rs_my_msg_ur.next()){
        int id=rs_my_msg_ur.getRow();
        String user_from= rs_my_msg_ur.getString(1);
        String user_to=rs_my_msg_ur.getString(2);
        String msg_body=rs_my_msg_ur.getString(3);
        java.sql.Date date=rs_my_msg_ur.getDate(4);
        String opened= rs_my_msg_ur.getString(5);
        out.println("<b><a href=profile_other_user.jsp?username_other_user='"+user_from+"'>");
        out.println("'"+user_from+"'</a></b>");
        out.println("<textarea cols='25' rows='10'>"+msg_body+"</textarea>");
        out.println("<a href='delete_msg.jsp?id_msg=\'"+id+"\''>Delete</a>");
        out.println("<a href='send_msg.jsp?msg_to=\'"+user_from+"\''>Delete</a>");
    }
}
catch(Exception e){
    e.printStackTrace();
}
%>
 <form action="send_msg.jsp" method="POST">
     <h2>Send a message</h2> 
     <input type="submit" name="submit" value="Send Message"/>
 </form>

 
 

 <%@include file="includes/footer.jsp" %>