import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.List;

import org.junit.*;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;

import com.gargoylesoftware.htmlunit.JavaScriptPage;

public class PedidoTest extends AbstractTests {
	
	private static final String acessarMenuXPath = "//button[@value='Send']";

	@Before
	public void setUp() throws Exception {
		driver.get(BASE_URL);
		driver.findElement(By.id("codigoMesa")).clear();
		driver.findElement(By.id("codigoMesa")).sendKeys(CODIGO_MESA);
		driver.findElement(By.xpath(acessarMenuXPath)).click();
		assertTrue(isElementPresent(By.id("submit-btn")));
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCalculoPedido() {  
		List<WebElement> precoElements = driver.findElements(By.className("preco-produto"));
		List<WebElement> qtyElements = driver.findElements(By.id("qty"));
		List<WebElement> buttonUpElements = driver.findElements(By.xpath("//button[@class='button-2d up']"));
		assertEquals(precoElements.size(), qtyElements.size());
		assertEquals(qtyElements.size(), buttonUpElements.size());
		
		int rand;
		int i = 0;
		BigDecimal preco;
		BigDecimal total = BigDecimal.ZERO;
		
		for (WebElement qty : qtyElements) {
			rand = randomInt(0, 9);
			qty.clear();
			qty.sendKeys(Integer.toString(rand));
			
			JavascriptExecutor js = (JavascriptExecutor) driver;
			js.executeScript("arguments[0].blur();", qty);
			
			preco = new BigDecimal(precoElements.get(i).getText().replace(",", "."));
			total = total.add(preco.multiply(new BigDecimal(rand)));
			
			i++;
		}
		
		String str = driver.findElement(By.className("footerText")).getText();
		String substring = str.substring(str.indexOf("$") + 1).replace(",", ".");
		BigDecimal total2 = new BigDecimal(substring.trim());
		
		assertTrue(total.compareTo(total2) == 0);
	}
	
	@Test
	public void testBotaoMaisMenos() {
		List<WebElement> buttonDownElements = driver.findElements(By.xpath("//button[@class='button-2d down']"));
		List<WebElement> buttonUpElements = driver.findElements(By.xpath("//button[@class='button-2d up']"));
		List<WebElement> qtyElements = driver.findElements(By.id("qty"));
		
		assertEquals(buttonDownElements.size(), buttonUpElements.size());
		assertEquals(buttonUpElements.size(), qtyElements.size());
		
		int i = 0;
		for (WebElement qty : qtyElements) {
			qty.clear();
			qty.sendKeys("0");
			
			WebElement buttonUp = buttonUpElements.get(i);
			buttonUp.click();
			buttonUp.click();
			buttonUp.click();
			
			assertEquals(qty.getAttribute("value"), "3");
			
			WebElement buttonDown = buttonDownElements.get(i);
			buttonDown.click();
			buttonDown.click();
			buttonDown.click();
			
			assertEquals(qty.getAttribute("value"), "0");
			i++;
		}
	}

}
