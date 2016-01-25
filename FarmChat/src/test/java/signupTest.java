import org.testng.annotations.BeforeMethod;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.Test;
import static org.testng.Assert.*;

import java.util.concurrent.TimeUnit;
import java.util.Date;
import java.io.File;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.*;
import static org.openqa.selenium.OutputType.*;

public class  {
    FirefoxDriver wd;
    
    @BeforeMethod
    public void setUp() throws Exception {
        wd = new FirefoxDriver();
        wd.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
    }
    
    @Test
    public void () {
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/signup.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/connection.jsp\" %> <%@include file=\"includes/dbconnection.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/initheader.jsp\"%> <% String firstname=request.getParameter(\"fname\"); pageContext.setAttribute(\"firstname\",firstname,PageContext.SESSION_SCOPE); String lastname=request.getParameter(\"lname\"); pageContext.setAttribute(\"lastname\",lastname,PageContext.SESSION_SCOPE); String username_db=request.getParameter(\"username\"); pageContext.setAttribute(\"username\",username,PageContext.SESSION_SCOPE); String email=request.getParameter(\"email\"); pageContext.setAttribute(\"email\",email,PageContext.SESSION_SCOPE); String password_db=request.getParameter(\"password\"); pageContext.setAttribute(\"password\",password,PageContext.SESSION_SCOPE); String password2=request.getParameter(\"password2\"); pageContext.setAttribute(\"password2\",password2,PageContext.SESSION_SCOPE); String sql=\"insert into users(username,first_name,last_name,email,password,activated) values('\"+username_db+\"','\"+firstname+\"','\"+lastname+\"','\"+email+\"','\"+password_db+\"',0)\"; %> String users_email=(\"select email from users\"); String users_un=(\"select username from users\"); ResultSet rs_un=conn.createStatement().executeQuery(users_un); ResultSet rs_email=conn.createStatement().executeQuery(users_email); boolean check_email=false; boolean check_un=false; while(rs_email.next() && check_email = false){ String email_db=rs_email.getString(1); if(email_db==email){check_email=true;} } while(rs_un.next() && check_un=false ){ String un_db=rs_email.getString(1); if(un_db==email){ check_un=true; } } <% if(username.equals(\"un_db\") || email.equals(\"email_db\")) {%> This username or email already exists <jsp:include page=\"index.jsp\"/> <%} if(!password.equals(password2)){%> Passwords does not match <jsp:include page=\"index.jsp\"/> <%} if(password.length()>25){%> Passwords does not match <jsp:include page=\"index.jsp\"/> <%} if(firstname.length()>25 || lastname.length()>25 || username.length()>25 ){%> The maximum length of username/first name/last name does not exceed 25 characters ! <jsp:include page=\"index.jsp\"/> <%} else{%> <% try{ int action=conn.createStatement().executeUpdate(sql); conn.setAutoCommit(true); if(action==1){%> <jsp:forward page=\"profile.jsp\"/> <%} else{%> Couldnot Register in Database <jsp:include page=\"index.jsp\"/> <%} } catch(Exception e){ e.printStackTrace(); } %> <%} %>")) {
            System.out.println("verifyTextPresent failed");
        }
    }
    
    @AfterMethod
    public void tearDown() {
        wd.quit();
    }
    
    public static boolean isAlertPresent(FirefoxDriver wd) {
        try {
            wd.switchTo().alert();
            return true;
        } catch (NoAlertPresentException e) {
            return false;
        }
    }
}
