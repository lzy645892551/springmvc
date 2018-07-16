package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtRoom;
import com.wanda.bean.HtRoomPay;
import com.wanda.dao.HtRoomPayMapper;
import com.wanda.service.HtRoomPayService;
@Service
public class HtRoomPayServiceImpl implements HtRoomPayService{
	@Autowired
	HtRoomPayMapper htRoomPayMapper;
	
	 public List<HtRoomPay> getList(){
		return htRoomPayMapper.getList();
	 }
	 public void insertSelective(HtRoomPay record){
		 htRoomPayMapper.insertSelective(record);
	 }
	 public void del(Map map){
		 htRoomPayMapper.del(map);
	 }
	 public void tuikuan(Map map){
		 htRoomPayMapper.tuikuan(map);
	 }
	 public void zuofei(Map map){
		 htRoomPayMapper.zuofei(map);
	 }
	 public void gengmingshenqing(String id){
		 htRoomPayMapper.gengmingshenqing(id);
	 }
	 public void gengming(HtRoomPay htRoomPay){
		 htRoomPayMapper.gengming(htRoomPay);
	 }
	 public void huanfangshenqing(String id){
		 htRoomPayMapper.huanfangshenqing(id);
	 }
	 public void huanfang(HtRoomPay htRoomPay){
		 htRoomPayMapper.huanfang(htRoomPay);
	 }
	 public List<HtRoomPay> getLists(){
		 return htRoomPayMapper.getLists();
	 }
	 public void shenhe(String roomPayId){
		 htRoomPayMapper.shenhe(roomPayId);
	 }
	 public void butongguo(String roomPayId){
		 htRoomPayMapper.butongguo(roomPayId);
	 }
	 public void uproomid(HtRoomPay record){
		 htRoomPayMapper.updateByPrimaryKeySelective(record);
	 }
	 public HtRoomPay byid(String roomPayId){
		 return  htRoomPayMapper.selectByPrimaryKey(roomPayId);
	 }
}
