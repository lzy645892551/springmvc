package com.wanda.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.HtProject;
import com.wanda.bean.User;
import com.wanda.service.ProjectService;
import com.wanda.service.UserLoginService;
import com.wanda.service.UserService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	private ProjectService projectService;
	@Autowired 
	UserLoginService userService;


	@RequestMapping("projectManager.do")
	public String projectSellectAll(HttpServletRequest request,HtProject project){
		List<HtProject>proList = new ArrayList<HtProject>();
		Map<String,Object>map = new HashMap<String,Object>();
		proList = projectService.selectProject(project);
		request.setAttribute("proList",proList);
		List<User> userList = getList();
		request.setAttribute("userList", userList);
		request.setAttribute("proListSize", proList.size());
		return "projectManager";
	}
	
	@RequestMapping("/deleteProject.do")
	public String deleteProject(String projectId){
		Map<String,Object> map = new HashMap<String, Object>();
		String[] str = projectId.split(",");
		map.put("proMap", str);
		projectService.deleteIn(map);
		return "redirect:projectManager.do";
	}
	
	@RequestMapping("/deleteAll.do")
	public String deleteAll(){
		projectService.deleteByPrimaryKey("");
		return "redirect:projectManager.do";
	}
	
	public List<User> getList(){
		List<User>list = userService.getAllUser();
		System.out.println("他的长度"+list.size());
		return list;
	}
	
	@RequestMapping("projectReady.do")
	public String projectReady(Model model,String projectId){
		List<User>userList = getList();
		model.addAttribute("userList",userList);
		return "projectAdd";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/projectAdd.do")
	public String projectAdd(HtProject bean,HttpServletRequest request){
		System.out.println("来了");
		System.out.println("来来来"+bean.getProjectName()+"Time"+bean.getStartTime()+"Time"+bean.getEndTime());
		Date date = new Date();
		bean.setUpdateTime(date.toLocaleString());
		if(bean.getProjectId()!=null&&!"".equals(bean.getProjectId())){
			projectService.updateByPrimaryKey(bean);
		}else{
			projectService.insert(bean);
		}
		return "redirect:projectManager.do";
	}
	
	public HtProject selectOne(String projectId){
		HtProject project = projectService.selectByPrimaryKey(projectId);
		return project;
	}
	
	
	@RequestMapping("/projectUpdate.do")
	public String projectUpdate(String projectId,HttpServletRequest request){
		HtProject project = selectOne(projectId);
		 request.setAttribute("project", project);
		return "projectAdd";
	}
	
	
}
