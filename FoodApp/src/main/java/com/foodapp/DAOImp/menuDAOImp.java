package com.foodapp.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.menuDAO;
import com.foodapp.dbutils.dbutils;
import com.foodapp.model.menu;
import com.foodapp.model.restarent;

public class menuDAOImp implements menuDAO{
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet result =null;
	int x=0;
	private static final String addmenu="insert into menu (restarent_id,menuname,price,description,isAvailable,imgpath) values(?,?,?,?,?,?)";
	private static final String getall="select * from menu";
	private static final String getmenu="select * from menu where restarent_id=?";
	private static final String getmenu1="select * from menu where menuId=?";
	private static final String deletemenu="delete from menu where menuname=?";
	private static final String updatemenu="update menu set menuname=? price=? description=? isAvailable=? imgpath=? where menuname=?";
	public menuDAOImp() {
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
	public int addmenu(menu m) {
		try {
			pstmt = con.prepareStatement(addmenu);
			pstmt.setInt(1, m.getRestarent_id());
			pstmt.setString(2,m.getMenuname());
			pstmt.setFloat(3, m.getPrice());
			pstmt.setString(4, m.getDescription());
			pstmt.setString(5, m.getIsAvailable());
			pstmt.setString(6, m.getImgpath());
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return x;
	}

	@Override
	public List<menu> getAllmenu() {
		ArrayList al=null;
		try {
			Statement stmt = con.createStatement();
			result = stmt.executeQuery(getall);
			al=new ArrayList<menu>();
			while(result.next()) {
				int menuId=result.getInt(1);
				int restarent_id=result.getInt(2);
				String menuname=result.getString(3);
				float price=result.getFloat(4);
				String description=result.getString(5);
				String isAvailable=result.getString(6);
				String imgpath=result.getString(7);
				menu m=new menu(menuId,restarent_id,menuname,price,description,isAvailable,imgpath);
				al.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	@Override
	public List<menu> getmenu(int restarent_id) {
		ArrayList al=null;
		try {
			pstmt = con.prepareStatement(getmenu);
			pstmt.setInt(1, restarent_id);
			ResultSet result = pstmt.executeQuery();
			al=new ArrayList<menu>();
			while(result.next()) {
				int menuId=result.getInt(1);
				restarent_id=result.getInt(2);
				String menuname=result.getString(3);
				float price=result.getFloat(4);
				String description=result.getString(5);
				String isAvailable=result.getString(6);
				String imgpath=result.getString(7);
				menu m=new menu(menuId,restarent_id,menuname,price,description,isAvailable,imgpath);
				al.add(m);
//				m=new menu(result.getInt(1),result.getInt(2),result.getString(3),result.getFloat(4),result.getString(5),result.getString(6),result.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	@Override
	public int deletemenu(String menuname) {
		try {
			pstmt = con.prepareStatement(deletemenu);
			pstmt.setString(1, menuname);
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public int updatemenu(int restarent_id, String menuname, float price, String description, String isAvailable,
			String imgpath) {
		try {
			pstmt = con.prepareStatement(updatemenu);
			pstmt.setString(1, menuname);
			pstmt.setFloat(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, isAvailable);
			pstmt.setString(5, imgpath);
			pstmt.setInt(6, restarent_id);
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}
	@Override
	public menu getmenu1(int restarent_id) {
		menu m=null;
		try {
			pstmt = con.prepareStatement(getmenu1);
			pstmt.setInt(1, restarent_id);
			result = pstmt.executeQuery();
			if(result.next()) {
            	m=new menu(result.getInt(1),result.getInt(2),result.getString(3),result.getFloat(4),result.getString(5),result.getString(6),result.getString(7));

//				r=new restarent(result.getInt(1),result.getString(2),result.getInt(3),result.getString(4),result.getString(5),result.getFloat(6),result.getString(7),result.getInt(8),result.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return m;
	}

}
