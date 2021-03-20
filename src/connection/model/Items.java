package connection.model;

public class Items {
	private Product product;
	private int numberProduct;
	public Items(Product product, int numberProduct) {
		this.product = product;
		this.numberProduct = numberProduct;
	}
	public Items() {
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getNumberProduct() {
		return numberProduct;
	}
	public void setNumberProduct(int numberProduct) {
		this.numberProduct = numberProduct;
	}
	
	
	
	
}
