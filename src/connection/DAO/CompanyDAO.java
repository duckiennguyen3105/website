package connection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import connection.databaseConnection;
import connection.model.Company;

public class CompanyDAO {
	public ArrayList<Company> getListCompany() throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "SELECT * FROM `nictproject`.`company` ";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		ArrayList<Company> list = new ArrayList<>();
		while (rs.next()) {
			Company company = new Company();
			company.setName(rs.getString("Name"));
			company.setIdCompany(rs.getInt("idCompany"));
			list.add(company);
		}
		return list;
	}
	public boolean InsertCompany(Company c) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql ="INSERT INTO `nictproject`.`company`(`Name`) VALUES (?);";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	public boolean DeteleCompany(int id) throws ClassNotFoundException, SQLException {
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "DELETE FROM `nictproject`.`company` WHERE idCompany = ?;";
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
	public boolean UpdateCompany(Company c) throws ClassNotFoundException, SQLException{
		Connection conn = databaseConnection.getMySQLConnection();
		String sql = "UPDATE `nictproject`.`company`SET `Name` = ? WHERE `idCompany` = ?;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setInt(2, c.getIdCompany());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		CompanyDAO comp = new CompanyDAO();
		comp.UpdateCompany(new Company(22, "la"));
	}
	
}
