package com.foodapp.DAO;

import java.util.List;

import com.foodapp.model.restarent;
import com.foodapp.model.user;

public interface restarentDAO {
	int addrestarent(restarent r);
	List<restarent> getAll();
	restarent getrestarent(String email);
	int deleterestarent(String email);
	int updaterestarent(String restarent_name, int delivery_time, String cuisinetype, String address,
			float ratings, String isactive, int adminid, String imgpath);
	List<restarent> getpopularrestarents(int limit);
    List<restarent> searchRestaurants(String query);  


}
