package com.foodapp.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.orderDAO;
import com.foodapp.dbutils.dbutils;
import com.foodapp.model.menu;
import com.foodapp.model.ordertable;

public class orderDAOImp implements orderDAO{
	Connection con=null;
	int x=0;
	private static final String addorder="insert into ordertable (restarent_id,userID,totalamount,status,paymentMode) values(?,?,?,?,?)";
	private static final String getallorders="select * from ordertable";
	private static final String getorder="select * from odertable where restarent_id=?";
	public orderDAOImp() {
        this.con = dbutils.myconnect();
    }
	public void restarentDAO() {
		try {
			con=dbutils.myconnect();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public int addorder(ordertable m) {
		try {
			PreparedStatement pstmt = con.prepareStatement(addorder);
			pstmt.setInt(1, m.getRestarent_id());
			pstmt.setInt(2, m.getUserID());
			pstmt.setFloat(3,m.getTotalamount());
			pstmt.setString(4, m.getStatus());
			pstmt.setString(5, m.getPaymentMode());
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public List<ordertable> getAllorders() {
		ArrayList al=null;
		try {
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(getallorders);
			al=new ArrayList<ordertable>();
			while(result.next()) {
				int orderid=result.getInt(1);
				int restarentid=result.getInt(2);
				int userid=result.getInt(3);
				float totalamount=result.getFloat(4);
				String status=result.getString(5);
				String paymentmode=result.getString(6);
				ordertable order=new ordertable(orderid,restarentid,userid,totalamount,status,paymentmode);
				al.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	@Override
	public ordertable getorder(int restarent_id) {
		ordertable order=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(getorder);
			pstmt.setInt(1, restarent_id);
			ResultSet result = pstmt.executeQuery();
			if(result.next()) {
				order=new ordertable(result.getInt(1),result.getInt(2),result.getInt(3),result.getFloat(4),result.getString(5),result.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}
	public void updateOrderTotal(int orderId, float total) throws SQLException {
        String sql = "UPDATE ordertable SET totalamount = ? WHERE orderId = ?";
        
        try (Connection conn =dbutils.myconnect(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setFloat(1, total);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();
        }
    }
    
	@Override
	public int getMaxOrderId() throws SQLException {
		int maxOrderId = 0; // Default value if no orders exist
        String sql = "SELECT MAX(orderId) AS maxOrderId FROM ordertable";
        
        try (Connection conn = dbutils.myconnect(); 
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                maxOrderId = rs.getInt("maxOrderId");
                if (rs.wasNull()) {
                    maxOrderId = 0; // Set to 0 if no orders exist
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        
        return maxOrderId;
    }
	

}
