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

public class send_msgTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "String sql_send_msg=(\"insert into pvt_messages('user_from','user_to','msg_body','date','opened') values('\"+user_logged+\"','\"+user_msg_to+\"','\"+msg_body+\"','\"+date_added+\"','\"+opened+\"')\");";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/send_msg.jsp";

    public send_msgTest() {
    }

    public send_msgTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public send_msgTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public send_msgTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the send_msgTest class instance.
     */
    
    @Test
    public send_msgTest verifyPageLoaded() {
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
     * @return the send_msgTest class instance.
     */
    
    @Test
    public send_msgTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
}
