package connection;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionUtils {
	private static Connection getMyConnection() throws ClassNotFoundException, SQLException {
		
		return databaseConnection.getMySQLConnection();
	}

	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Connection conn = ConnectionUtils.getMyConnection();
		System.out.println("Get connection:" + conn);
		System.out.println("done");
		
	}

}