package connection.model;

public class ProductType {
	private int idProductType; 
	private String Name;
	
	public ProductType() {
		
	}
	public ProductType(int idProductType, String name, String company_Name) {
		super();
		this.idProductType = idProductType;
		this.Name = name;

	}
	public int getIdProductType() {
		return idProductType;
	}
	public void setIdProductType(int idProductType) {
		this.idProductType = idProductType;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}

	
	
}
