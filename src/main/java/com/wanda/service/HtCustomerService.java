package com.wanda.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.HtCustomer;

@Transactional
public interface HtCustomerService {

	List<HtCustomer> getList();

	
}
