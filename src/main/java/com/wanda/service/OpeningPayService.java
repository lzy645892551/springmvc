package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.OpeningPay;

@Transactional
public interface OpeningPayService {

	List<OpeningPay> selectByOpenId(String openingReportId);

	void addPay(Map<String, Object> map);

	void delPay(Map<String, Object> map);

	List<OpeningPay> selectByList(Map<String, Object> map);

	
}
