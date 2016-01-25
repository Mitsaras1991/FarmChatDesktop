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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/send_post.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/initheader.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <%@include file=\"includes/dbconnection.jsp\" %> <% String post=(String)request.getAttribute(\"post\"); pageContext.setAttribute(\"post\",post,pageContext.SESSION_SCOPE); String user_logged=(String) pageContext.getAttribute(\"username\", PageContext.SESSION_SCOPE); ResultSet rs=null; java.sql.Date date_added=rs.getDate(1); String user_posting_to=(String)request.getParameter(\"name\"); %> <% if(post!=\"\"){ if(user_logged== user_posting_to){ try{ String sql=(\"insert into posts values('\"+post+\"','\"+date_added+\"','\"+user_logged+\"','\"+user_posting_to+\"'\"); int action=conn.createStatement().executeUpdate(sql); conn.setAutoCommit(true); response.sendRedirect(\"profile.jsp\"); } catch(Exception e){e.printStackTrace();} } } if(user_logged!=user_posting_to){ try{ String sql=(\"insert into posts values('\"+post+\"','\"+date_added+\"','\"+user_logged+\"','\"+user_posting_to+\"'\"); int action=conn.createStatement().executeUpdate(sql); conn.setAutoCommit(true); response.sendRedirect(\"profile_other_user.jsp?name='\"+user_posting_to+\"'\"); } catch(Exception e){e.printStackTrace();} } else{ %> <script type=\"javascript\">alert(\"Put something to post\")</script> <%} %>")) {
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
