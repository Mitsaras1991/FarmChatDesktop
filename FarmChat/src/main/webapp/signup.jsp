<%-- 
    Document   : signup
    Created on : Nov 25, 2015, 2:57:41 PM
    Author     : Mits
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="includes/connection.jsp" %>--%>
<%--<%@include file="includes/dbconnection.jsp" %>--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@include  file="includes/profileheader.jsp"%>

<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
String firstname=request.getParameter("fname");
pageContext.setAttribute("firstname",firstname,PageContext.SESSION_SCOPE);

String lastname=request.getParameter("lname");
pageContext.setAttribute("lastname",lastname,PageContext.SESSION_SCOPE);

String username_db=request.getParameter("username");
pageContext.setAttribute("username",username_db,PageContext.SESSION_SCOPE);

String email=request.getParameter("email");
pageContext.setAttribute("email",email,PageContext.SESSION_SCOPE);

String password_db=request.getParameter("password");
pageContext.setAttribute("password",password_db,PageContext.SESSION_SCOPE);

String password2=request.getParameter("password2");   
pageContext.setAttribute("password2",password2,PageContext.SESSION_SCOPE);


String users_email=("select email from users");
String users_un=("select username from users");
ResultSet rs_un=conn.createStatement().executeQuery(users_un);
ResultSet rs_email=conn.createStatement().executeQuery(users_email);
boolean check_email=false;
boolean check_un=false;
        
while(rs_email.next() && check_email){ // && check_email = false
    String email_db=rs_email.getString(1);
    if(email_db==email){check_email=true;}
}
while(rs_un.next() && check_un){ // && check_un=false 
    String un_db=rs_email.getString(1);
    if(un_db==email){
        check_un=true;
    }
}
%>
<%
if(username_db.equals("un_db") || email.equals("email_db"))
{%>
This username or email already exists
<jsp:include page="index.jsp"/>
<%}
 if(!password_db.equals(password2)){%>
    Passwords does not match
  <jsp:include page="index.jsp"/>
    <%}
 if(password_db.length()>25){%>
   Passwords does not match
    <jsp:include page="index.jsp"/> 
    <%}
 if(firstname.length()>25 || lastname.length()>25 || username_db.length()>25 ){%>
   The maximum length of username/first name/last name does not exceed 25 characters 
   <jsp:include page="index.jsp"/> 
    <%}
 else{%>
   <%  
    String sql="insert into users(username,first_name,last_name,email,password,activated) values('"+username_db+"','"+firstname+"','"+lastname+"','"+email+"','"+password_db+"',0)";
    try{
        //Statement statement = conn.createStatement();
        
        //statement.executeUpdate(sql);
        int action = conn.createStatement().executeUpdate(sql); 
//   int action=conn.createStatement().executeUpdate(sql);
        conn.setAutoCommit(true);
        if(action==1){ %>   
            
             <jsp:forward page="profile.jsp"/>
         
    <%  }
        else{%>
            Could not Register in Database
            <jsp:include page="index.jsp"/>
     <%}
    }catch(Exception e){
        e.printStackTrace();
    }
    
}
%>
    </body>
</html>