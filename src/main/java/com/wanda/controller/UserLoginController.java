package com.wanda.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.Menu;
import com.wanda.bean.User;
import com.wanda.service.MenuService;
import com.wanda.service.UserLoginService;
 
@Controller
public class UserLoginController {
 
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 登录校验
	 * @param user
	 * @return
	 */
	@RequestMapping("/login.do")
	public String login(String userId,String password,HttpServletRequest request) {
		System.out.println("============");
		User loginUser = userLoginService.loginCheck(userId, password);
		
		if(loginUser != null){
			
			List<Menu> listMenu = menuService.selectMenuByRolId(loginUser.getRolId()+"");
			request.getSession().setAttribute("listMenu", listMenu);
			request.getSession().setAttribute("name", loginUser.getName());
			return "main";
		}else{
			return "redirect:index.jsp";
		}
		
	}
	
	/**
	 * 查询所有用户 未删除状态的
	 * @param request
	 * @return
	 */
	@RequestMapping("/listUserAll.do")
	public String listUserAll(HttpServletRequest request){
		//List<User> listUser = userLoginService.getAllUser();
		List<User> listUser = userLoginService.getAllUserNoDelete();
		request.getSession().setAttribute("listUser", listUser);
		return "userManager";
	}
	
	/**
	 * 跳转到添加用户信息页面
	 * @return
	 */
	@RequestMapping("/toAddUser.do")
	public String toAddUser(){
		return "addUser";
	}
	
	/**
	 * 添加用户时使用jqureyAjax校验
	 * @param userId
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/addUserCkeck.do")
    public void addUserCkeck(String userId,HttpServletRequest req, HttpServletResponse resp) throws IOException{
		System.out.println("=================");
		if(userId == null || userId.equals("")) {
			resp.getWriter().print("{\"错误提示\": \""+"账号不能为空！"+"\"}");
			//json 字符串拼接 很麻烦  工具类 第三方  jsonObject 
			//resp.getWriter().print("{\"aa\": \"hello "+name+"\",\"bb\": \""+pass+"\"}");
		}else{
			User user = userLoginService.selectUserByUserId(userId);
			if(user != null){
				resp.getWriter().print("{\"错误提示\": \""+"账号已存在！"+"\"}");
			}
			//resp.getWriter().print("{\"提示\": \""+"创建成功！"+"\"}");
		}
    }
	
	
	
	/**
	 * 添加用户
	 * @param name
	 * @param password
	 * @return
	 */
	@RequestMapping("/addUser.do")
    public String addUser(User user){
		if(user.getUserId() == null || user.getUserId().equals("")) {  
            return "redirect:toAddUser.do";
        }
		User userCheck = userLoginService.selectUserByUserId(user.getUserId());
		if(userCheck != null){
			return "redirect:toAddUser.do";
		}else{
			// 校验无错，返回成功页面  
			userLoginService.addUser(user);
	    	return "redirect:listUserAll.do"; 
		}
    }
	
	/**
	 * 根据userId删除用户
	 * @param userId 账号
	 * @return
	 */
	@RequestMapping("/deleteUser.do")
	public String deleteUser(String userId,HttpServletRequest request){
		/**
		 * 根据userId删除用户
		 */
		//userLoginService.deleteUserByUserId(userId);
		
		/**
		 * 根据userId 修改删除状态 而不是真正删除表
		 */
		User user = userLoginService.selectUserByUserId(userId);
		
		//获取系统当前时间
		Date currentTime = new Date();
		//因为数据库是Date类型   所以不用转换格式
		//设置格式化
		//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//格式化时间
		//String dateString = formatter.format(currentTime);
		
		String name = (String) request.getSession().getAttribute("name");
		
		user.setDeleteUser(name);
		user.setDeleteState("已删除");
		user.setDeleteTime(currentTime);
		userLoginService.updateDeleteStateByUserId(user);
		return "redirect:listUserAll.do";
	}
	
	/**
	 * 跳转到修改页面
	 * @param userId
	 * @param request
	 * @return
	 */
	@RequestMapping("/toUpdateUser.do")
	public String toupdateUser(String userId,HttpServletRequest request){
		User user = userLoginService.selectUserByUserId(userId);
		request.getSession().setAttribute("user", user);
		return "updateUser";
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping("/updateUser.do")
	public String updateUser(User user){
		userLoginService.updateUserByUserId(user);
		return "redirect:listUserAll.do";
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