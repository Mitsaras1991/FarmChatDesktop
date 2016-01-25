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
        wd.get("file:///C:/Users/Tony-Driver/Desktop/FarmChatDesktop/FarmChat/src/main/webapp/js/main.js//");
        if (!wd.findElement(By.tagName("html")).getText().contains("function send_post(){ var hr=XMLHttpRequest(); var url=\"send_post.jsp\"; var fn=document.getElementById(\"post\").value; var vars=\"post=\"+fn; hr.open(\"POST\",url,true); hr.setRequestHeader(\"Content-type\",\"application/x-www-form-urlencoded\"); hr.onreadystatechange=function(){ if(hr.readyState==4 && hr.status==200){ var return_data=hr.responseText; document.getElementById(\"status\").innerHTML=return_data; } } hr.send(vars); document.getElementById(\"status\").innerHTML=\"processing.....\"; }")) {
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
