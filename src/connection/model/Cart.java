package connection.model;

import java.util.HashMap;
import java.util.Map.Entry;

public class Cart {
	private HashMap<Integer,Items> cartItems;

	public Cart(HashMap<Integer, Items> cartItems) {
		super();
		this.cartItems = cartItems;
	}

	public Cart() {
		cartItems = new HashMap<>();
	}

	public HashMap<Integer, Items> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Integer, Items> cartItems) {
		this.cartItems = cartItems;
	}

	//thêm hàng vào giỏ
	public void plusToCart(Integer key, Items items) {
		boolean check = cartItems.containsKey(key);
		if(check) {
			int numberItem = items.getNumberProduct();
			items.setNumberProduct(numberItem + 1);
			cartItems.put(key, items);
		}
		else {
			cartItems.put(key, items);
		}
	}


	//trừ hàng trong giỏ
	public void minusToCart(Integer key, Items items) {
		boolean check = cartItems.containsKey(key);
		if(check) {
			int numberItem = items.getNumberProduct();
			if(numberItem <= 1) {
				cartItems.remove(key);
			}
			else {
				items.setNumberProduct(numberItem - 1);
				cartItems.put(key, items);
			}
		}
	}
	
	//xoá hàng trong giỏ
	public void removeToCart(Integer key) {
		boolean check = cartItems.containsKey(key);
		if(check) {
			cartItems.remove(key);
		}
	}
	
	//đếm hàng
	public int countItems() {
		 
		return cartItems.size();
	}
	
	//tính tiền
	public double sumTotal() {
		double sum= 0;
		for (Entry<Integer, Items> list : cartItems.entrySet()) {
			sum += list.getValue().getProduct().getPrice() * list.getValue().getNumberProduct(); 
		}
		return sum;
	}
	public static void main(String[] args) {
		Cart cart= new Cart();
		System.out.println(cart.countItems());
	}

}

