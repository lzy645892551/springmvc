package com.wanda.service;

import java.util.List;
import java.util.Map;

import com.wanda.bean.PayType;
public interface PayTypeService {

	public List<PayType> getList();

	 public void del(Map map);
	
	 public void add(PayType payType);
	 
	 public PayType selectByPrimaryKey(String payTypeId);
	 
	 public void updateByPrimaryKeySelective(PayType record);

	 public PayType selbyname(String payTypeName);
	 
	List<PayType> selectByOpenId(String openId);

	List<PayType> selectByList(Map<String, Object> map);

}
