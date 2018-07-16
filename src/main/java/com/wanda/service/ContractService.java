package com.wanda.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.wanda.bean.Contract;

public interface ContractService {
	public List<Contract> getList();
	
	public List<Contract> getLista();
	
	public Contract getId(String orderId);
	
	public void insertSelective(Contract record);
	
	public Contract selectByPrimaryKey(String contractId);
	
	void del(Map map);
	
	void zuofei(Map map);
	
	void huifu(Map map);
	
	public void updateByPrimaryKeySelective(Contract record);

	public Contract getcId(Date signTime);
}
