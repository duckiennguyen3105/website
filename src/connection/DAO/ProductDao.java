package connection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

import connection.databaseConnection;
import connection.model.Product;

public class ProductDao {
	public ArrayList<Product> getListProductByProducttype(int producttype_idProductType) throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`product` where `producttype_idProductType` = '"+producttype_idProductType+"';";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product pro = new Product();
			pro.setIdProduct(rs.getInt("idProduct"));
			pro.setName(rs.getString("name"));
			pro.setPrice(rs.getLong("price"));
			pro.setQuantity(rs.getInt("quantity"));
			pro.setRam_memory(rs.getInt("ram_memory"));
			pro.setProducttype_idProductType(rs.getInt("producttype_idProductType"));
			list.add(pro);
		}
		return list;
	}
	public Product getDetailProductById(int idProduct) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`product` where `idProduct`= '"+idProduct+"' ";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		Product pro = new Product();
		while (rs.next()) {
			pro.setIdProduct(rs.getInt("idProduct"));
			pro.setName(rs.getString("name"));
			pro.setPrice(rs.getLong("price"));
			pro.setImage(rs.getString("image"));
			pro.setQuantity(rs.getInt("quantity"));
			pro.setProducttype_idProductType(rs.getInt("producttype_idProductType"));
		}
		return pro;
		
	}
	
	public ArrayList<Product> getListProductByProducttype() throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`product` ;";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product pro = new Product();
			pro.setIdProduct(rs.getInt("idProduct"));
			pro.setName(rs.getString("name"));
			pro.setPrice(rs.getLong("price"));
			pro.setQuantity(rs.getInt("quantity"));
			pro.setRam_memory(rs.getInt("ram_memory"));
			pro.setProducttype_idProductType(rs.getInt("producttype_idProductType"));
			list.add(pro);
		}
		return list;
	}
	public ArrayList<Product> getListSpecialProduct() throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`product` where `special` = '1';";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setIdProduct(rs.getInt("idProduct"));
			pro.setName(rs.getString("name"));
			pro.setIdProduct(rs.getInt("idProduct"));
			pro.setImage(rs.getString("image"));
			pro.setPrice(rs.getLong("price"));
			list.add(pro);
		}
		return list;
		
	}
	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		ProductDao pro = new ProductDao();
		Locale localeVN = new Locale("vi","VN");
		NumberFormat nf = NumberFormat.getInstance(localeVN);
//		ArrayList<Product> product = pro.getListProductByProducttype(3);
//		for(int i=0; i < product.size() && i <= 3; i++) {
//			String price = nf.format(product.get(i).getPrice());
//			System.out.println(product.get(i).getName() + " "+ price);
//		}
//		Product rs = pro.getDetailProductById(1);
//		String str1 = nf.format(rs.getPrice());
//		System.out.println(rs.getName() + " " + str1);
		
		for (Product product : pro.getListSpecialProduct()) {
			String price = nf.format(product.getPrice());
			System.out.println(product.getName() + " " + price);
		}
		System.out.println("------------------------------------------");
		ArrayList<Product> product = pro.getListSpecialProduct();
		for(int i = 0; i < product.size() && i<= 4; i++ ) {
			String price = nf.format(product.get(i).getPrice());
			System.out.println(product.get(i).getName() + " "+ price );
		}
		
	}
}
