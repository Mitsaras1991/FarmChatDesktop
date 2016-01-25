import java.util.List;
import java.util.Map;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.BeforeMethod;

public class account_settingsTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "Your New Password:&lt;input type=\"password\" name=\"newpassword\" id=\"newpassword\" size=\"30\"/&gt;&lt;br/&gt;";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/account_settings.jsp";

    public account_settingsTest() {
    }
    
    public account_settingsTest(WebDriver driver) {
        this();
        this.driver = driver;
    }
    
    public account_settingsTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public account_settingsTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the account_settingsTest class instance.
     */
    
    @Test
    public account_settingsTest verifyPageLoaded() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getPageSource().contains(pageLoadedText);
            }
        });
        return this;
    }

    /**
     * Verify that current page URL matches the expected URL.
     *
     * @return the account_settingsTest class instance.
     */
    
    @Test
    public void test () {
        //this.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/account_settings.jsp//");
        if (!driver.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/initheader.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <%@include file=\"includes/dbconnection.jsp\" %> <% String user=(String) pageContext.getAttribute(\"username\", PageContext.SESSION_SCOPE); if(user!=null){ } else{%> You must be logged ; <%} %> <form action=\"updateprofile.jsp\" method=\"post\"> <h2>Account Settings</h2> <hr/> <p>Upload Your Profile Photo</p> <form action=\"updateProfilePic.jsp\" method=\"POST\" enctype=\"multipart/forma-formdata\"> <img src=\"img/default_pic/jpg\" width=\"70\"/> <input type=\"file\" name=\"profile_pic\"></input><br/><br/> <input type=\"submit\" name=\"upload_pic\" value=\"Upload Image\"/> </form> <p>Change Password</p><br/> Your Old Password:<inpute type=\"password\" name=\"oldpassword\" id=\"oldpassword\" size=\"30\"/><br/> Your New Password:<inpute type=\"password\" name=\"newpassword\" id=\"newpassword\" size=\"30\"/><br/> Repeat New Password:<inpute type=\"password\" name=\"newpassword2\" id=\"newpassword2\" size=\"30\"/><br/> <input type=\"submit\" name=\"changepassword\" id=\"changepassword\"/> </form> <hr/> <form> <% String user_firstname=(String) pageContext.getAttribute(\"user_firstname\", PageContext.SESSION_SCOPE); String user_lastname=(String) pageContext.getAttribute(\"user_lastname\", PageContext.SESSION_SCOPE); String user_bio=(String) pageContext.getAttribute(\"user_bio\", PageContext.SESSION_SCOPE); %> <p>UPDATE YOUR PROFILE</p> First Name:<input type=\"text\" name=\"firstname\" id=\"firstname\" size=\"40\" placeholder=\"First Name\"><%=user_firstname%><br/> Last Name:<input type=\"text\" name=\"lastname\" id=\"lastname\" size=\"40\" placeholder=\"Last Name\"><%=user_lastname%><br/> About Me:<textarea name=\"aboutyou\" id=\"aboutyou\" cols=\"7\" rows=\"40\"><%=user_bio%></textarea> <hr/> <input type=\"submit\" name=\"editprofile\" id=\"editprofile\" value=\"updateprofile\"/> </form> <br/><br/> <%@include file=\"includes/footer.jsp\" %>")) {
            System.out.println("verifyTextPresent failed");
        }
    }
    
    @Test
    public account_settingsTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }

    private void get(String fileCUsersTonyDriverDesktopFarmChatDeskto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
