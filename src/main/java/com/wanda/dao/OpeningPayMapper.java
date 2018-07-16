package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.OpeningPay;

public interface OpeningPayMapper {
    int deleteByPrimaryKey(String openingPayId);

    int insert(OpeningPay record);

    int insertSelective(OpeningPay record);

    OpeningPay selectByPrimaryKey(String openingPayId);

    int updateByPrimaryKeySelective(OpeningPay record);

    int updateByPrimaryKey(OpeningPay record);
    
    List<OpeningPay> selectByOpenId(String openingReportId);

	void addPay(Map<String, Object> map);

	void delPay(Map<String, Object> map);

	List<OpeningPay> selectByList(Map<String, Object> map);
}