package com.foodapp.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.orderitemDAO;
import com.foodapp.dbutils.dbutils;
import com.foodapp.model.orderdetails;
import com.foodapp.model.orderitem;
import com.foodapp.model.ordertable;

public class orderitemDAOImp implements orderitemDAO {
	Connection con=null;
	int x=0;
	private static final String additem="insert into orderitem (orderId,menuId,quantity,subtotal) values(?,?,?,?)";
	private static final String getallitems="select * from orderitem";
	private static final String getitem="select * from orderitem where orderId=?";
	private static final String GET_ORDER_ITEMS_QUERY = 
	        "SELECT m.menuname, m.price,m.imgpath, oi.quantity, oi.subtotal " +
	        "FROM orderitem oi " +
	        "JOIN menu m ON oi.menuId = m.menuId " +
	        "WHERE oi.orderId = ?";

	public orderitemDAOImp() {
        this.con = dbutils.myconnect();
    }
	public void orderitemDAO() {
		try {
			con=dbutils.myconnect();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public int addOrder(orderitem m) {
		try {
			PreparedStatement pstmt = con.prepareStatement(additem);
			pstmt.setInt(1, m.getOrderId());
			pstmt.setInt(2, m.getMenuId());
			pstmt.setInt(3,m.getQuantity());
			pstmt.setFloat(4, m.getSubtotal());
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public List<orderitem> getAllorders() {
		ArrayList al=null;
		try {
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(getallitems);
			al=new ArrayList<ordertable>();
			while(result.next()) {
				int orderitemid=result.getInt(1);
				int orderid=result.getInt(2);
				int menuId=result.getInt(3);
				int quantity=result.getInt(4);
				float subtotal=result.getFloat(5);
				
				orderitem order=new orderitem(orderitemid,orderid,menuId,quantity,subtotal);
				al.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	@Override
	public List<orderdetails> getorder(int orderId) {
		List<orderdetails> orderitemlist = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(GET_ORDER_ITEMS_QUERY);
            pstmt.setInt(1, orderId);  // Bind userId to the query
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	String menuName = rs.getString("menuname");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                float subtotal = rs.getFloat("subtotal");
                String imgpath=rs.getString("imgpath");
                
                orderdetails item = new orderdetails(menuName, price, quantity, subtotal,imgpath);
                orderitemlist.add(item);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return orderitemlist;
    }

}
