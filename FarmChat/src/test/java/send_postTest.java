import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class send_postTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "String sql=(\"insert into posts values('\"+post+\"','\"+date_added+\"','\"+user_logged+\"','\"+user_posting_to+\"'\");";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/send_post.jsp";

    public send_postTest() {
    }

    public send_postTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public send_postTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public send_postTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the send_postTest class instance.
     */
    
    @Test
    public send_postTest verifyPageLoaded() {
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
     * @return the send_postTest class instance.
     */
    
    @Test
    public send_postTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
}
