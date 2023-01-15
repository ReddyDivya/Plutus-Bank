package  Bank;

import java.sql.*;

public class DBConnection{

	public static Connection con;
	public static Statement stmt;
	public static ResultSet rs;
	
	public void DBConnection()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			this.con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
			this.stmt = (Statement)con.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}	