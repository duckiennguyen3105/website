package connection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.databaseConnection;
import connection.model.User;

public class UserDAO {
	public boolean CheckUser(String name) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql ="SELECT * FROM `nictproject`.`user` where `name` = '"+name+"';";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				conn.close();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public boolean insertUser (User u) throws ClassNotFoundException, SQLException  {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "INSERT INTO `nictproject`.`user`(`name`,`password`,`phone`,`address`) VALUES(?,?,?,?);";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, u.getName());
			statement.setString(2, u.getPassword());
			statement.setInt(3, u.getPhone());
			statement.setString(4, u.getAddress());
			statement.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public User loginUser (String name, String password) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`user` where `name` = '"+name+"' and `password` = '"+password+"';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			User u = new User();
			u.setIdUser(rs.getInt("idUser"));
			u.setName(rs.getString("name"));
			u.setPassword(rs.getString("password"));
			u.setPhone(rs.getInt("phone"));
			conn.close();
			return u;
		}
		return null;
	}
	
}
