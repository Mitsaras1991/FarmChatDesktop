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

public class upload_photoTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "ServletFileUpload upload = new ServletFileUpload(factory);";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/upload_photo.jsp";

    public upload_photoTest() {
    }

    public upload_photoTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public upload_photoTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public upload_photoTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the upload_photoTest class instance.
     */
    
    @Test
    public upload_photoTest verifyPageLoaded() {
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
     * @return the upload_photoTest class instance.
     */
    
    @Test
    public upload_photoTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
}
