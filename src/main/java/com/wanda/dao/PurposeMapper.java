package com.wanda.dao;

import com.wanda.bean.Purpose;

public interface PurposeMapper {
    int deleteByPrimaryKey(String purposeId);

    int insert(Purpose record);

    int insertSelective(Purpose record);

    Purpose selectByPrimaryKey(String purposeId);

    int updateByPrimaryKeySelective(Purpose record);

    int updateByPrimaryKey(Purpose record);
}