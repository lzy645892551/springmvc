package com.wanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wanda.bean.Menu;
import com.wanda.dao.MenuMapper;
import com.wanda.service.MenuService;
 
 
 
@Service
public class MenuServiceImpl implements MenuService{
 
    @Autowired
    @Qualifier("menuMapper")
    private MenuMapper menuMapper;

	public List<Menu> selectMenuByRolId(String rolId) {
		return menuMapper.selectMenuByRolId(rolId);
	}
     

}