package com.wanda.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.ApartmentLayout;
import com.wanda.service.ApartmentLayoutService;

@Controller
@RequestMapping("/layout")
public class ApartmentLayoutController {
	@Autowired
	ApartmentLayoutService layoutService;
	@RequestMapping("/layoutManager.do")
	public String layoutManager(Model model,ApartmentLayout layout){
		List<ApartmentLayout> layoutList = layoutService.getList(layout);
		model.addAttribute("layoutList",layoutList);
		return "layoutManager";
	}
	
	@RequestMapping("/layoutReady.do")
	public String layoutReady(HttpServletRequest request,ApartmentLayout layout){
		 layout = layoutService.selectByPrimaryKey(layout.getApartmentLayoutId());
		 request.setAttribute("layout", layout);
		return "layoutAdd";
	}
	
	@RequestMapping("layoutDelete.do")
	public String layoutDelete(String apartmentLayoutId){
		String[] str = apartmentLayoutId.split(",");
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("layoutMap", str);
		layoutService.deleteIn(map);
		return "redirect:layoutManager.do";
	}
	
	@RequestMapping("layoutDeleteAll.do")
	public String layoutDeleteAll(){
		layoutService.deleteByPrimaryKey(null);
		return "redirect:layoutManager.do";
	}
	
	@RequestMapping("layoutAddOrUpdate.do")
	public String layoutAddOrUpdate(ApartmentLayout layout){
		Date date = new Date();
		layout.setUpdateTime(date.toLocaleString());
		if(layout.getApartmentLayoutId()!=null&&layout.getApartmentLayoutId().trim().length()>0)
			layoutService.updateByPrimaryKey(layout);
		else{
			layoutService.insert(layout);
		}
		return "redirect:layoutManager.do";
	}
}
