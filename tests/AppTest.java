import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.support.ui.Select;

public class AppTest {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();
  static {
	    java.util.logging.Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(java.util.logging.Level.SEVERE);
	}

  @Before
  public void setUp() throws Exception {
    driver = new HtmlUnitDriver();
    baseUrl = "http://143.107.58.177:8080/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    
  }
  @Test
  public void testEntraSite() throws Exception {
	  driver.get(baseUrl + "/bigode/");
	  assertTrue(driver.getTitle().contains("Bigode"));
  }
  @Test
  public void testEntraMesaJUnit() throws Exception {
    driver.get(baseUrl + "/bigode/");
    driver.findElement(By.id("codigoMesa")).clear();
    driver.findElement(By.id("codigoMesa")).sendKeys("1_1");
    driver.findElement(By.xpath("//button[@value='Send']")).click();
    assertTrue(driver.findElement(By.cssSelector("p.footerText")).getText().contains("R$ 0,00"));
   
  }
  
 @Test
  public void testANumeroNegativo() throws Exception {
    driver.get(baseUrl + "/bigode/");
    driver.findElement(By.id("codigoMesa")).clear();
    driver.findElement(By.id("codigoMesa")).sendKeys("1_1");
    driver.findElement(By.xpath("//button[@value='Send']")).click();
    driver.findElement(By.cssSelector("button.button-2d.down")).click();
    assertEquals("0", driver.findElement(By.id("qty")).getAttribute("value"));
    assertTrue(driver.findElement(By.cssSelector("p.footerText")).getText().contains("R$ 0,00"));
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
