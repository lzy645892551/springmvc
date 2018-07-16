package com.wanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.OpeningReport;
import com.wanda.dao.OpeningReportMapper;
import com.wanda.service.OpenService;

@Service
public class OpenServiceImpl implements OpenService{

	@Autowired
	private OpeningReportMapper opendao;
	
	
	
	public List<OpeningReport> getList() {
		
		return opendao.selectManyToOne();
	}



	public void add(OpeningReport open) {
		opendao.insertSelective(open);
	}
	
}
