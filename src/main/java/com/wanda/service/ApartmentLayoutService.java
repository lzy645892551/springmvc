package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.ApartmentLayout;
@Transactional
public interface ApartmentLayoutService {
    int deleteByPrimaryKey(String apartmentLayoutId);

    int insert(ApartmentLayout record);

    int insertSelective(ApartmentLayout record);

    ApartmentLayout selectByPrimaryKey(String apartmentLayoutId);

    int updateByPrimaryKeySelective(ApartmentLayout record);

    int updateByPrimaryKey(ApartmentLayout record);

	List<ApartmentLayout> getList(ApartmentLayout record);

	void deleteIn(Map<String, Object> map);
}