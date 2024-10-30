package com.foodapp.DAO;

import java.util.List;

import com.foodapp.model.orderhistory;


public interface orderhistoryDAO {
	int addorderhistoty(orderhistory m);
	List<orderhistory> getAllorders();
	orderhistory getorder(int orderId);
	List<orderhistory> getorders(int userId);

}
