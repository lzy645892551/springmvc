package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.HtBuild;
@Transactional
public interface BuildingService {
	int deleteByPrimaryKey(String buildId);

    int insert(HtBuild record);

    int insertSelective(HtBuild record);

    HtBuild selectByPrimaryKey(String buildId);

    int updateByPrimaryKeySelective(HtBuild record);

    int updateByPrimaryKey(HtBuild record);
    
    List<HtBuild> getList(HtBuild build);

	void deleteIn(Map<String, Object> map);

	void insertBatch(Map<String, List<HtBuild>> map);
	
	String SELECT_UUID();
	
	List<HtBuild> selectByProId(String projectId);

    HtBuild findUnitCount(String buildId);
    
//    List<HtBuild> getList(Map<String,Object> map);
    

    
}
