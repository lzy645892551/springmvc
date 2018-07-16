package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.OpeningPay;
import com.wanda.dao.OpeningPayMapper;
import com.wanda.service.OpeningPayService;

@Service
public class OpeningPayServiceImpl implements OpeningPayService{

	@Autowired
	private OpeningPayMapper openpaydao;

	public List<OpeningPay> selectByOpenId(String openingReportId) {
		return openpaydao.selectByOpenId(openingReportId);
	}

	public void addPay(Map<String, Object> map) {
		openpaydao.addPay(map);
	}

	public void delPay(Map<String, Object> map) {
		openpaydao.delPay(map);
	}

	public List<OpeningPay> selectByList(Map<String, Object> map) {
		return openpaydao.selectByList(map);
	}
}
