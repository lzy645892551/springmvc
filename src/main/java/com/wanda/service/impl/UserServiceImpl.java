package com.wanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wanda.bean.User;
import com.wanda.dao.UserDAO;
import com.wanda.dao.UserLoginDao;
import com.wanda.service.UserService;
 
 
 
@Service
public class UserServiceImpl implements UserService{
 
    @Autowired
    @Qualifier("userDAO")
    private UserDAO userDAO;
    
    @Autowired
    private UserLoginDao userdao;
     
    public int insertUser(User user) {
        // TODO Auto-generated method stub
        return userDAO.insertUser(user);
    }
    
    public int updateUser(User user) {
        // TODO Auto-generated method stub
        return userDAO.updateUser(user);
    }
    
    public int deleteUser(String name) {
        // TODO Auto-generated method stub
        return userDAO.deleteUser(name);
    }
    
    public List<User> selectUser(int pageSize,int pageIndex,String SearchSql){
        // TODO Auto-generated method stub
        return userDAO.selectUser(pageSize, pageIndex, SearchSql);
    }

    public List<User> selectUser(){
        return userdao.selectUser();
    }

	public List<User> getBus() {
		return userdao.getBus();
	}
    
    
 
}