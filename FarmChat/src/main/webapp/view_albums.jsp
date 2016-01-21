<%-- 
    Document   : view_albums
    Created on : 10 Ιαν 2016, 1:57:53 μμ
    Author     : sothria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@include file="includes/dbconnection.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>
 <%@include file="includes/profileheader.jsp" %>

 
<%
    String user_logged=(String) pageContext.getAttribute("username", PageContext.SESSION_SCOPE);
%>
<div class="textHeader"><h2><%=user_logged%>'s Albums</h2>></div>
<table>
    <tr>
<%    
String sql_albums="select * from albums where created_by='"+user_logged+"'";
    ResultSet user_albums=conn.createStatement().executeQuery(sql_albums);
    while(user_albums.next()){
        int id=user_albums.getInt(1);
        String album_title=user_albums.getString(2);
        String album_description=user_albums.getString(3);
        String created_by=user_albums.getString(4);
        java.sql.Date date_created=user_albums.getDate(5);
        String uid=user_albums.getString(6);
        
        %>
        <td>
            <div class="albums">
                <a href="view_photo.jsp">
                <img src="#" height="250" width="200" alt=<%=album_title%>"album"><br><br>
                <%out.println(album_title);%> </a>>
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


