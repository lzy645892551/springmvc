package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtProject;
import com.wanda.dao.HtProjectMapper;
import com.wanda.service.ProjectService;
 
 
 
@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	HtProjectMapper dao;
	public List<HtProject> selectProject(HtProject record) {
		return dao.selectProject(record);
	}
	
	public int deleteByPrimaryKey(String projectId) {
		return dao.deleteByPrimaryKey(projectId);
	}
	
	public int insert(HtProject record) {
		return dao.insert(record);
	}
	
	public int insertSelective(HtProject record) {
		return dao.insertSelective(record);
	}
	
	public HtProject selectByPrimaryKey(String projectId) {
		return dao.selectByPrimaryKey(projectId);
	}
	
	public int updateByPrimaryKeySelective(HtProject record) {
		return dao.updateByPrimaryKeySelective(record);
	}
	public int updateByPrimaryKey(HtProject record) {
		return dao.updateByPrimaryKey(record);
	}

	public int deleteIn(Map<String,Object> map) {
		return dao.deleteIn(map);
	}
    
}