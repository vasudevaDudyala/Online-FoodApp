package com.foodapp.model;

public class ordertable {
	private int orderId;
	private int restarent_id;
	private int userID;
	private float totalamount;
	private String status;
	private String paymentMode;
	public ordertable() {
	}
	public ordertable(int orderId, int restarent_id, int userID, float totalamount, String status, String paymentMode) {
		super();
		this.orderId = orderId;
		this.restarent_id = restarent_id;
		this.userID = userID;
		this.totalamount = totalamount;
		this.status = status;
		this.paymentMode = paymentMode;
	}
	public ordertable(int restarent_id, int userID, float totalamount, String status, String paymentMode) {
		super();
		this.restarent_id = restarent_id;
		this.userID = userID;
		this.totalamount = totalamount;
		this.status = status;
		this.paymentMode = paymentMode;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getRestarent_id() {
		return restarent_id;
	}
	public void setRestarent_id(int restarent_id) {
		this.restarent_id = restarent_id;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public float getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(float totalamount) {
		this.totalamount = totalamount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	@Override
	public String toString() {
		return "ordertable [orderId=" + orderId + ", restarent_id=" + restarent_id + ", userID=" + userID
				+ ", totalamount=" + totalamount + ", status=" + status + ", paymentMode=" + paymentMode + "]";
	} 
	
	
	
	
}
