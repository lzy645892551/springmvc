package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtProject;

public interface HtProjectMapper {
    int deleteByPrimaryKey(String projectId);

    int insert(HtProject record);

    int insertSelective(HtProject record);

    HtProject selectByPrimaryKey(String projectId);

    int updateByPrimaryKeySelective(HtProject record);

    int updateByPrimaryKey(HtProject record);
    
    List<HtProject> selectProject(HtProject record);
    
    int deleteIn(Map<String,Object> map);
}