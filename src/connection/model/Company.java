package connection.model;

public class Company {
	private  int idCompany;
	private String Name;

	public Company(String name) {
		Name = name;
		
	}

	public Company(int id, String name) {
		idCompany = id;
		Name = name;
		
	}

	public Company() {
		
	}

	public int getIdCompany() {
		return idCompany;
	}

	public void setIdCompany(int idCompany) {
		this.idCompany = idCompany;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
	
	
	
	
}
