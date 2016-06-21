import static org.junit.Assert.*;

import org.junit.*;
import org.openqa.selenium.*;

public class EntrarMesaTest extends AbstractTests {
	
	private static final String mesaInvalidaXPath = "//div[h2/text()='Mesa inválida']";
	private static final String acessarMenuXPath = "//button[@value='Send']";
	
	@Before
	public void setup() throws Exception {
		driver.get(BASE_URL);
	}

	@Test
	public void testCodigoMesaValido() {
		entrarCodigoMesa(CODIGO_MESA);
		assertTrue(isElementPresent(By.id("submit-btn")));
	}
	
	//@Test
	//public void testCodigoMesaVazio() {
	//	entrarCodigoMesa("");
	//	assertTrue(isElementPresent(By.xpath(mesaInvalidaXPath)));
	//}
	
	/*@Test
	public void testCodigoMesaInvalido() {
		StringBuilder str = new StringBuilder();
		for (int i=0; i<=5; i++) {
			str.append(randomChar());
		}
		
		entrarCodigoMesa(str.toString());
		assertTrue(isElementPresent(By.xpath(mesaInvalidaXPath)));
	}
	*/
	private void entrarCodigoMesa(String codigo) {
		driver.findElement(By.id("codigoMesa")).clear();
		driver.findElement(By.id("codigoMesa")).sendKeys(codigo);
		driver.findElement(By.xpath(acessarMenuXPath)).click();
	}
	
	private char randomChar() {
		return (char) randomInt(0x21, 0x7E);
	}

}
