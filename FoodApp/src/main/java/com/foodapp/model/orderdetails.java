package com.foodapp.model;

public class orderdetails {
    private String menuName;
    private float price;
    private int quantity;
    private float subtotal;
    private String imgpath;

    public orderdetails(String menuName, float price, int quantity, float subtotal,String imgpath) {
        this.menuName = menuName;
        this.price = price;
        this.quantity = quantity;
        this.subtotal = subtotal;
        this.imgpath=imgpath;
    }

    // Getters and Setters
    public String getMenuName() {
        return menuName;
    }

    public float getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public float getSubtotal() {
        return subtotal;
    }
    public String getImage() {
        return imgpath;
    }
}
