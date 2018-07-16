package com.wanda.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanda.bean.HtRoom;
import com.wanda.dao.HtRoomMapper;
import com.wanda.service.HtRoomService;

@Service
public class HtRoomServiceImpl implements HtRoomService{

	@Autowired
	private HtRoomMapper roomdao;
	
	public List<HtRoom> getList(String projectId) {
		
		return roomdao.getListt(projectId);
	}

	public void openbatch(Map<String, Object> map) {

		roomdao.openbatch(map);
	}

	public void addbatch(String projectId) {
		roomdao.addbatch(projectId);
	}

	public void removeBatch(Map<String, Object> map) {
		roomdao.removeBatch(map);
	}

	public void removeAll(String projectId) {
		roomdao.removeAll(projectId);
	}

	public void rollBackSix() {
		roomdao.rollBackSix();
	}

	public void roomOpen(String openingReportId) {
		roomdao.roomOpen(openingReportId);
	}

}
