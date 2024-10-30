package com.foodapp.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.restarentDAO;
import com.foodapp.dbutils.dbutils;
import com.foodapp.model.restarent;
import com.foodapp.model.user;

public class restarentDAOImp implements restarentDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet result =null;
	int x=0;
	private static final String addrestarent="insert into restarent (restarent_name,delivery_time,cuisinetype,address,ratings,isactive,adminid,imgpath) values(?,?,?,?,?,?,?,?,?)";
	private static final String getall="select * from restarent";
	private static final String getrestarent="select * from restarent where email=?";
	private static final String deleteres="delete from restarent where email=?";
	private static final String updateres="update restarent set delivery_time=? cuisinetype=? address=? ratings=? isactive=? admin_id=? imgpath=? where restarent_name=?";
	private static final String getpopularres="SELECT * FROM restarent ORDER BY ratings DESC LIMIT ?";
	public restarentDAOImp() {
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
	public int addrestarent(restarent r) {
		try {
			pstmt = con.prepareStatement(addrestarent);
			pstmt.setString(1, r.getRestarent_name());
			pstmt.setInt(2, r.getDelivery_time());
			pstmt.setString(3, r.getCuisinetype());
			pstmt.setString(4, r.getAddress());
			pstmt.setFloat(5, r.getRatings());
			pstmt.setString(6, r.getIsactive());
			pstmt.setInt(7,r.getAdminid());
			pstmt.setString(8, r.getImgpath());
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public List<restarent> getAll() {
		ArrayList al=null;
		try {
			Statement stmt = con.createStatement();
			result = stmt.executeQuery(getall);
			al=new ArrayList<restarent>();
			while(result.next()) {
				int restarent_id=result.getInt(1);
				String restarent_name=result.getString(2);
				int delivery_time=result.getInt(3);
				String cuisientype=result.getString(4);
				String address=result.getString(5);
				Float ratings=result.getFloat(6);
				String isactive=result.getString(7);
				int adminid=result.getInt(8);
				String imgpath=result.getString(9);
				restarent r=new restarent(restarent_id,restarent_name,delivery_time,cuisientype,address,ratings,isactive, adminid,imgpath);
				al.add(r);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	@Override
	public restarent getrestarent(String email) {
		restarent r=null;
		try {
			pstmt = con.prepareStatement(getrestarent);
			pstmt.setString(1, email);
			result = pstmt.executeQuery();
			if(result.next()) {
				r=new restarent(result.getInt(1),result.getString(2),result.getInt(3),result.getString(4),result.getString(5),result.getFloat(6),result.getString(7),result.getInt(8),result.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	@Override
	public int deleterestarent(String email) {
		try {
			pstmt = con.prepareStatement(deleteres);
			pstmt.setString(1,email);
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public int updaterestarent(String restarent_name, int delivery_time, String cuisinetype, String address,
			float ratings, String isactive, int adminid, String imgpath) {
		try {
		    pstmt = con.prepareStatement(updateres);
			pstmt.setInt(1,delivery_time);
			pstmt.setString(2, cuisinetype);
			pstmt.setString(3, address);
			pstmt.setFloat(4, ratings);
			pstmt.setString(5, isactive);
			pstmt.setInt(6, adminid);
			pstmt.setString(7, imgpath);
			pstmt.setString(8, restarent_name);
			x=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}
	@Override
	public List<restarent> getpopularrestarents(int limit) {
		ArrayList<restarent> al=null;
		try {
			pstmt=con.prepareStatement(getpopularres);
			pstmt.setInt(1, limit);
			result=pstmt.executeQuery();
			al=new ArrayList<restarent>();
			while(result.next()) {
				int restarent_id=result.getInt(1);
				String restarent_name=result.getString(2);
				int delivery_time=result.getInt(3);
				String cuisientype=result.getString(4);
				String address=result.getString(5);
				Float ratings=result.getFloat(6);
				String isactive=result.getString(7);
				int adminid=result.getInt(8);
				String imgpath=result.getString(9);
				restarent r=new restarent(restarent_id,restarent_name,delivery_time,cuisientype,address,ratings,isactive, adminid,imgpath);
				al.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return al;
	}
	@Override
	public List<restarent> searchRestaurants(String query) {
	    List<restarent> restaurantList = new ArrayList<>();

	    try {
	        String sql = "SELECT * FROM restarent WHERE UPPER(restarent_name) LIKE ? OR LOWER(cuisinetype) LIKE ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, "%" + query.toLowerCase() + "%");
	        ps.setString(2, "%" + query.toLowerCase() + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            restarent r = new restarent();
	            r.setRestarent_id(rs.getInt("restarent_id"));
	            r.setRestarent_name(rs.getString("restarent_name"));
	            r.setDelivery_time(rs.getInt("delivery_time"));
	            r.setCuisinetype(rs.getString("cuisinetype"));
	            r.setAddress(rs.getString("address"));
	            r.setRatings(rs.getFloat("ratings"));
	            // Add additional fields as needed
	            
	            // Debugging output
	            System.out.println("Found restaurant: " + r.getRestarent_name() + ", Delivery Time: " + r.getDelivery_time());

	            restaurantList.add(r);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return restaurantList;
	}

	
	

}
