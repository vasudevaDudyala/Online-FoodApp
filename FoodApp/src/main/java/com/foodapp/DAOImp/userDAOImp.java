package com.foodapp.DAOImp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.userDAO;
import com.foodapp.dbutils.dbutils;
import com.foodapp.model.user;

public class userDAOImp implements userDAO{
	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet result=null;
	int x=0;
	private static final String adduser="insert into user(email,username,password,address,phonenumber) values(?,?,?,?,?)";
	private static final String getalldata="select * from user";
	private static final String getuser="select * from user where email=?";
	private static final String deleteuser="delete from user where email=?";
	private static final String updateuser="update user set username=?, password=?, address=?, phonenumber=? where email=?";
	public userDAOImp() {
        this.con = dbutils.myconnect();
    }
	public void userDAO() {
		try {
			con=dbutils.myconnect();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	} 
	public int adduser(user u) {
		try {
			pstmt = con.prepareStatement(adduser);
			pstmt.setString(1, u.getEmail());
			pstmt.setString(2, u.getUsername());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getPhonenumber());
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}
	public List<user> getAll() {
		ArrayList<user> li=null;
		try {
			 Statement stmt = con.createStatement();
			 result = stmt.executeQuery(getalldata);
			 li=new ArrayList<user>();
			 while(result.next()) {
				 int userid=result.getInt("userId");
				 String email=result.getString("email");
				 String username=result.getString("username");
				 String password=result.getString("password");
				 String address=result.getString("address");
				 String phonenumber=result.getString("phonenumber");
				 user u=new user(userid,email,username,password,address,phonenumber);
				 li.add(u);
			 }
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	@Override
	public user getUser(String email) {
		user u=null;
		try {
		    pstmt = con.prepareStatement(getuser);
			pstmt.setString(1, email);
			result = pstmt.executeQuery();
			if(result.next()) {
				 u=new user(result.getInt(1),result.getString(2),result.getString(3),result.getString(4),result.getString(5),result.getString(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	@Override
	public int deleteuser(String email) {
		try {
			pstmt = con.prepareStatement(deleteuser);
			pstmt.setString(1, email);
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}
	@Override
	public int updateuser(String email, String username, String password, String address, String phonenumber) {
		try {
			pstmt = con.prepareStatement(updateuser);
			pstmt.setString(1, username);
			pstmt.setString(2,password);
			pstmt.setString(3,address );
			pstmt.setString(4,phonenumber );
			pstmt.setString(5,email );
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

}
