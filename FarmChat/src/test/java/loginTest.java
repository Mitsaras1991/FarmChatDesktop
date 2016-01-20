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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/login.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@include file=\"includes/dbconnection.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <% String userLogin=request.getParameter(\"user_login\"); pageContext.setAttribute(\"username\",userLogin,pageContext.SESSION_SCOPE); String passwordLogin=request.getParameter(\"password_login\"); pageContext.setAttribute(\"password\",passwordLogin,pageContext.SESSION_SCOPE); String sql_login=\"select id from users where username='\"+userLogin+\"'and password='\"+passwordLogin+\"limit 1\"; if(userLogin!=null && passwordLogin!=null){ userLogin=userLogin.replaceAll(\"#[^A-Za-z0-9]#i\",userLogin); passwordLogin=passwordLogin.replaceAll(\"#[^A-Za-z0-9]#i\", passwordLogin); ResultSet rs_login=conn.createStatement().executeQuery(sql_login); conn.setAutoCommit(true); if(rs_login.getRow()==1){ %> <jsp:forward page=\"profile.jsp\"/> <% } else{ %> Your Password or Username doesnot match <jsp:include page=\"index.jsp\"/> <% } } %>")) {
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
