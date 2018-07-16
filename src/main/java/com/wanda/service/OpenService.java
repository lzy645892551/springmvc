package com.wanda.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.OpeningReport;

@Transactional
public interface OpenService {

	List<OpeningReport> getList();

	void add(OpeningReport open);
	
	
	
}
