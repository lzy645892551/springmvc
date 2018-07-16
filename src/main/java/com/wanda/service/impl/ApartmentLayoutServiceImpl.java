package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.ApartmentLayout;
import com.wanda.dao.ApartmentLayoutMapper;
import com.wanda.service.ApartmentLayoutService;
@Service
public class ApartmentLayoutServiceImpl implements ApartmentLayoutService {
	@Autowired
	ApartmentLayoutMapper mapper;
	
	
	public int deleteByPrimaryKey(String apartmentLayoutId) {
		
		return mapper.deleteByPrimaryKey(apartmentLayoutId);
	}

	public int insert(ApartmentLayout record) {
		
		return mapper.insert(record);
	}

	public int insertSelective(ApartmentLayout record) {
		
		return mapper.insertSelective(record);
	}

	public ApartmentLayout selectByPrimaryKey(String apartmentLayoutId) {
		
		return mapper.selectByPrimaryKey(apartmentLayoutId);
	}

	public int updateByPrimaryKeySelective(ApartmentLayout record) {
		
		return mapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(ApartmentLayout record) {
		
		return mapper.updateByPrimaryKey(record);
	}

	public List<ApartmentLayout> getList(ApartmentLayout record) {
		
		return mapper.getList(record);
	}

	public void deleteIn(Map<String, Object> map) {
		 mapper.deleteIn(map);
	}

}
