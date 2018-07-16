package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.PayType;
import com.wanda.dao.PayTypeMapper;
import com.wanda.service.PayTypeService;
 
 
 
@Service
public class PayTypeServiceImpl implements PayTypeService{
 
    @Autowired
    private PayTypeMapper payTypeMapper;
     
    public List<PayType> getList() {
        return payTypeMapper.getList();
    }
    
    public void del(Map map){
    	payTypeMapper.del(map);
    }
    
    public void add(PayType payType){
    	payTypeMapper.insertSelective(payType);
    }
    public PayType selectByPrimaryKey(String payTypeId){
		return payTypeMapper.selectByPrimaryKey(payTypeId);
    }
    public void updateByPrimaryKeySelective(PayType record){
    	payTypeMapper.updateByPrimaryKeySelective(record);
    }
    public PayType selbyname(String payTypeName){
    	return payTypeMapper.selbyname(payTypeName);
    }

    public List<PayType> selectByOpenId(String openId) {
		return payTypeMapper.selectByOpenId(openId);
	}

	public List<PayType> selectByList(Map<String, Object> map) {
		return payTypeMapper.selectByList(map);
	}
}