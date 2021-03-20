package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class databaseConnection {
	public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException {
		String hostName = "localhost";
		String dbName = "nictproject";
		String userName = "root";
		String password = "betahouse3105";
		return getMySQLConnection(hostName, dbName , userName, password);

	}

	private static Connection getMySQLConnection(String hostName, String dbName, String userName, String password) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
		return conn;
	}
}
