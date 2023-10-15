package maven.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseCon {
	static Connection con = null;
	static String url = "jdbc:oracle:thin:@localhost:1521:XE";
	static String driver = "oracle.jdbc.OracleDriver";
	static String userName = "System";
	static String password1 = "Deshmukh";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection myConnection() {
		try {
			con = DriverManager.getConnection(url, userName, password1);
			System.out.println("Connection: " + con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

}
