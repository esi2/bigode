import static org.junit.Assert.*;

import java.util.logging.*;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.junit.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class EntrarMesaTests {
	
	private static final String mesaInvalidaXPath = "//div[h2/text()='Mesa inválida']";
	private static final String acessarMenuXPath = "//button[@value='Send']";
	
	private static WebDriver driver;
	private static String baseUrl;
	
	static {
		baseUrl = "http://143.107.58.177:8080/bigode/";
	    Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.SEVERE);
	}

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
//		driver = new FirefoxDriver();
		driver = new HtmlUnitDriver();
	    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		driver.quit();
	}
	
	@Before
	public void setup() throws Exception {
		driver.get(baseUrl);
	}

	@Test
	public void testCodigoMesaValido() {
		entrarCodigoMesa("1_1");
		assertTrue(isElementPresent(By.id("submit-btn")));
	}
	
	@Test
	public void testCodigoMesaVazio() {
		entrarCodigoMesa("");
		assertTrue(isElementPresent(By.xpath(mesaInvalidaXPath)));
	}
	
	@Test
	public void testCodigoMesaInvalido() {
		StringBuilder str = new StringBuilder();
		for (int i=0; i<=5; i++) {
			str.append(randomChar());
		}
		
		entrarCodigoMesa(str.toString());
		assertTrue(isElementPresent(By.xpath(mesaInvalidaXPath)));
	}
	
	private void entrarCodigoMesa(String codigo) {
		driver.findElement(By.id("codigoMesa")).clear();
		driver.findElement(By.id("codigoMesa")).sendKeys(codigo);
		driver.findElement(By.xpath(acessarMenuXPath)).click();
	}
	
	private char randomChar() {
		int min = 0x21;
		int max = 0x7E;
		
		Random random = new Random();
		return (char) (random.nextInt((max - min) + 1) + min);
	}
	
	private boolean isElementPresent(By by) {
	    try {
	    	driver.findElement(by);
	    	return true;
	    } 
	    catch (Exception e) {
	    	return false;
	    }
	}

}
