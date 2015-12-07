<%-- 
    Document   : dbconnection
    Created on : Nov 26, 2015, 10:10:10 PM
    Author     : Mits
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
      
       java.sql.Connection conn=null;
       String url="jdbc:mysql://localhost/snapchat";
       String Driver="com.mysql.jdbc.Driver";
       String username="root";
       String password="";
       try{
       Class.forName(Driver);
       conn=DriverManager.getConnection(url,username,password);
       if(conn==null){out.println("Cannot connect to DB");}
       }
       catch(Exception e){e.printStackTrace();
      }
       
       %>
    </body>
</html>
