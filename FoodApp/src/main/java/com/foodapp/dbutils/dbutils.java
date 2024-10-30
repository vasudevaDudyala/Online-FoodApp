package com.foodapp.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbutils {
	public static Connection myconnect() {
		Connection  con=null;
		final String url="jdbc:mysql://localhost:3306/foodapp";
		final String username="root";
		final String password="dnr_vasu@2003";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
