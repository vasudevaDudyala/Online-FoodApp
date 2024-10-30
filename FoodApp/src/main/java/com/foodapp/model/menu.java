package com.foodapp.model;

public class menu {
	private int menuId;
	private int restarent_id;
	private String menuname;
	private float price;
	private String description;
	private String isAvailable;
	private String imgpath;
	public menu() {
	}
	public menu(int menuId, int restarent_id, String menuname, float price, String description, String isAvailable,
			String imgpath) {
		super();
		this.menuId = menuId;
		this.restarent_id = restarent_id;
		this.menuname = menuname;
		this.price = price;
		this.description = description;
		this.isAvailable = isAvailable;
		this.imgpath = imgpath;
	}
	public menu(int restarent_id, String menuname, float price, String description, String isAvailable,
			String imgpath) {
		super();
		this.restarent_id = restarent_id;
		this.menuname = menuname;
		this.price = price;
		this.description = description;
		this.isAvailable = isAvailable;
		this.imgpath = imgpath;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getRestarent_id() {
		return restarent_id;
	}
	public void setRestarent_id(int restarent_id) {
		this.restarent_id = restarent_id;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	@Override
	public String toString() {
		return "menu [menuId=" + menuId + ", restarent_id=" + restarent_id + ", menuname=" + menuname + ", price="
				+ price + ", description=" + description + ", isAvailable=" + isAvailable + ", imgpath=" + imgpath
				+ "]";
	}
	
	
}
