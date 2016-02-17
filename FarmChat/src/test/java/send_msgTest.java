import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Map;
import junit.framework.TestCase;
import org.junit.After;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
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
     */

  public class send_messageTest extends TestCase {
    Connection connect;
    Statement stmnt;
    ResultSet rs;
    Calendar date_added = Calendar.getInstance();
    String user_logged="aaa";
    String user_msg_to="bbb";
    String msg_body="ccc";
    String opened="no";
    
    public void insertData() throws SQLException{
        try
            {
            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("Working1");
            connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/farmchat", "root", "");  // Establishing Connection
            stmnt = connect.createStatement();   // To create a Statement
            //System.out.println("Working2");
            String send_message=("insert into pvt_messages('user_from','user_to','msg_body','date','opened') values('"+user_logged+"','"+user_msg_to+"','"+msg_body+"','"+date_added+"','"+opened+"'");
            rs=connect.createStatement().executeQuery(send_message);
            //rs = stmnt.executeQuery("INSERT into Table1 values('Arjun')");
            connect.close();
            stmnt.close();
            rs.close();
        }
        catch(ClassNotFoundException e1){
            e1.printStackTrace();
        }
        catch(SQLException e2){
            e2.printStackTrace();
        }
    }
    
    @Test
    public void testInsertData(){
        try{
            send_messageTest object = new send_messageTest();
            object.insertData();
            rs = stmnt.executeQuery("select * from pvt_messages");
            rs.next();
            assertEquals("aaa",rs.getRef("user_from"));
        }
        catch(SQLException e2){
            e2.printStackTrace();
        }
    }
    
    @After
    @Override
    protected void tearDown() throws Exception {
        String delete_message=("delete from pvt_messages where user_from='"+user_logged+"'");
        try{
            rs=connect.createStatement().executeQuery(delete_message);
        }
        catch(SQLException e2){
            e2.printStackTrace();
        }
        super.tearDown();
        connect.close();
        stmnt.close();
        rs.close();
    }
  }
}
