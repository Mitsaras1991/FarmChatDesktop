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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/profileheader.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <!DOCTYPE html> <html> <head> <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"> <title>FindJob</title> <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\"> <script scr=\"./js/main.js\" text=\"text/javascript\"></script> </head> <body> <% String usernamelog=(String) pageContext.getAttribute(\"username\", PageContext.SESSION_SCOPE); %> <div class=\"headerMenu\"></div> <div id=\"wrapper\"> <div class=\"logo\"> <img src=\"./img/findjob.jpg\"/> </div> <div class=\"search_box\"> <form action=\"search.jsp\" method=\"POST\" id=\"search\"> <input type=\"text\" name=\"find\" size=\"60\" placeholder=\"Search\"/> <input type=\"submit\" name=\"findFriend\" /> </div> <div id=\"menu\"> <a href=\"profile.jsp\"><%=usernamelog %></a> <a href=\"account_settings.jsp\">Account Settings</a> <a href=\"my_messages.jsp\">My Messages</a> <a href=logout.jsp\">LogOut</a> </div> </div> <div id='wrapper'></div><br/><br/><br/><br/><br/>")) {
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
