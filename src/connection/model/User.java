package connection.model;

public class User {
	private int idUser ;
	private String name;  
	private String password ;
	private int phone; 
	private String address; 
	private String UserType ;
	
	
	public User() {
		
	}
	public User(int idUser, String name, String password, int phone, String address, String userType) {
		super();
		this.idUser = idUser;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.address = address;
		UserType = userType;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserType() {
		return UserType;
	}
	public void setUserType(String userType) {
		UserType = userType;
	}
}
