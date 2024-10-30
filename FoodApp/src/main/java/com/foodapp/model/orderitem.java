package com.foodapp.model;

public class orderitem {
	private int orderitemId;
	private int orderId;
	private int menuId;
	private int quantity;
	private float subtotal;
	public orderitem() {
	}
	public orderitem(int orderitemId, int orderId, int menuId, int quantity, float subtotal) {
		super();
		this.orderitemId = orderitemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}
	public orderitem(int orderId, int menuId, int quantity, float subtotal) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}
	public int getOrderitemId() {
		return orderitemId;
	}
	public void setOrderitemId(int orderitemId) {
		this.orderitemId = orderitemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	@Override
	public String toString() {
		return "orderitem [orderitemId=" + orderitemId + ", orderId=" + orderId + ", menuId=" + menuId + ", quantity="
				+ quantity + ", subtotal=" + subtotal + "]";
	}
	
}
