import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.mysql.jdbc.Statement;

public abstract class AbstractTests {
	/*
	protected static final String BASE_URL = "http://143.107.58.177:8080/bigode/";
	protected static final String CODIGO_MESA = "1_1";
	protected static WebDriver driver;
	private static String USERNAME = "root";
	private static String PASSWORD = "EACHesi2016!";
	private static String CONN_STRING = "jdbc:mysql://localhost:3306/BIGODE_TESTE";
	private static Connection conn;
	
	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.SEVERE);
	}
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
//		driver = new FirefoxDriver();
		driver = new HtmlUnitDriver(BrowserVersion.CHROME, true);
	    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
		Statement stmt = null;
		stmt = (Statement) conn.createStatement();
		apagaPedidos();
		String cons = "INSERT INTO PRODUTO (NOME_PRODUTO, PRECO_PRODUTO, FOTO_PRODUTO, ID_BAR) VALUES ('testeum', 1.00, 'coxinha.gif', 1)";
	    stmt.executeUpdate(cons);
	    cons = "INSERT INTO PRODUTO (NOME_PRODUTO, PRECO_PRODUTO, FOTO_PRODUTO, ID_BAR) VALUES ('testedois', 0.50, 'coxinhadois.gif', 1)";
	    stmt.executeUpdate(cons);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		Statement stt = null;
		apagaPedidos();
		stt = (Statement) conn.createStatement();
		String rem = "DELETE FROM PRODUTO WHERE NOME_PRODUTO like '%teste%'";
		stt.executeUpdate(rem);
		conn.close();
		driver.quit();
	}
	
	protected int randomInt(int min, int max) {
		Random random = new Random();
		return (random.nextInt((max - min) + 1) + min);
	}
	
	protected boolean isElementPresent(By by) {
	    try {
	    	driver.findElement(by);
	    	return true;
	    } 
	    catch (Exception e) {
	    	return false;
	    }
	}

	protected boolean isAlertPresent() {
		try {
			driver.switchTo().alert();
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	protected static void apagaPedidos() throws SQLException{
		Statement stt = null;
		stt = (Statement) conn.createStatement();
		String remMesa = "DELETE FROM PRODUTO_PEDIDO where ID_PEDIDO IN (SELECT ID_PEDIDO FROM PEDIDO where ID_MESA = 1)";
		stt.executeUpdate(remMesa);
		remMesa = "DELETE FROM PEDIDO WHERE ID_MESA = 1";
		stt.executeUpdate(remMesa);
	}
	*/
}
