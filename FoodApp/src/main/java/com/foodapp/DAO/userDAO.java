package com.foodapp.DAO;

import java.util.List;

import com.foodapp.model.user;

public interface userDAO {
	int adduser(user u);
	List<user> getAll();
	user getUser(String email);
	int deleteuser(String email);
	int updateuser(String email, String username, String password, String address, String phonenumber);
}
