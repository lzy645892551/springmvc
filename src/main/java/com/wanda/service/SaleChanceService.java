package com.wanda.service;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtBuild;
import com.wanda.bean.HtCustomer;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtRoomPay;
import com.wanda.bean.HtUnit;
import com.wanda.bean.SaleChance;
import com.wanda.bean.User;
public interface SaleChanceService {

	public List<SaleChance> getList();
	
	 public List<HtProject> getxiangmu();
	 
	 public List<HtBuild> getloudong(String projectId);
	 
	 public List<HtUnit> getunit(String buildId);
	 
	 public List<HtRoom> getroom(String unitId);
	 
	 public List<HtCustomer> getkehu();
	 
	 public HtCustomer gettel(String customerName);
	 
	 public User getname(String number);
	 
	 public void add(SaleChance payType);
	 
	 public SaleChance selectByPrimaryKey(String saleChanceId);
	 
	 public HtProject getxiangmuname(String projectId);
	 
	 public HtBuild getloudongbyid(String buildId);
	 
	 public HtUnit getdanyuanbyid(String unitId);
	 
	 public HtRoom getroombyid(String roomId);
	 
	 public void  updateByPrimaryKeySelective(SaleChance record);

	 public void del(Map map);
	 
	 public User getuserId(String name);
	 
	 public List<User> getuser();
//	
//	 public void add(PayType payType);
//	 
//	 public PayType selectByPrimaryKey(String payTypeId);
//	 

	public List<HtRoom> getrooma();

	public HtRoom getroomb(String roomCood);
}
