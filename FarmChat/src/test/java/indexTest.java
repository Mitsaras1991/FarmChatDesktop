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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/index.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/initheader.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <table> <tr> <td width=\"60%\" valign=\"top\" > <h2>Already a Member? Sign in below</h2> <form action=\"login.jsp\" method=\"POST\"> <input type=\"text\" name=\"user_login\" size=\"25\" placeholder=\"Username\" /><br /><br /> <input type=\"password\" name=\"password_login\" size=\"25\" placeholder=\"Password\" /><br /><br /> <input type=\"Submit\" name=\"login\" value=\"Login\" /> </form> </td> <td width=\"40%\" valign=\"top\"> <h2>sign Up Below!</h2> <form action=\"signup.jsp\" method=\"POST\"> <input type=\"text\" name=\"fname\" size=\"25\" placeholder=\"First Name\" /><br /><br /> <input type=\"text\" name=\"lname\" size=\"25\" placeholder=\"Last Name\" /><br /><br /> <input type=\"text\" name=\"username\" size=\"25\" placeholder=\"Username\" /><br /><br /> <input type=\"text\" name=\"email\" size=\"25\" placeholder=\"Email\" /><br /><br /> <input type=\"password\" name=\"password\" size=\"25\" placeholder=\"Password\" /><br /><br /> <input type=\"password\" name=\"password2\" size=\"25\" placeholder=\"Password(Again)\" /><br /><br /> <input type=\"Submit\" name=\"reg\" value=\"Sign up\" /><br /><br /> </form> </td> </tr> </table> <%@include file=\"includes/footer.jsp\" %>")) {
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
