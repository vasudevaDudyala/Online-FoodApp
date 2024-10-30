package com.foodapp.model;

public class orderhistory {
	private int orderHistoryId;
	private int orderId;
	private int userID;
	private float totalamount;
	private String status;
	private String orderDate;
	public orderhistory() {
	}
	public orderhistory(int orderHistoryId, int orderId, int userID, float totalamount, String status) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.orderId = orderId;
		this.userID = userID;
		this.totalamount = totalamount;
		this.status = status;
	}
	public orderhistory(int orderHistoryId, int orderId, int userID,String orderDate, float totalamount, String status) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.orderId = orderId;
		this.userID = userID;
		this.orderDate=orderDate;
		this.totalamount = totalamount;
		this.status = status;
	}
	public orderhistory(int orderId, int userID, float totalamount, String status) {
		super();
		this.orderId = orderId;
		this.userID = userID;
		this.totalamount = totalamount;
		this.status = status;
	}
	public int getOrderHistoryId() {
		return orderHistoryId;
	}
	public void setOrderHistoryId(int orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getorderDate() {
		return orderDate;
	}
	public void setorderDate(String orderDate) {
		this.orderDate = orderDate;
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
	@Override
	public String toString() {
		return "orderhistory [orderHistoryId=" + orderHistoryId + ", orderId=" + orderId + ", userID=" + userID
				+ ",orderDate="+orderDate+", totalamount=" + totalamount + ", status=" + status + "]";
	}
	
}
