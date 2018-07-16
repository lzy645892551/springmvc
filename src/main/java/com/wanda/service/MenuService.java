package com.wanda.service;

import java.util.List;

import com.wanda.bean.Menu;

public interface MenuService {

	/**
	 * 根据角色id查询菜单权限
	 * @return
	 */
	List<Menu> selectMenuByRolId(String rolId);
	
}
