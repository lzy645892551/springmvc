package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.HtProject;
public interface ProjectService {
	int deleteByPrimaryKey(String projectId);

    int insert(HtProject record);

    int insertSelective(HtProject record);

    HtProject selectByPrimaryKey(String projectId);

    int updateByPrimaryKeySelective(HtProject record);

    int updateByPrimaryKey(HtProject record);
    
    List<HtProject> selectProject(HtProject record);

	int deleteIn(Map<String,Object> map);
	
	

}
