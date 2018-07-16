package com.wanda.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.HtBuild;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtUnit;
import com.wanda.service.BuildingService;
import com.wanda.service.HtUnitService;
import com.wanda.util.ExportJett;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/unitmanager")
public class HtUnitController {

	@Autowired
	private HtUnitService service;
	
	@Autowired
	private BuildingService buiservice;
	
	@RequestMapping("/list.do")
	public String getList(Model model) {
		List<HtUnit> list = service.getList();
		model.addAttribute("list", list);
		for (HtUnit htUnit : list) {
			System.out.println(htUnit);
		}
		return "unitmanage/manageunit";
	}
	
	@RequestMapping("/toadd.do")
	public String toAdd(Model model) {
		model.addAttribute("prolist", service.toAdd());
		return "unitmanage/add";
	}
	
	@RequestMapping("/addorupdate.do")
	public String add(HtUnit unit) {
		System.out.println("____________" + unit.getProject());
		System.out.println(unit);
		if(unit.getUnitId() == null || unit.getUnitId().equals("")) { 
			Calendar cal = Calendar.getInstance();
			Date date = cal.getTime();
			unit.setUpdateTime(date);
			service.add(unit);
		}
		else {
			Calendar cal = Calendar.getInstance();
//			Date date = cal.getTime();
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date date = new Date();
			
			String time = df.format(date);
			System.out.println("----------"+time);
			
			Timestamp goodsC_date =Timestamp.valueOf(time);
			System.out.println("goodsC_date---" + goodsC_date);
			unit.setUpdateTime(goodsC_date);
			
			service.update(unit);
		}
		
		return "redirect:../unitmanager/list.do";
	}
	
	@RequestMapping("/findbuild.do")
	public void findBuild(String projectId, HttpServletResponse res) {
		System.out.println(projectId);
		List<HtBuild> list = buiservice.selectByProId(projectId);
		
		System.out.println("list内容：");
		for (HtBuild build : list) {
			System.out.println(build);
		}
		JSONArray jsonArray = JSONArray.fromObject( list );
		System.out.println("json");
		for (Object object : jsonArray) {
			System.out.println(object);
		}
		try {
			res.getWriter().print(jsonArray);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/toupdate.do")
	public String toUpdate(String unitId, Model model) {
		HtUnit unit = service.selectByKey(unitId);
		System.out.println("unit : ---" + unit);
		
		List<HtBuild> builist = buiservice.selectByProId(unit.getBuild().getProject().getProjectId());
		System.out.println("unit.getBuild().getProject().getProjectId()===" + unit.getBuild().getProject().getProjectId());
		System.out.println("builist.size" + builist.size());
		
		List<HtProject> prolist = service.toAdd();
		System.out.println("prolist--------" + prolist.size());
		
		model.addAttribute("unit", unit);
		model.addAttribute("builist", builist);
		model.addAttribute("prolist", prolist);
		
		return "unitmanage/add";
	}
	
	@RequestMapping("/delete.do")
	public String delete(String unitId) {
		service.delete(unitId);
		return "redirect:../unitmanager/list.do";
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

		return "redirect:../unitmanager/list.do";
	}
	
	@RequestMapping("/findunitcount.do")
	public void findUnitCount(String buildId, HttpServletResponse res) {
		System.out.println("buildId____:"+buildId);
		
		HtBuild build = buiservice.findUnitCount(buildId);
		
		
		try {
			res.getWriter().print(build.getRoomCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/pageExport.do")
	public void pageExport(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		request.setCharacterEncoding("UTF-8");
		Object str = request.getParameter("list");
		JSONArray jsonArray =JSONArray.fromObject(str);
		JSONObject jsonOne;  
		List<HtUnit> list = new ArrayList<HtUnit>();
		for(int i=0;i<jsonArray.size();i++){  
		         jsonOne = jsonArray.getJSONObject(i);  
		         HtUnit unit = new HtUnit();
		         
		         String unitId = (String) jsonOne.get("unitId");
		         String projectName = (String) jsonOne.get("projectName");
		         String buildName = (String) jsonOne.get("buildName");
		         String unitCode = (String) jsonOne.get("unitCode");
		         String roomCount = (String) jsonOne.get("roomCount");
		         String updateUser = (String) jsonOne.get("updateUser");
		         String updateTime = (String) jsonOne.get("updateTime");
		         
		         HtProject project = new HtProject();
		         unit.setProject(project);
		         HtBuild build = new HtBuild();
		         unit.setBuild(build);
		         
		         unit.setUnitId(unitId);
		         unit.getProject().setProjectName(projectName);
		         unit.getBuild().setBuildName(buildName);
		         unit.setUnitCode(unitCode);
		         unit.setRoomCount(roomCount);
		         unit.setUpdateUser(updateUser);
		         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		         Date time = sdf.parse(updateTime);
		         unit.setUpdateTime(time);
		         list.add(unit);
		} 

		response.setHeader("Content-Disposition","attachment;filename=exportdata.xls");//指定下载的文件名  
		response.setContentType("application/vnd.ms -excel");
		ExportJett  ex = new ExportJett();
		ex.buildStudentExcel(list, "exportdata.xls",response.getOutputStream());

	}
}


















