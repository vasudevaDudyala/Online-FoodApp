package com.foodapp.model;

public class restarent {
	private int restarent_id;
	private String restarent_name;
	private int delivery_time;
	private String cuisinetype;
	private String address;
	private float ratings;
	private String isactive;
	private int adminid;
	private String imgpath;
	public restarent() {
	}
	public restarent(int restarent_id, String restarent_name, int delivery_time, String cuisinetype, String address,
			float ratings, String isactive, int adminid, String imgpath) {
		super();
		this.restarent_id = restarent_id;
		this.restarent_name = restarent_name;
		this.delivery_time = delivery_time;
		this.cuisinetype = cuisinetype;
		this.address = address;
		this.ratings = ratings;
		this.isactive = isactive;
		this.adminid = adminid;
		this.imgpath = imgpath;
	}
	public restarent(String restarent_name, int delivery_time, String cuisinetype, String address, float ratings,
			String isactive, int adminid, String imgpath) {
		super();
		this.restarent_name = restarent_name;
		this.delivery_time = delivery_time;
		this.cuisinetype = cuisinetype;
		this.address = address;
		this.ratings = ratings;
		this.isactive = isactive;
		this.adminid = adminid;
		this.imgpath = imgpath;
	}
	public int getRestarent_id() {
		return restarent_id;
	}
	public void setRestarent_id(int restarent_id) {
		this.restarent_id = restarent_id;
	}
	public String getRestarent_name() {
		return restarent_name;
	}
	public void setRestarent_name(String restarent_name) {
		this.restarent_name = restarent_name;
	}
	public int getDelivery_time() {
		return delivery_time;
	}
	public void setDelivery_time(int delivery_time) {
		this.delivery_time = delivery_time;
	}
	public String getCuisinetype() {
		return cuisinetype;
	}
	public void setCuisinetype(String cuisinetype) {
		this.cuisinetype = cuisinetype;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getRatings() {
		return ratings;
	}
	public void setRatings(float ratings) {
		this.ratings = ratings;
	}
	public String getIsactive() {
		return isactive;
	}
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	@Override
	public String toString() {
		return "restarent [restarent_id=" + restarent_id + ", restarent_name=" + restarent_name + ", delivery_time="
				+ delivery_time + ", cuisinetype=" + cuisinetype + ", address=" + address + ", ratings=" + ratings
				+ ", isactive=" + isactive + ", adminid=" + adminid + ", imgpath=" + imgpath + "]";
	}
	
}
