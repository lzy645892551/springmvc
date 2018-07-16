package com.wanda.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wanda.bean.JsonModel;
import com.wanda.bean.User;
import com.wanda.service.UserService;
import com.wanda.util.EscapeUnescape;
 
@Controller
public class UserController {
 
	@Autowired
	private UserService userService;
	
    @RequestMapping(value="demo.do")
    public String index(){
        return "index";
    }
    @RequestMapping(value="index")
    public ModelAndView index(User user){
    	userService.insertUser(user);
    	ModelAndView mav=new ModelAndView();
    	mav.setViewName("index");
    	mav.addObject("user",user);
    	return mav;
    }
    
    @RequestMapping(value="addd.do")
    public @ResponseBody Map<String,Object> add(String name,String password){
    	User user =new User();
    	user.setName(name);
    	user.setPassword(password);
    	userService.insertUser(user);
    	//ModelAndView mav=new ModelAndView();
        //mav.setViewName("index");
        //mav.addObject("user",user);
    	//return mav;
    	Map<String,Object> map = new HashMap<String,Object>();  
    	 System.out.println("�ɹ�");  
    	 map.put("msg", name+"|"+password);  
    	return map;

    }
    
    @RequestMapping(value="update.do")
    public @ResponseBody Map<String,Object> update(String name,String password){
    	User user =new User();
    	user.setName(EscapeUnescape.unescape(name));
    	user.setPassword(password);
    	userService.updateUser(user);
    	//ModelAndView mav=new ModelAndView();
        //mav.setViewName("index");
        //mav.addObject("user",user);
    	//return mav;
    	Map<String,Object> map = new HashMap<String,Object>();  
   	 System.out.println("�ɹ�");  
   	 map.put("msg", name+"|"+password);  
    	return map;
    }
    
    @RequestMapping(value="delete.do")
    public @ResponseBody Map<String,Object> update(String name){
    	userService.deleteUser(name);
    	Map<String,Object> map = new HashMap<String,Object>();  
   	 System.out.println("�ɹ�");  
   	 map.put("msg", name);  
    	return map;
    }
    
    
    @RequestMapping(value="select.do")
    public @ResponseBody JsonModel  select(int pageSize,int pageIndex,String Search){
   //List<User>
    	JsonModel jsonModel = new JsonModel();
    	List<User> listuser=null;
		try {
	    	listuser=userService.selectUser(pageSize, pageIndex, Search);

	    	int total=(listuser.size()-1)/pageSize+1;
	    	
			jsonModel.setPage(String.valueOf(pageIndex));
			jsonModel.setRecords(String.valueOf(pageSize));
			jsonModel.setTotal(String.valueOf(total)); //����ҳ
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("rows", listuser);
			jsonModel.setRows(listuser);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return jsonModel;
		/*String resultString ="{\"page\":\"1\",\"total\":\"4\",\"records\":\"4\", "; 
		resultString +="\"rows\":[{\"id\":\"1\",\"userName\":\"polaris\",\"gender\":\"��\",\"email\":\"polaris@gmail.com\",\"QQ\":\"772618379\",\"mobilePhone\":\"18329382732\",\"birthday\":\"1985-10-2\"},";  
		resultString +="{\"id\":\"1\",\"userName\":\"polaris\",\"gender\":\"��\",\"email\":\"polaris@gmail.com\",\"QQ\":\"772618379\",\"mobilePhone\":\"18329382732\",\"birthday\":\"1985-10-2\"},"; 
		resultString +="{\"id\":\"1\",\"userName\":\"polaris\",\"gender\":\"��\",\"email\":\"polaris@gmail.com\",\"QQ\":\"772618379\",\"mobilePhone\":\"18329382732\",\"birthday\":\"1985-10-2\"},";  
		resultString +="{\"id\":\"1\",\"userName\":\"polaris\",\"gender\":\"��\",\"email\":\"polaris@gmail.com\",\"QQ\":\"772618379\",\"mobilePhone\":\"18329382732\",\"birthday\":\"1985-10-2\"}]}"; 
		return resultString;*/
		//return listuser;
    }
    
    
     
}