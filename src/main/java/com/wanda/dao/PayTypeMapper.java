package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.PayType;
public interface PayTypeMapper {
    int deleteByPrimaryKey(String payTypeId);

    int insert(PayType record);

    int insertSelective(PayType record);

    PayType selectByPrimaryKey(String payTypeId);

    int updateByPrimaryKeySelective(PayType record);

    int updateByPrimaryKey(PayType record);
    
    List<PayType> getList();
    
    int del(Map map);

	PayType selbyname(String payTypeName);
	

	List<PayType> selectByOpenId(String openId);

	List<PayType> selectByList(Map<String, Object> map);
}