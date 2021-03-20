package connection.model;

import java.sql.Timestamp;

public class Order {
	private int idOrder; 
	private int phoneUser; 
 	private String addUser; 
	private Timestamp startDate;  
	private int user_idUser; 
	private double total;
	private String payment;
	
	public Order( int phoneUser, String addUser, Timestamp startDate, int user_idUser, double total,String payment) {
		super();
		this.phoneUser = phoneUser;
		this.addUser = addUser;
		this.startDate = startDate;
		this.user_idUser = user_idUser;
		this.total = total;
		this.payment = payment;
	}

	public Order() {
	}

	public int getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}

	public int getPhoneUser() {
		return phoneUser;
	}

	public void setPhoneUser(int phoneUser) {
		this.phoneUser = phoneUser;
	}

	public String getAddUser() {
		return addUser;
	}

	public void setAddUser(String addUser) {
		this.addUser = addUser;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public int getUser_idUser() {
		return user_idUser;
	}

	public void setUser_idUser(int user_idUser) {
		this.user_idUser = user_idUser;
	}

	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}
	
	public String getPayment() {
		return payment;
	}
	
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
	
}
