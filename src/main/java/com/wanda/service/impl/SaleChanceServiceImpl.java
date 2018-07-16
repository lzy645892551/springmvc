package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtBuild;
import com.wanda.bean.HtCustomer;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtUnit;
import com.wanda.bean.SaleChance;
import com.wanda.bean.User;
import com.wanda.dao.SaleChanceMapper;
import com.wanda.service.SaleChanceService;
 
 
 
@Service
public class SaleChanceServiceImpl implements SaleChanceService{
 
    @Autowired
    private SaleChanceMapper SaleChanceMapper;
     
    public List<SaleChance> getList() {
        return SaleChanceMapper.getList();
    }
    public List<User> getuser() {
    	return SaleChanceMapper.getuser();
    }
    public List<HtProject> getxiangmu(){
		return SaleChanceMapper.getxiangmu();
    }
    public List<HtCustomer> getkehu(){
    	return SaleChanceMapper.getkehu();
    }
    public List<HtBuild> getloudong(String projectId){
    	return SaleChanceMapper.getloudong(projectId);
    }
    public List<HtUnit> getunit(String buildId){
    	return SaleChanceMapper.getunit(buildId);
    }
    public List<HtRoom> getroom(String unitId){
    	return SaleChanceMapper.getroom(unitId);
    }
    public HtCustomer gettel(String customerName){
    	return SaleChanceMapper.gettel(customerName);
    }
    public User getname(String number){
    	return SaleChanceMapper.getname(number);
    }
    public User getuserId(String name){
    	return SaleChanceMapper.getuserId(name);
    }
    public HtProject getxiangmuname(String projectId){
    	return SaleChanceMapper.getxiangmuname(projectId);
    }
    public HtBuild getloudongbyid(String buildId){
    	return SaleChanceMapper.getloudongbyid(buildId);
    }
    public HtUnit getdanyuanbyid(String unitId){
    	return SaleChanceMapper.getdanyuanbyid(unitId);
    }
    public HtRoom getroombyid(String roomId){
    	return SaleChanceMapper.getroombyid(roomId);
    }
    public void del(Map map){
    	SaleChanceMapper.del(map);
    }
    public void add(SaleChance payType){
    	SaleChanceMapper.insertSelective(payType);
    }
    public SaleChance selectByPrimaryKey(String saleChanceId){
		return SaleChanceMapper.selectByPrimaryKey(saleChanceId);
    }
    public void  updateByPrimaryKeySelective(SaleChance record){
    	SaleChanceMapper.updateByPrimaryKeySelective(record);
    }
    public List<HtRoom> getrooma(){
    	return SaleChanceMapper.getrooma();
    }
    public HtRoom getroomb(String roomCode){
    	return SaleChanceMapper.getroomb(roomCode);
    }
}