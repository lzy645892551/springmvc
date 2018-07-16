package com.wanda.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.HtCustomer;
import com.wanda.bean.ReceptionRecord;
import com.wanda.bean.User;
import com.wanda.service.HtCustomerService;
import com.wanda.service.ReceptionRecordService;
import com.wanda.service.UserService;

@Controller
@RequestMapping("/recept")
public class ReceptionRecordController {

	@Autowired
	private ReceptionRecordService service;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private HtCustomerService cusservice;
	
	@RequestMapping("list.do")
	public String getList(Model model) {
		List<ReceptionRecord> list = service.getList();
		model.addAttribute("list", list);
		for (ReceptionRecord htUnit : list) {
			System.out.println(htUnit);
		}
		
		return "recept/list";
	}
	
	@RequestMapping("toadd.do")
	public String toAdd(Model model) {
		List<HtCustomer> cusList = cusservice.getList();
		List<User> userList = userservice.getBus();
		
		model.addAttribute("cusList", cusList);
		model.addAttribute("userList", userList);
		System.out.println(cusList);
		
		return "recept/add";
	}
	
	@RequestMapping("addorupdate.do")
	public String add(ReceptionRecord recept) {
		if(recept.getReceptionRecordId() == null || recept.getReceptionRecordId().equals("")) { 
			System.out.println("--"+recept);
			Calendar cal = Calendar.getInstance();
			Date date = cal.getTime();
			recept.setReceptionTime(date);
			service.add(recept);
		} else {
			Calendar cal = Calendar.getInstance();
//			Date date = cal.getTime();
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date date = new Date();
			
			String time = df.format(date);
			System.out.println("----------"+time);
			
			Timestamp goodsC_date =Timestamp.valueOf(time);
			System.out.println("goodsC_date---" + goodsC_date);
			recept.setUpdateTime(goodsC_date);
			
			service.update(recept);
		}
		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("toupdate")
	public String toUpdate(String receptionRecordId, Model model) {
		
		ReceptionRecord recept = service.selectById(receptionRecordId);
		
		model.addAttribute("recept", recept);
		List<HtCustomer> cusList = cusservice.getList();
		List<User> userList = userservice.getBus();
		
		model.addAttribute("cusList", cusList);
		model.addAttribute("userList", userList);
		
		return "recept/add";
	}
	
	@RequestMapping("del.do")
	public String del(String receptionRecordId) {
		service.delete(receptionRecordId);
		return "redirect:../recept/list.do";
	}
	
	@RequestMapping("/delbatch.do")
	public String delbatch(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		service.delbatch(map);

		return "redirect:../recept/list.do";
	}
}















