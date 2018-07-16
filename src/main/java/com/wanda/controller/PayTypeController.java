package com.wanda.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.PayType;
import com.wanda.service.PayTypeService;

@Controller
@RequestMapping("/fukuan")
public class PayTypeController {
	@Autowired
	PayTypeService payTypeService;

	@RequestMapping("/list.do")
	public String list(Model model) {
		List<PayType> list = payTypeService.getList();
		model.addAttribute("list", list);
		return "PayType";
	}
	@RequestMapping("/del.do")
	public String del(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		payTypeService.del(map);
		return "redirect:list.do";
	}
	@RequestMapping("/add.do")
	public String add(PayType payType){
		payTypeService.add(payType);
		return "redirect:list.do";
	}
	@RequestMapping("/selbyid.do")
	public String selbyid(String Id,Model model){
		model.addAttribute("payType", payTypeService.selectByPrimaryKey(Id));
		return "upfukuan";
	}
	@RequestMapping("/update.do")
	public String update(PayType payType,Model model){
		payTypeService.updateByPrimaryKeySelective(payType);
		return "redirect:list.do";
	}

}