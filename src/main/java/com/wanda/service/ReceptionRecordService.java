package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.ReceptionRecord;

@Transactional
public interface ReceptionRecordService {

	List<ReceptionRecord> getList();

	void add(ReceptionRecord recept);

	void update(ReceptionRecord recept);

	ReceptionRecord selectById(String receptionRecordId);

	void delete(String receptionRecordId);

	void delbatch(Map<String, Object> map);

	
}
