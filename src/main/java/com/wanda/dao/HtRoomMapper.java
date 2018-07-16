package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtRoom;

public interface HtRoomMapper {
    int deleteByPrimaryKey(String roomId);

    int insert(HtRoom record);

    int insertSelective(HtRoom record);

    HtRoom selectByPrimaryKey(String roomId);

    int updateByPrimaryKeySelective(HtRoom record);

    int updateByPrimaryKey(HtRoom record);
    
    List<HtRoom> getList(HtRoom record);

	void deleteIn(Map<String, Object> map);
	
	void insertBatch(Map<String, Object> map);
	
	List<HtRoom> getListt(String projectId);

	void openbatch(Map<String, Object> map);

	void addbatch(String projectId);

	void removeBatch(Map<String, Object> map);

	void removeAll(String projectId);

	void rollBackSix();

	void roomOpen(String openingReportId);
	
	
	
}