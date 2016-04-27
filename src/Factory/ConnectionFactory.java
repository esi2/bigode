package Factory;

import java.sql.Connection;
import java.sql.DriverManager;



/**
 *
 * @authoR ESI
 */
public class ConnectionFactory {
    public static Connection getConnection() { 
          try  { 
             Class.forName( "com.mysql.jdbc.Driver" );
             String url = "143.107.58.177";
             String nome= "BIGODE";
             String user= "root";
             String pass= "EACHesi2016!";
             Connection con = DriverManager.getConnection("jdbc:mysql://"+url+"/"+nome, user,pass);
             

             return con;
             
              
          } 
          catch(Exception ex) { 
              System.out.println("Database.getConnection() Error -->" + ex.getMessage()); 
              return null; 
          } 
      } 
  
       public static void close(Connection con) { 
          try  { 
              con.close(); 
          } 
          catch(Exception ex) { 
          } 
      } 
}
