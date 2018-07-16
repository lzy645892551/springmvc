package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtUnit;

public interface HtUnitMapper {
    int deleteByPrimaryKey(String unitId);

    int insert(HtUnit record);

    int insertSelective(HtUnit record);

    HtUnit selectByPrimaryKey(String unitId);

    int updateByPrimaryKeySelective(HtUnit record);

    int updateByPrimaryKey(HtUnit record);
    
    List<HtUnit> selectManyToOne();
    
    HtUnit selectByKey(String unitId);
    
    void delbatch(Map<String, Object> map);
    
    public List<HtUnit> getListFromBuild(HtUnit unit);
}