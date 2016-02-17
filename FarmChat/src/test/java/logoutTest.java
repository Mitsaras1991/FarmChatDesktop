import java.util.Map;
import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class logoutTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "&lt;%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%&gt;";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/logout.jsp";

    public logoutTest() {
    }

    public logoutTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public logoutTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
        assertEquals(this.data,null);
    }

    public logoutTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the logoutTest class instance.
     */
    
    @Test
    public logoutTest verifyPageLoaded() {
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
     */
    
    
    @Test
    public logoutTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
    
    @Test
    public void test_username(){
        String username= "abcd";
        assertEquals(username,"");
    }
}
