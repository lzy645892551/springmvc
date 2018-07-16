package com.wanda.dao;

import com.wanda.bean.ChangeType;

public interface ChangeTypeMapper {
    int deleteByPrimaryKey(String changeId);

    int insert(ChangeType record);

    int insertSelective(ChangeType record);

    ChangeType selectByPrimaryKey(String changeId);

    int updateByPrimaryKeySelective(ChangeType record);

    int updateByPrimaryKey(ChangeType record);
}