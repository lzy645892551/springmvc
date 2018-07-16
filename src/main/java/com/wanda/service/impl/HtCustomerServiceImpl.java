package com.wanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtCustomer;
import com.wanda.dao.HtCustomerMapper;
import com.wanda.service.HtCustomerService;

@Service
public class HtCustomerServiceImpl implements HtCustomerService{

	@Autowired
	HtCustomerMapper cusdao;
	
	public List<HtCustomer> getList() {
		return cusdao.getList();
	}

	
}
