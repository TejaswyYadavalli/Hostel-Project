package DBConnection;
import java.sql.*;
public class DB 
{
public static Connection getConnection()	//Connection getConnection()
	{
	Connection con=null;
		try{
			//type1 with mysql
		/*Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:mysql","root","root");*/

//type1 with oracle
		/*Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:ora","system","admin");*/



//type 4 with oracle
         /*Class.forName("oracle.jdbc.driver.OracleDriver");

     con=DriverManager.getConnection
    ("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
*/

		 //type4 with mysql

Class.forName("org.gjt.mm.mysql.Driver");
con= DriverManager.getConnection
       ("jdbc:mysql://localhost:3306/hostel", "root","root");
			
		
		System.out.println("connected");

		//con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}//catch
		return con;
	}//getconnection

	}//class



















