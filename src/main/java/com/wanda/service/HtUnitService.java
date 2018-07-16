package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.HtProject;
import com.wanda.bean.HtUnit;

@Transactional
public interface HtUnitService {

	public List<HtUnit> getList();
	
	public List<HtProject> toAdd();
	
	public HtUnit selectByKey(String unitId);
	
	public void add(HtUnit unit);

	public void update(HtUnit unit);

	public void delete(String unitId);

	public void delbatch(Map<String, Object> map);

	public List<HtUnit> getListFromBuild(HtUnit unit);

}
