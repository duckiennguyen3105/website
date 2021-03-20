package connection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.databaseConnection;
import connection.model.OrderDetail;

public class OrderDetailDAO {
	public boolean insertOrderDetail(OrderDetail order) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "INSERT INTO `nictproject`.`orderdetail`(`numberProduct`,`order_idOrder`,`product_idProduct`,`price`) VALUES(?,?,?,?);";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, order.getNumberProduct());
			ps.setInt(2, order.getOrder_idOrder());
			ps.setInt(3, order.getProduct_idProduct());
			ps.setDouble(4, order.getPrice());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		OrderDetailDAO dao = new OrderDetailDAO();
		dao.insertOrderDetail(new OrderDetail(4 ,3 , 2, 3000000));
	}
}
