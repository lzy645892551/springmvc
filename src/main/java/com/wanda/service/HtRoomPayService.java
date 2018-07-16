package com.wanda.service;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtRoom;
import com.wanda.bean.HtRoomPay;

public interface HtRoomPayService {
	public List<HtRoomPay> getList();
	public void insertSelective(HtRoomPay record);
	public void del(Map map);
	public void zuofei(Map map);
	public void gengmingshenqing(String id);
	public void huanfangshenqing(String id);
	public List<HtRoomPay> getLists();
	public void shenhe(String roomPayId);
	public void butongguo(String roomPayId);
	public void huanfang(HtRoomPay htRoomPay);
	public void gengming(HtRoomPay htRoomPay);
	public void uproomid(HtRoomPay record);
	public HtRoomPay byid(String roomPayId);
	public void tuikuan(Map map);
	
}
