package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtBuild;

public interface HtBuildMapper {
    int deleteByPrimaryKey(String buildId);

    int insert(HtBuild record);

    int insertSelective(HtBuild record);

    HtBuild selectByPrimaryKey(String buildId);

    int updateByPrimaryKeySelective(HtBuild record);

    int updateByPrimaryKey(HtBuild record);
    
    List<HtBuild> getList(HtBuild build);

	void deleteIn(Map<String, Object> map);

	void insertBatch(Map<String, List<HtBuild>> map);

	String selectUUid();


	List<HtBuild> selectByProId(String projectId);
	
//	List<HtBuild> getList(Map<String,Object> map);
}