package com.foodapp.model;

public class cartItem {
	private int itemId;
	private int restarentId;
	private String name;
	private int quantity;
	private double price;
	private String imgpath;
	public cartItem() {
	}
	public cartItem(int itemId, int restarentId, String name, int quantity, double price,String imgpath) {
		super();
		this.itemId = itemId;
		this.restarentId = restarentId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.imgpath=imgpath;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getRestarentId() {
		return restarentId;
	}
	public void setRestarentId(int restarentId) {
		this.restarentId = restarentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	@Override
	public String toString() {
		return "cartItem [itemId=" + itemId + ", restarentId=" + restarentId + ", name=" + name + ", quantity="
				+ quantity + ", price=" + price + ",imgpath=" +imgpath+"]";
	}
}
