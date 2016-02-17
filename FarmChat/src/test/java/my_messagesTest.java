import java.io.OutputStream;
import java.io.PrintStream;
import java.util.List;
import java.util.Map;
import org.junit.After;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class my_messagesTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "String sql_fetch_msg_ur=(\"Select * from pvt_messages where user_to='\"+user_logged+\"'and opened='yes'\");";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/my_messages.jsp";

    public my_messagesTest() {
    }

    public my_messagesTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public my_messagesTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public my_messagesTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the my_messagesTest class instance.
     */
    
    OutputStream outContent = null;
    OutputStream errContent = null;
    
    @Before
    public void setUpStreams() {
    System.setOut(new PrintStream(outContent));
    System.setErr(new PrintStream(errContent));
    }
    
    
    @Test
    public my_messagesTest verifyPageLoaded() {
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
     * @return the my_messagesTest class instance.
     */
    
    @Test
    public my_messagesTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
    
   @Test
    public void out() {
    System.out.print("hello");
    assertEquals("hello", outContent.toString());
    }

    @Test
    public void err() {
    System.err.print("hello again");
    assertEquals("hello again", errContent.toString());
    }
    
    @After
    public void cleanUpStreams() {
    System.setOut(null);
    System.setErr(null);
    }
}
