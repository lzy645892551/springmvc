package com.wanda.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.Contract;
import com.wanda.dao.ContractMapper;
import com.wanda.service.ContractService;
@Service
public class ContractServiceImpl implements ContractService{
   @Autowired
   private ContractMapper contractMapper;
   
   public List<Contract> getList(){
	   return contractMapper.getList();
   }
   public List<Contract> getLista(){
	   return contractMapper.getLista();
   }
   public Contract getId(String orderId){
	   return contractMapper.getId(orderId);
   }
   
   public void insertSelective(Contract record){
	   contractMapper.insertSelective(record);
   }
   
   public Contract selectByPrimaryKey(String contractId){
	   return contractMapper.selectByPrimaryKey(contractId);
   }
   public void del(Map map){
	   contractMapper.del(map);
   }
   public void zuofei(Map map){
	   contractMapper.zuofei(map);
   }
   
   public void huifu(Map map){
	   contractMapper.huifu(map);
   }
   
   public void updateByPrimaryKeySelective(Contract record){
	   contractMapper.updateByPrimaryKeySelective(record);
   }
   public Contract getcId(Date signTime){
	   return contractMapper.getcId(signTime);
   }
}
