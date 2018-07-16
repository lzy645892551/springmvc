package com.wanda.dao;

import java.util.List;

import com.wanda.bean.OpeningReport;

public interface OpeningReportMapper {
    int deleteByPrimaryKey(String openingReportId);

    int insert(OpeningReport record);

    int insertSelective(OpeningReport record);

    OpeningReport selectByPrimaryKey(String openingReportId);

    int updateByPrimaryKeySelective(OpeningReport record);

    int updateByPrimaryKeyWithBLOBs(OpeningReport record);

    int updateByPrimaryKey(OpeningReport record);
    
    List<OpeningReport> getList();

	List<OpeningReport> selectOneToMany();

	List<OpeningReport> selectManyToOne();
}