package com.wanda.dao;

import java.util.List;

import com.wanda.bean.HtCustomer;

public interface HtCustomerMapper {
    int deleteByPrimaryKey(String customerId);

    int insert(HtCustomer record);

    int insertSelective(HtCustomer record);

    HtCustomer selectByPrimaryKey(String customerId);

    int updateByPrimaryKeySelective(HtCustomer record);

    int updateByPrimaryKey(HtCustomer record);
    
    List<HtCustomer> getList();
}