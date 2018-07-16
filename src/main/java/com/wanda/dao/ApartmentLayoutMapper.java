package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.ApartmentLayout;

public interface ApartmentLayoutMapper {
    int deleteByPrimaryKey(String apartmentLayoutId);

    int insert(ApartmentLayout record);

    int insertSelective(ApartmentLayout record);

    ApartmentLayout selectByPrimaryKey(String apartmentLayoutId);

    int updateByPrimaryKeySelective(ApartmentLayout record);

    int updateByPrimaryKey(ApartmentLayout record);

	List<ApartmentLayout> getList(ApartmentLayout record);

	void deleteIn(Map<String, Object> map);
}