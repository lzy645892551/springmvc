package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtRoom;
import com.wanda.dao.HtRoomMapper;
import com.wanda.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService{
	@Autowired
	HtRoomMapper mapper;
	
	public int deleteByPrimaryKey(String roomId) {
		
		return mapper.deleteByPrimaryKey(roomId);
	}

	public int insert(HtRoom record) {
		
		return mapper.insert(record);
	}

	public int insertSelective(HtRoom record) {
		
		return mapper.insertSelective(record);
	}

	public HtRoom selectByPrimaryKey(String roomId) {
		
		return mapper.selectByPrimaryKey(roomId);
	}

	public int updateByPrimaryKeySelective(HtRoom record) {
		
		return mapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(HtRoom record) {
		
		return mapper.updateByPrimaryKey(record);
	}

	public List<HtRoom> getList(HtRoom record) {
		
		return mapper.getList(record);
	}

	public void deleteIn(Map<String, Object> map) {
		mapper.deleteIn(map);
	}

	public void insertBatch(Map<String, Object> map) {
		mapper.insertBatch(map);
	}

}
