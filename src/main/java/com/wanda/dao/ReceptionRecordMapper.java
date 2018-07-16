package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.ReceptionRecord;

public interface ReceptionRecordMapper {
    int deleteByPrimaryKey(String receptionRecordId);

    int insert(ReceptionRecord record);

    int insertSelective(ReceptionRecord record);

    ReceptionRecord selectByPrimaryKey(String receptionRecordId);

    int updateByPrimaryKeySelective(ReceptionRecord record);

    int updateByPrimaryKey(ReceptionRecord record);

	List<ReceptionRecord> getList();

	void delbatch(Map<String, Object> map);
}