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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/send_msg.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/initheader.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <%@include file=\"includes/dbconnection.jsp\" %> <% String usernamelog=(String) pageContext.getAttribute(\"username\", PageContext.SESSION_SCOPE); String user_msg_to=(String) request.getParameter(\"msg_to\"); ResultSet rs_msg_date=null; java.sql.Date date_added=rs_msg_date.getDate(1); %> <% if(request.getParameter(\"submit\")!=null){ String msg_body=(String)request.getParameter(\"msg_body\"); if(msg_body!=\"\"){ String opened=\"no\"; String sql_send_msg=(\"insert into pvt_messages('user_from','user_to','msg_body','date','opened') values('\"+usernamelog+\"','\"+user_msg_to+\"','\"+msg_body+\"','\"+date_added+\"','\"+opened+\"')\"); int rs_msg_sent=conn.createStatement().executeUpdate(sql_send_msg); if(rs_msg_sent==1){ %> <script type=\"javascript\"> alert(\"Your message has been send\")</script> <% response.sendRedirect(\"send_msg.jsp?msg_to='\"+user_msg_to+\"'\"); } } } %> <h2>Message to <%=user_msg_to%></h2> <form action=\"send_msg.jsp\" method=\"GET\"> <textarea cols=\"50\" rows=\"12\" placeholder=\"Enter Your message\" name=\"msg_body\"></textarea> <input type=\"submit\" name=\"submit\" value=\"Send Message\"/> </form> <%@include file=\"includes/footer.jsp\" %>")) {
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
