package com.foodapp.DAO;

import java.sql.SQLException;
import java.util.List;

import com.foodapp.model.menu;
import com.foodapp.model.orderitem;
import com.foodapp.model.ordertable;


public interface orderDAO {
	int addorder(ordertable orderItem);
	List<ordertable> getAllorders();
	ordertable getorder(int restarent_id);
    void updateOrderTotal(int orderId, float total) throws SQLException;
	   int getMaxOrderId() throws SQLException;
}
