package com.wanda.bean;

import java.util.List;
import java.util.Map;

public class JsonModel {
	private String page; // ҳ��
	private String total; // ��������
	private String records; //��ǰҳ����
	private  List<User>  rows; // ���ص�����
	
	public JsonModel() {
		super();
	}

	public String getPage() {
		return page;
	}
	
	public void setPage(String page) {
		this.page = page;
	}
		
	public String getTotal() {
		return total;
	}
	
	public void setTotal(String total) {
		this.total = total;
	}
	
	public String getRecords() {
		return records;
	}
	
	public void setRecords(String records) {
		this.records = records;
	}
	
	public List<User> getRows() {
		return rows;
	}
	
	public void setRows(List<User> rows) {
		this.rows = rows;
	}
	

	/*public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}*/

}
