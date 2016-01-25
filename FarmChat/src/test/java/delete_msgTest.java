import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.util.List;
import java.util.Map;
import org.junit.Assert;
import org.junit.Test;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class delete_msgTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "&lt;script type=\"javascript\"&gt; alert(\"Message has not been deleted \")&lt;/script&gt;";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/delete_msg.jsp";

    public delete_msgTest() {
    }

    public delete_msgTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public delete_msgTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public delete_msgTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the delete_msgTest class instance.
     */
    
    @Test
    public delete_msgTest verifyPageLoaded() {
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
    public void test(){
        String sql_delete_msg=("delete * from pvt_messages where id='"+driver+"'");
            Assert.assertNull(sql_delete_msg ,"");
        }
    
    @Test
    public delete_msgTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
}
