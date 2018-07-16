package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtRoom;
import com.wanda.bean.Order;
import com.wanda.dao.OrderMapper;
import com.wanda.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    @Qualifier("orderMapper")
    private OrderMapper orderMapper;
    
    public List<Order> getList(){
        return orderMapper.getList();
    }
    public List<Order> getList1(){
    	return orderMapper.getList1();
    }
    public List<HtRoom> getFangjian(){
    	return orderMapper.getFangjian();
    }
    public HtRoom selArea(String roomId){
    	return orderMapper.selArea(roomId);
    }
    public void insertSelective(Order record){
    	orderMapper.insertSelective(record);
    }
    public void  deleteByPrimaryKey(String orderId){
    	orderMapper.deleteByPrimaryKey(orderId);
    }
    public Order selectByPrimaryKey(String orderId){
		return orderMapper.selectByPrimaryKey(orderId);
    	
    }
    public void updateByPrimaryKeySelective(Order record){
    	orderMapper.updateByPrimaryKey(record);
    }
    public void huifu(Map map){
    	orderMapper.huifu(map);
    }
    public void zuofei(Map map){
    	orderMapper.zuofei(map);
    }
    public void qianyue(Map map){
    	orderMapper.qianyue(map);
    }
    public void dele(Map map){
    	orderMapper.dele(map);
    }
    public Order getOrderId(String customerName){
    	return orderMapper.getOrderId(customerName);
    }
 
}