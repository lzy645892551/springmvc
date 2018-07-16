package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.ReceptionRecord;
import com.wanda.dao.ReceptionRecordMapper;
import com.wanda.service.ReceptionRecordService;

@Service
public class ReceptionRecordServiceImpl implements ReceptionRecordService{

	@Autowired
	ReceptionRecordMapper receptdao;
	
	public List<ReceptionRecord> getList() {
		return receptdao.getList();
	}

	public void add(ReceptionRecord recept) {
		receptdao.insertSelective(recept);
	}

	public void update(ReceptionRecord recept) {
		receptdao.updateByPrimaryKeySelective(recept);
	}

	public ReceptionRecord selectById(String receptionRecordId) {
		return receptdao.selectByPrimaryKey(receptionRecordId);
	}

	public void delete(String receptionRecordId) {
		receptdao.deleteByPrimaryKey(receptionRecordId);
	}

	public void delbatch(Map<String, Object> map) {
		receptdao.delbatch(map);
	}

	
}
