package com.wanda.dao;

import java.util.List;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.User;
@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=false,isolation=Isolation.DEFAULT)
public interface UserLoginDao {
	/**
	 * 登录校验
	 * @param userId 账号
	 * @param password 密码
	 * @return
	 */
	public User loginCheck(String userId,String password);
	
	/**
	 * 查询所有用户的所有信息
	 * @return
	 */
	public List<User> getAllUser();
	
	/**
	 * 查询所有 未删除状态 用户的所有信息
	 * @return
	 */
	public List<User> getAllUserNoDelete();
	
	/**
	 * 添加一个用户信息
	 * @param user
	 * @return
	 */
	public int addUser(User user);
	
	/**
	 * 根据账号删除一个用户
	 * @param userId
	 * @return
	 */
	public int deleteUserByUserId(String userId);
	
	/**
	 * 根据账号查询一个用户信息
	 * @param userId
	 * @return
	 */
	public User selectUserByUserId(String userId);

	/**
	 * 根据账号修改一个用户信息
	 * @param user
	 * @return
	 */
	public int updateUserByUserId(User user);

	/**
	 * 根据账号修改一个用户删除状态的信息
	 * @param user
	 * @return
	 */
	public int updateDeleteStateByUserId(User user);
	
	List<User> selectUser();
	List<User> getBus();
}
