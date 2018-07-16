package com.wanda.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.Organization;
import com.wanda.service.OrganizationsManagerService;
 
@Controller
public class OrganizationsController {
 
	@Autowired
	private OrganizationsManagerService organizationsManagerService;
	
	
	/**
	 * 查询所有组织 客户
	 * @param user
	 * @return
	 */
	@RequestMapping("/OrganizationsManager.do")
	public String OrganizationsManager(HttpServletRequest request) {
		List<Organization> listOrganization = organizationsManagerService.getAllOrganizationsManager();
		request.getSession().setAttribute("listOrganization", listOrganization);
		return "OrganizationsManager";
		
	}
	
	/**
	 * 跳转到添加组织信息页面
	 * @return
	 */
	@RequestMapping("/toAddOrganization.do")
	public String toAddOrganization(){
		return "addOrganization";
	}
	
	
	/**
	 * 添加组织
	 * @param user
	 * @return
	 */
	@RequestMapping("/addOrganization.do")
    public String addOrganization(Organization organization){
		
		UUID uuid = UUID.randomUUID();
		organization.setOrganizationId(uuid+"");
		
		organizationsManagerService.addOrganization(organization);
		return "redirect:OrganizationsManager.do";
    }
	
	
	/**
	 * 根据Id删除用户
	 * @param userId 账号
	 * @return
	 */
	@RequestMapping("/deleteOrganization.do")
	public String deleteOrganization(String organizationId,HttpServletRequest request){
		
		/**
		 * 根据Id 修改删除状态 而不是真正删除表
		 */
		Organization organization = organizationsManagerService.selectByOrganizationId(organizationId);
		
		//获取系统当前时间
		Date currentTime = new Date();
		
		String name = (String) request.getSession().getAttribute("name");
		
		organization.setDeleteUser(name);
		organization.setDeleteState("已删除");
		organization.setDeleteTime(currentTime);
		organizationsManagerService.updateDeleteStateByOrganization(organization);
		return "redirect:OrganizationsManager.do";
	}
	
	
	/**
	 * 跳转到修改页面
	 * @param organization
	 * @param request
	 * @return
	 */
	@RequestMapping("/toUpdateOrganization.do")
	public String toUpdateOrganization(String organizationId,HttpServletRequest request){
		Organization organization = organizationsManagerService.selectByOrganizationId(organizationId);
		request.getSession().setAttribute("organization", organization);
		return "updateOrganization";
	}
	
	/**
	 * 修改组织
	 * @param organization
	 * @return
	 */
	@RequestMapping("/updateOrganization.do")
	public String updateOrganization(Organization organization){
		organizationsManagerService.updateByOrganizationId(organization);
		return "redirect:OrganizationsManager.do";
	}
	
	
	
    /**
     * 封装日期格式
     * @param request
     * @param binder
     * @throws Exception
     */
    @InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class, 
			new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true));
	}

}