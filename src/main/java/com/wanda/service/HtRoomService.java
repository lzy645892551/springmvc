package com.wanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.wanda.bean.HtRoom;

@Transactional
public interface HtRoomService {

	List<HtRoom> getList(String projectId);

	void openbatch(Map<String, Object> map);

	void addbatch(String projectId);

	void removeBatch(Map<String, Object> map);

	void removeAll(String projectId);

	void rollBackSix();

	void roomOpen(String openingReportId);
}
