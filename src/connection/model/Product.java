package connection.model;

public class Product {
	private int idProduct;
	private String name; 
	private double price; 
	private int quantity; 
	private int sale; 
	private String description; 
	private int producttype_idProductType;
	private int ram_memory;
	private String image;
	private int special;
	
	public Product(int idProduct, String name, double price, int quantity, int sale, String description,
			int producttype_idProductType, int ram_memory, String image, int special) {
		this.idProduct = idProduct;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.sale = sale;
		this.description = description;
		this.producttype_idProductType = producttype_idProductType;
		this.ram_memory = ram_memory;
		this.image = image;
		this.special = special;
	}
	public Product() {
	}

	public String getImage() {
		return image;
	}

	public int getSpecial() {
		return special;
	}

	public void setSpecial(int special) {
		this.special = special;
	}

	public void setImage(String image) {
		this.image = image;
	}


	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getProducttype_idProductType() {
		return producttype_idProductType;
	}

	public void setProducttype_idProductType(int producttype_idProductType) {
		this.producttype_idProductType = producttype_idProductType;
	}

	public int getRam_memory() {
		return ram_memory;
	}

	public void setRam_memory(int ram_memory) {
		this.ram_memory = ram_memory;
	}

	
	
	
	
}
