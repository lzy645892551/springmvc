package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtBuild;
import com.wanda.dao.HtBuildMapper;
import com.wanda.service.BuildingService;
@Service
public class BuildingServiceImpl implements BuildingService{
	@Autowired
	HtBuildMapper mapper;
	
	public int deleteByPrimaryKey(String buildId) {
		
		return mapper.deleteByPrimaryKey(buildId);
	}

	public int insert(HtBuild record) {
		
		return mapper.insert(record);
	}

	public int insertSelective(HtBuild record) {
		
		return mapper.insertSelective(record);
	}

	public HtBuild selectByPrimaryKey(String buildId) {
		
		return mapper.selectByPrimaryKey(buildId);
	}

	public int updateByPrimaryKeySelective(HtBuild record) {
		
		return mapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(HtBuild record) {
		
		return mapper.updateByPrimaryKey(record);
	}

	public List<HtBuild> getList(HtBuild build) {
		List<HtBuild> list = mapper.getList(build);
		return list;
	}

	public void deleteIn(Map<String, Object> map) {
		mapper.deleteIn(map);
	}

	public void insertBatch(Map<String, List<HtBuild>> map) {
		mapper.insertBatch(map);
	}

	public String SELECT_UUID(){
		return mapper.selectUUid();
	}

	public List<HtBuild> selectByProId(String projectId) {
		
		return mapper.selectByProId(projectId);
	}

	public HtBuild findUnitCount(String buildId) {
		
		return mapper.selectByPrimaryKey(buildId);
	}

//	public List<HtBuild> getList(Map<String, Object> map) {
//		List<HtBuild> list = mapper.getListt(map);
//		return list;
//	}
}
