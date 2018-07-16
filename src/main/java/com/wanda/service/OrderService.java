package com.wanda.service;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtRoom;
import com.wanda.bean.Order;

public interface OrderService {
	
	List<Order> getList();
	
	List<Order> getList1();
	
	List<HtRoom> getFangjian();
	
	HtRoom selArea(String roomId);
	
	public void insertSelective(Order record);
	
	public void  deleteByPrimaryKey(String orderId);
	
	public Order selectByPrimaryKey(String orderId);

	public void updateByPrimaryKeySelective(Order record);
	
	public void huifu(Map map);
	
	public void zuofei(Map map);
	
	public void qianyue(Map map);
	
	public void dele(Map map);

	public Order getOrderId(String customerName);
}
