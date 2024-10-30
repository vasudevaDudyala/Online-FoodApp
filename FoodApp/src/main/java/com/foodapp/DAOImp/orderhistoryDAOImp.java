package com.foodapp.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.orderhistoryDAO;
import com.foodapp.dbutils.dbutils;
import com.foodapp.model.orderhistory;
import com.foodapp.model.restarent;

public class orderhistoryDAOImp implements orderhistoryDAO {
    Connection con = null;
    PreparedStatement pstmt=null;
	ResultSet result =null;
    int x = 0;

    // SQL queries
    private static final String ADD_HISTORY = "insert into orderhistory (orderId, userId, totalamount, status) values(?, ?, ?, ?)";
    private static final String GET_ALL_HISTORY = "select * from orderhistory";
    private static final String GET_HISTORY_BY_ORDER_ID = "select * from orderhistory where orderId=?";

    // Constructor
    public orderhistoryDAOImp() {
        this.con = dbutils.myconnect();
    }

    public void orderhistoryDAO() {
        try {
            con = dbutils.myconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int addorderhistoty(orderhistory order) {
        try {
            pstmt = con.prepareStatement(ADD_HISTORY);
            pstmt.setInt(1, order.getOrderId());
            pstmt.setInt(2, order.getUserID());
            pstmt.setFloat(3, order.getTotalamount());
            pstmt.setString(4, order.getStatus());
            x = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }

    @Override
    public List<orderhistory> getAllorders() {
    		ArrayList al=null;        
    		try {
	            Statement stmt = con.createStatement();
	            result = stmt.executeQuery(GET_ALL_HISTORY);
	            al=new ArrayList<orderhistory>();
            while (result.next()) {
                int orderHistoryId = result.getInt(1);
                int orderId = result.getInt(2);
                int userId = result.getInt(3);
                float totalAmount = result.getFloat(5);
                String status = result.getString(6);

                orderhistory order = new orderhistory(orderHistoryId, orderId, userId, totalAmount, status);
                al.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return al;
    }

    @Override
    public orderhistory getorder(int orderId) {
        orderhistory order = null;
        try {
            pstmt = con.prepareStatement(GET_HISTORY_BY_ORDER_ID);
            pstmt.setInt(1, orderId);
            result = pstmt.executeQuery();
            if (result.next()) {
                order = new orderhistory(result.getInt(1), result.getInt(2), result.getInt(3), result.getFloat(4), result.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public List<orderhistory> getorders(int userId) {
    	List<orderhistory> orderHistoryList = new ArrayList<>();
        String query = "SELECT * FROM orderhistory WHERE userId = ?";  // Adjust SQL query to filter by userId
        ResultSet result = null;
        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);  // Bind userId to the query
            result = pstmt.executeQuery();

            while (result.next()) {
                int orderHistoryId = result.getInt(1);
                int orderId = result.getInt(2);
                int userId1 = result.getInt(3);
                String orderDate=result.getString(4);
                float totalAmount = result.getFloat(5);
                String status = result.getString(6);

                orderhistory order = new orderhistory(orderHistoryId, orderId, userId1,orderDate, totalAmount, status);
                orderHistoryList.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources to avoid memory leaks
            try {
                if (result != null) result.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orderHistoryList;
    }
}
