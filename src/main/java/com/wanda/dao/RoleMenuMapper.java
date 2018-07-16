package com.wanda.dao;

import com.wanda.bean.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(String roleMenuId);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(String roleMenuId);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);
}