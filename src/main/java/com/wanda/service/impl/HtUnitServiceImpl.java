package com.wanda.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtProject;
import com.wanda.bean.HtUnit;
import com.wanda.dao.HtBuildMapper;
import com.wanda.dao.HtProjectMapper;
import com.wanda.dao.HtUnitMapper;
import com.wanda.service.HtUnitService;

@Service
public class HtUnitServiceImpl implements HtUnitService{

	@Autowired
	private HtUnitMapper unitdao;
	
	@Autowired
	private HtProjectMapper prodao;
	
	@Autowired
	private HtBuildMapper buidao;
	
	public List<HtUnit> getList() {
		return unitdao.selectManyToOne();
	}

	public List<HtProject> toAdd() {
		
		//调用项目和楼栋的dao获取列表，然后添加进map
		List<HtProject> project = prodao.selectProject(null);
		return project;
	}

	public HtUnit selectByKey(String unitId) {
		HtUnit unit = unitdao.selectByKey(unitId);
		return unit;
	}

	public void add(HtUnit unit) {
		unitdao.insertSelective(unit);
	}

	public void update(HtUnit unit) {
		unitdao.updateByPrimaryKeySelective(unit);
	}

	public void delete(String unitId) {
		unitdao.deleteByPrimaryKey(unitId);
	}

	public void delbatch(Map<String, Object> map) {
		unitdao.delbatch(map);
	}

	public List<HtUnit> getListFromBuild(HtUnit unit) {
		// TODO 自动生成的方法存根
		return unitdao.getListFromBuild(unit);
	}

	

}












