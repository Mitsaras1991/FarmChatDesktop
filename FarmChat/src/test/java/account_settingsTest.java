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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/account_settings.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/initheader.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <%@include file=\"includes/dbconnection.jsp\" %> <% String user=(String) pageContext.getAttribute(\"username\", PageContext.SESSION_SCOPE); if(user!=null){ } else{%> You must be logged ; <%} %> <form action=\"updateprofile.jsp\" method=\"post\"> <h2>Account Settings</h2> <hr/> <p>Upload Your Profile Photo</p> <form action=\"updateProfilePic.jsp\" method=\"POST\" enctype=\"multipart/forma-formdata\"> <img src=\"img/default_pic/jpg\" width=\"70\"/> <input type=\"file\" name=\"profile_pic\"></input><br/><br/> <input type=\"submit\" name=\"upload_pic\" value=\"Upload Image\"/> </form> <p>Change Password</p><br/> Your Old Password:<inpute type=\"password\" name=\"oldpassword\" id=\"oldpassword\" size=\"30\"/><br/> Your New Password:<inpute type=\"password\" name=\"newpassword\" id=\"newpassword\" size=\"30\"/><br/> Repeat New Password:<inpute type=\"password\" name=\"newpassword2\" id=\"newpassword2\" size=\"30\"/><br/> <input type=\"submit\" name=\"changepassword\" id=\"changepassword\"/> </form> <hr/> <form> <% String user_firstname=(String) pageContext.getAttribute(\"user_firstname\", PageContext.SESSION_SCOPE); String user_lastname=(String) pageContext.getAttribute(\"user_lastname\", PageContext.SESSION_SCOPE); String user_bio=(String) pageContext.getAttribute(\"user_bio\", PageContext.SESSION_SCOPE); %> <p>UPDATE YOUR PROFILE</p> First Name:<input type=\"text\" name=\"firstname\" id=\"firstname\" size=\"40\" placeholder=\"First Name\"><%=user_firstname%><br/> Last Name:<input type=\"text\" name=\"lastname\" id=\"lastname\" size=\"40\" placeholder=\"Last Name\"><%=user_lastname%><br/> About Me:<textarea name=\"aboutyou\" id=\"aboutyou\" cols=\"7\" rows=\"40\"><%=user_bio%></textarea> <hr/> <input type=\"submit\" name=\"editprofile\" id=\"editprofile\" value=\"updateprofile\"/> </form> <br/><br/> <%@include file=\"includes/footer.jsp\" %>")) {
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
