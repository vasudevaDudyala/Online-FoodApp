package com.foodapp.DAO;

import java.util.List;

import com.foodapp.model.menu;

public interface menuDAO {
	int addmenu(menu m);
	List<menu> getAllmenu();
	List<menu> getmenu(int restarent_id);
	menu getmenu1(int restarent_id);
	int deletemenu(String menuname);
	int updatemenu(int restarent_id, String menuname, float price, String description, String isAvailable,
			String imgpath);
}
