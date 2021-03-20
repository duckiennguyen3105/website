package connection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import connection.databaseConnection;
import connection.model.Order;

public class orderDAO {
	public boolean insertOrder(Order order) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "INSERT INTO `nictproject`.`order`(`idOrder`,`phoneUser`,`addUser`,`startDate`,`user_idUser`,`total`,`payment`) VALUES(?,?,?,?,?,?,?);";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, order.getIdOrder());
			ps.setInt(2, order.getPhoneUser());
			ps.setString(3, order.getAddUser());
			ps.setTimestamp(4, order.getStartDate());
			ps.setInt(5, order.getUser_idUser());
			ps.setDouble(6, order.getTotal());
			ps.setString(7, order.getPayment());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		orderDAO order = new orderDAO();
		Order order1 = new Order();
		order1.setIdOrder(133);
		order1.setPayment("live");
		order1.setStartDate(new Timestamp(new Date().getTime()));
		order1.setTotal(20000000);
		order.insertOrder(order1);
	}
}
