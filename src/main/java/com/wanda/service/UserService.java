package com.wanda.service;

import java.util.List;

import com.wanda.bean.User;

public interface UserService {

	int insertUser(User user);
	int updateUser(User user);
	int deleteUser(String name);
	List<User> selectUser(int pageSize,int pageIndex,String SearchSql);
	
	List<User> selectUser();

	List<User> getBus();

}
