package com.wanda.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.User;
@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=false,isolation=Isolation.DEFAULT)
public interface UserDAO {
	public int insertUser(User user);
	public int updateUser(User user);
	public int deleteUser(String name);

	public List<User> selectUser(@Param("pageSize") int pageSize,@Param("pageIndex") int pageIndex,@Param("SearchSql") String SearchSql);
}
