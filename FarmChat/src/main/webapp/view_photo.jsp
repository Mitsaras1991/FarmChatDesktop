<%-- 
    Document   : View_photo
    Created on : 14 Ιαν 2016, 3:02:26 μμ
    Author     : sothria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%--<%@include file="includes/dbconnection.jsp" %>--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%--<%@include file="includes/connection.jsp" %>--%>
 <%@include file="includes/profileheader.jsp" %>


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
    String photos_uid=(String) pageContext.getAttribute("uid", PageContext.SESSION_SCOPE);
    %>
<div class="textHeader"><h2>Photos in this Album: </h2>></div>

<table>
    <tr>
<%    
String sql_photos="select * from photos where uid='"+photos_uid+"'";
    ResultSet user_photos=conn.createStatement().executeQuery(sql_photos);
    while(user_photos.next()){
       
        String uid=user_photos.getString(2);
        String username =user_photos.getString(3);
        java.sql.Date date_posted=user_photos.getDate(4);
        String description=user_photos.getString(5);
        String image_url=user_photos.getString(6);
        %>
        <td>
            <div class="albums">
                <a href="view_photo/<%=uid%>">
                <img src="<%=image_url%>" height="250" width="200" alt=<%=description%>"album"><br><br>
                <%out.println(description);%> </a>>
            </div>>            
        </td>
  <%      
}%>
    </tr>
</table>
   <% 
            String album_title=(String) pageContext.getAttribute("album_title", PageContext.SESSION_SCOPE);
            String uid=(String) pageContext.getAttribute("uid", PageContext.SESSION_SCOPE);
%>
 
<!--<html>
    <head>
        <title>View Image Page</title>
    </head>
    <body>-->
<!--        <table border="0">  width="100%" height="100%" border="0"-->
       
        <%
//            ResultSet rs=null;
//            try
//            {
//                Statement st=null;
//                Connection cn=null;
//                st=cn.createStatement();
//                rs=st.executeQuery("select image_url from photos");
// 
//                while(rs.next())
//            {
            %>
<!--        <table border="1">  width="70%" height="160" align="center"
            <tr>-->
            <!-- Mention Directory where your images has been saved-->
 
<!--                <td><img src="image/<%=//rs.getString("image") %>" width="115" height="128" /></td>
            </tr>
        </table>-->
        <%
//        }
//    }
//    catch(Exception e)
//    {
//    out.print(""+e.getMessage());
//    }
%>
 
  
<!--</body>
</html>-->
