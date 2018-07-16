package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtBuild;
import com.wanda.bean.HtCustomer;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtUnit;
import com.wanda.bean.SaleChance;
import com.wanda.bean.User;

public interface SaleChanceMapper {
    int deleteByPrimaryKey(String saleChanceId);

    int insert(SaleChance record);

    int insertSelective(SaleChance record);

    SaleChance selectByPrimaryKey(String saleChanceId);

    int updateByPrimaryKeySelective(SaleChance record);

    int updateByPrimaryKey(SaleChance record);
    
    List<SaleChance> getList();
    
    public List<User> getuser();
    
    List<HtProject> getxiangmu();
    
    List<HtBuild> getloudong(String projectId);
    
    List<HtUnit> getunit(String buildId);
    
    List<HtRoom> getroom(String unitId);
    
    List<HtRoom> getrooma();
    
    HtRoom getroomb(String roomCode);
    
    List<HtCustomer> getkehu();
    
    HtCustomer gettel(String customerName);
    
    User getname(String number);
    
    User getuserId(String name);
    
    HtProject getxiangmuname(String projectId);
    
    HtBuild getloudongbyid(String buildId);
    
    HtUnit getdanyuanbyid(String unitId);
    
    HtRoom getroombyid(String roomId);
    
    int del(Map map);
}