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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/view_albums.jsp//");
        if (!wd.findElement(By.tagName("html")).getText().contains("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%> <%@ page import=\"java.io.*,java.util.*\" %> <%@ page import=\"org.apache.commons.fileupload.*\" %> <%@ page import=\"org.apache.commons.fileupload.disk.*\" %> <%@ page import=\"org.apache.commons.fileupload.servlet.*\" %> <%@include file=\"includes/dbconnection.jsp\" %> <%@ page import=\"java.io.*,java.util.*,java.sql.*\"%> <%@ page import=\"javax.servlet.http.*,javax.servlet.*\" %> <%@include file=\"includes/connection.jsp\" %> <% String usernamelog=(String) pageContext.getAttribute(\"username\", PageContext.SESSION_SCOPE); %> <div class=\"textHeader\"><h2><%=usernamelog%>'s Albums</h2>></div> <table> <tr> <% String sql_albums=\"select * from albums where created_by='\"+usernamelog+\"'\"; ResultSet user_albums=conn.createStatement().executeQuery(sql_albums); while(user_albums.next()){ int id=user_albums.getInt(1); String album_title=user_albums.getString(2); String album_description=user_albums.getString(3); String created_by=user_albums.getString(4); java.sql.Date date_created=user_albums.getDate(5); String uid=user_albums.getString(6); %> <td> <div class=\"albums\"> <a href=\"view_photo.jsp\"> <img src=\"#\" height=\"250\" width=\"200\" alt=<%=album_title%>\"album\"><br><br> <%out.println(album_title);%> </a>> </div>> </td> <% }%> </tr> </table> <% String album_title=(String) pageContext.getAttribute(\"album_title\", PageContext.SESSION_SCOPE); String uid=(String) pageContext.getAttribute(\"uid\", PageContext.SESSION_SCOPE); %>")) {
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
