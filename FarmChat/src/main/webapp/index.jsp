<%-- 
    Document   : index
    Created on : Nov 25, 2015, 5:17:24 PM
    Author     : Mits
--%>
bnadlka
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/initheader.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@include file="includes/connection.jsp" %>

		<table>
			<tr>
				<td width="60%" valign="top" >
					<h2>Already a Member? Sign in below</h2>
                                        <form action="login.jsp" method="POST">
                                            
                                            	<input type="text" name="user_login" size="25" placeholder="Username" /><br /><br />
                                                 <input type="text" name="password_login" size="25" placeholder="Password" /><br /><br />
                                            <input type="Submit" name="login"   value="Login" />
                                        </form>
			</td>
			<td width="40%" valign="top">
				<h2>sign Up Below!<h2>
				<form action="signup.jsp" method="POST">
					<input type="text" name="fname" size="25" placeholder="First Name" /><br /><br />
					<input type="text" name="lname" size="25" placeholder="Last Name" /><br /><br />
					<input type="text" name="username" size="25" placeholder="Username" /><br /><br />
					<input type="text" name="email" size="25" placeholder="Email" /><br /><br />
					<input type="text" name="password" size="25" placeholder="Password" /><br /><br />
					<input type="text" name="password2" size="25" placeholder="Password(Again)" /><br /><br />
                                        <input type="Submit" name="reg"   value="Sign up" /><br /><br />
					
				</form>
			</td>
		</tr>	
	</table>	
    <%@include file="includes/footer.jsp" %>
 
 
