package com.foodapp.DAO;

import java.util.List;

import com.foodapp.model.orderdetails;
import com.foodapp.model.orderitem;


public interface orderitemDAO {
	int addOrder(orderitem m);
	List<orderitem> getAllorders();
	List<orderdetails> getorder(int orderId);
}
