package com.wanda.service;

import java.util.List;

import com.wanda.bean.User;

public interface UserLoginService {

	//List<User> selectUser(int pageSize,int pageIndex,String SearchSql);
	
	/**
	 * 登录校验
	 * @param userId
	 * @param password
	 * @return
	 */
	User loginCheck(String userId,String password);
	
	/**
	 * 查询所有用户的所有信息
	 * @return
	 */
	List<User> getAllUser();
	
	/**
	 * 查询所有 未删除状态 用户的所有信息
	 * @return
	 */
	List<User> getAllUserNoDelete();
	
	/**
	 * 添加用户所有信息
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * 删除用户所有信息
	 * @param userId
	 */
	int deleteUserByUserId(String userId);
	
	/**
	 * 根据账号查询用户信息
	 * @param userId
	 * @return
	 */
	User selectUserByUserId(String userId);

	/**
	 * 根据账号修改一个用户信息
	 * @param user
	 * @return
	 */
	int updateUserByUserId(User user);

	/**
	 * 根据账号修改一个用户信息删除状态
	 * @param user
	 * @return
	 */
	int updateDeleteStateByUserId(User user);

}
