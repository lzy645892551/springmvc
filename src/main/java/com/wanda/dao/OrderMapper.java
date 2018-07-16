package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtRoom;
import com.wanda.bean.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> getList();
    
    List<Order> getList1();
    
    List<HtRoom> getFangjian();
    
    HtRoom selArea(String roomId);
    
    int huifu(Map map);
    
    int zuofei(Map map);
    
    int qianyue(Map map);
    
    int dele(Map map);
    
    public Order getOrderId(String customerName);
}