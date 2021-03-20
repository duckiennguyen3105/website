package connection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.databaseConnection;
import connection.model.ProductType;

public class ProductTypeDAO {
	public ArrayList<ProductType> getListProductType(int company_idCompany ) throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`producttype` where `company_idCompany` = '"+company_idCompany+"' ;";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		ArrayList<ProductType> list = new ArrayList<>();
		
		while(rs.next()) {
			ProductType type = new ProductType();
			type.setIdProductType(rs.getInt("idProductType"));
			type.setName(rs.getString("Name"));
			list.add(type);
		}
		return list;
		
	}
	public boolean InsertProductType(ProductType p) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql ="INSERT INTO `nictproject`.`producttype`(`Name`) VALUES (?);";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getName());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	public boolean DeteleProductType(int id) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "DELETE FROM `nictproject`.`producttype` WHERE idProductType = ?;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	public boolean UpdateCompany(ProductType p) throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "UPDATE `nictproject`.`producttype`SET `Name` = ? WHERE `idProductType` = ?;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getName());
			ps.setInt(2, p.getIdProductType());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		ProductTypeDAO pro = new ProductTypeDAO();
		for (ProductType list : pro.getListProductType(2)) {
			System.out.println(list.getIdProductType() + " " + list.getName() );
		}
		
	}
}
