import java.util.regex.Pattern;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.support.ui.Select;

import com.bd.pkg.ConnectionManager;

public class PreCondicaoTest {
	
    private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private final String USERNAME = "root";
  private final String PASSWORD = "EACHesi2016!";
  private final String CONN_STRING = "jdbc:mysql://localhost:3306/BIGODE_TESTE";
  private Connection conn;
  private StringBuffer verificationErrors = new StringBuffer();
  static {
	    java.util.logging.Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(java.util.logging.Level.SEVERE);
	}

  @Before
  public void setUp() throws Exception {
    driver = new HtmlUnitDriver(true);
    baseUrl = "http://143.107.58.177:8080/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    
  }
  @Test
  public void testEntraSite() throws Exception {
	  driver.get(baseUrl + "/bigode/");
	  assertTrue(driver.getTitle().contains("Bigode"));
  }
  
  @Test
  public void testConexaoBanco() throws Exception{
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
	  boolean aberto = false;
	  if (conn != null)
	  {
		  aberto = true;
		  conn.close();
	  }
	  assertTrue(aberto);
  }

  @After
  public void tearDown() throws Exception {
	driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }

    }
