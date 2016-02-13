<%-- 
    Document   : delete_msg
    Created on : Dec 16, 2015, 6:56:16 PM
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


Object msg_to_delete=session.getAttribute("id_msg");
pageContext.setAttribute("msg_to_delete_string", msg_to_delete);
String sql_delete_msg=("delete from pvt_messages where id='"+msg_to_delete+"'");
try{
    int action=conn.createStatement().executeUpdate(sql_delete_msg);
    conn.setAutoCommit(true);
    if(action==1){
        %>      
        <jsp:forward page="profile.jsp"/>  
        <%
    }
else{
        %>
        <script type="text/javascript"> alert("Message has not been deleted ");</script>
        <%
response.sendRedirect("my_messages.jsp");

}
}



catch(Exception e){
    e.printStackTrace();
    }
%>
 <%@include file="includes/footer.jsp" %>