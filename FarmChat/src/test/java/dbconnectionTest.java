import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class dbconnectionTest {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    private final String pageLoadedText = "String url=\"jdbc:mysql://localhost:3306/snapchat\";";

    private final String pageUrl = "/C:/Users/Tony-Driver/Documents/NetBeansProjects/FarmChatDesktop/FarmChat/src/main/webapp/includes/dbconnection.jsp";

    public dbconnectionTest() {
    }

    public dbconnectionTest(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public dbconnectionTest(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public dbconnectionTest(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the dbconnectionTest class instance.
     */
    @Test
    public dbconnectionTest verifyPageLoaded() {
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
     * @throws java.lang.ClassNotFoundException
     */
    
    @Test
    public void Test () throws ClassNotFoundException {
        String Url = "jdbc:mysql://localhost:3306/snapchat";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Trying to connect");
                Connection connection = DriverManager.getConnection(Url);
                System.out.println("Connection Established Successfull and the DATABASE NAME IS:"
                        + connection.getMetaData().getDatabaseProductName());
                } catch (ClassNotFoundException | SQLException e) {
                    System.out.println("Unable to make connection with DB");
            }
    }
    
    @Test
    public dbconnectionTest verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
}
