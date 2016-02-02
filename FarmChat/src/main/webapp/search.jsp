<%-- 
    Document   : search
    Created on : Dec 9, 2015, 1:43:15 PM
    Author     : Mits
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
       
       String user_to_find=request.getParameter("find");
       pageContext.setAttribute("user_to_find",user_to_find,pageContext.SESSION_SCOPE);
       String sql_user_to_find_by_firstname=("select * from users where first_name='"+user_to_find+"'");
       String sql_user_to_find_by_lastname=("select * from users where last_name='"+user_to_find+"'"); 
       ResultSet rs_firstname=conn.createStatement().executeQuery(sql_user_to_find_by_firstname);
        ResultSet rs_lastname=conn.createStatement().executeQuery(sql_user_to_find_by_lastname);
        if(rs_firstname!=null || rs_lastname!=null){
         if(rs_firstname!=null){
         
         while(rs_firstname.next()){
         String username_other_user=rs_firstname.getString(2);
         String firstname_other_user=rs_firstname.getString(3);
          String lastname_other_user=rs_firstname.getString(4);
          String profile_pic_other_user=rs_firstname.getString(10);
          out.println("<table height='125' width='75'>");
          out.println("<tr>");
          out.println("<a href=profile_other_user.jsp?username_other_user='"+username_other_user+">'");
          out.println("<img src='img/default_pic.jpg'/>");
          out.println("</tr>");
           out.println("</table>");
         }
             
             
         }
        if(rs_lastname!=null){
            
            while(rs_lastname.next()){
          String username_other_user=rs_lastname.getString(2);
          String firstname_other_user=rs_lastname.getString(3);
          String lastname_other_user=rs_lastname.getString(4);
          String profile_pic_other_user=rs_lastname.getString(10);
          out.println("<table height='125' width='75'>");
          out.println("<tr>");
          out.println("<a href=profile_other_user.jsp?username_other_user='"+username_other_user+">'");
          out.println("<img src='img/default_pic.jpg'/>");
          out.println("</tr>");
          out.println("</table>");
            }
        }
        }
        else{
        
        out.println("<h2>THE USER YOU SEEK DOESNOT EXIST</h2>");
        }
       %>
    <%@include file="includes/footer.jsp" %>