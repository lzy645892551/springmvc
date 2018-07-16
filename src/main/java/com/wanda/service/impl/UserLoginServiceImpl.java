package com.wanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wanda.bean.User;
import com.wanda.dao.UserLoginDao;
import com.wanda.service.UserLoginService;
 
 
 
@Service
public class UserLoginServiceImpl implements UserLoginService{
 
    @Autowired
    @Qualifier("userLoginDao")
    private UserLoginDao userLoginDao;
     

	/**
	 * 登录校验
	 */
	public User loginCheck(String userId, String password) {
		return userLoginDao.loginCheck(userId, password);
	}
	
	/**
	 * 查询所有用户
	 */
	public List<User> getAllUser() {
		return  userLoginDao.getAllUser();
	}
	
	/**
	 * 查询所有  未删除状态  用户 
	 */
	public List<User> getAllUserNoDelete() {
		return  userLoginDao.getAllUserNoDelete();
	}

	/**
	 * 添加用户
	 */
	public int addUser(User user) {
		return userLoginDao.addUser(user);
	}

	/**
	 * 删除用户
	 */
	public int deleteUserByUserId(String userId) {
		return userLoginDao.deleteUserByUserId(userId);
	}

	/**
	 * 根据账号查询信息
	 */
	public User selectUserByUserId(String userId) {
		return userLoginDao.selectUserByUserId(userId);
	}

	/**
	 * 根据账号修改用户信息
	 */
	public int updateUserByUserId(User user) {
		return userLoginDao.updateUserByUserId(user);
	}

	/**
	 * 根据账号修改一个用户信息删除状态
	 */
	public int updateDeleteStateByUserId(User user) {
		return userLoginDao.updateDeleteStateByUserId(user);
	}

}