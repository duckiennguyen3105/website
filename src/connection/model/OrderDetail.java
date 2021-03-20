package connection.model;

public class OrderDetail {
	private int numberProduct; 
	private int order_idOrder; 
	private int product_idProduct; 
	private double price; 
	private int orderdetailID;
	public OrderDetail(int numberProduct, int order_idOrder, int product_idProduct, double price) {
		super();
		this.numberProduct = numberProduct;
		this.order_idOrder = order_idOrder;
		this.product_idProduct = product_idProduct;
		this.price = price;
	}
	public OrderDetail() {
	}
	public int getNumberProduct() {
		return numberProduct;
	}
	public void setNumberProduct(int numberProduct) {
		this.numberProduct = numberProduct;
	}
	public int getOrder_idOrder() {
		return order_idOrder;
	}
	public void setOrder_idOrder(int order_idOrder) {
		this.order_idOrder = order_idOrder;
	}
	public int getProduct_idProduct() {
		return product_idProduct;
	}
	public void setProduct_idProduct(int product_idProduct) {
		this.product_idProduct = product_idProduct;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getOrderdetailID() {
		return orderdetailID;
	}
	public void setOrderdetailID(int orderdetailID) {
		this.orderdetailID = orderdetailID;
	}
	
	
}
