package com.wanda.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.HtBuild;
import com.wanda.bean.HtCustomer;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtUnit;
import com.wanda.bean.SaleChance;
import com.wanda.bean.User;
import com.wanda.service.OrderService;
import com.wanda.service.PayTypeService;
import com.wanda.service.SaleChanceService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/xiaoshou")
public class SaleChanceController {
	@Autowired
	SaleChanceService saleChanceService;
	@Autowired
	OrderService orderService;
	@Autowired
	PayTypeService payTypeService;
	@RequestMapping("/list.do")
	public String list(Model model) {
		List<SaleChance> list = saleChanceService.getList();
		model.addAttribute("list", list);
		return "XiaoShouJiHui";
	}
	@RequestMapping("/add.do")
	public String add(SaleChance sal) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addtime =   sdf.format(new Date());
        Date ddate =sdf.parse(addtime);
        sal.setState("草稿");
        sal.setUserId(sal.getNumber());
		sal.setAddtime(ddate);
		HtCustomer tel = saleChanceService.gettel(sal.getCustomerName());
		sal.setCustomerId(tel.getCustomerId());
		saleChanceService.add(sal);
		return "redirect:list.do";
	}
	@RequestMapping("/selxiangmu.do")
	public String selbyid(Model model){
		List<HtProject> lista = saleChanceService.getxiangmu();
		model.addAttribute("lista", lista);
		List<HtCustomer> listf = saleChanceService.getkehu();
		model.addAttribute("listf", listf);
		model.addAttribute("list3", saleChanceService.getuser());
		return "addxiaoshou";
	}
	@RequestMapping("/selloudong.do")
	public void selloudong(String projectId,HttpServletResponse res){
		List<HtBuild> listb = saleChanceService.getloudong(projectId);
		String buildName = "";
		for(HtBuild h:listb){
			buildName += h.getBuildName()+","+h.getBuildId()+"/";
		}
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(buildName.substring(0,buildName.length()-1));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/seltel.do")
	public void seltel(String customerName,HttpServletResponse res){
		HtCustomer tel = saleChanceService.gettel(customerName);
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(tel.getTel());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/selbynum.do")
	public void selbynum(String number,HttpServletResponse res){
		User name = saleChanceService.getname(number);
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(name.getName());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/selunit.do")
	public void selunit(String buildId,HttpServletResponse res){
		List<HtUnit> listc = saleChanceService.getunit(buildId);
		JSONArray jsonArray =JSONArray.fromObject(listc);
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/selroom.do")
	public void selroom(String unitId,HttpServletResponse res){
		List<HtRoom> listd = saleChanceService.getroom(unitId);
		JSONArray jsonArray =JSONArray.fromObject(listd);
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/selbyid.do")
	public String selbyid(String xiaoshouId,Model model){
		model.addAttribute("sal", saleChanceService.selectByPrimaryKey(xiaoshouId));
		model.addAttribute("xiangmuname",saleChanceService.getxiangmuname(saleChanceService.selectByPrimaryKey(xiaoshouId).getProjectId()));
		model.addAttribute("loudong",saleChanceService.getloudongbyid(saleChanceService.selectByPrimaryKey(xiaoshouId).getBuildId()));
		model.addAttribute("danyuan",saleChanceService.getdanyuanbyid(saleChanceService.selectByPrimaryKey(xiaoshouId).getUnitId()));
		model.addAttribute("room",saleChanceService.getroombyid(saleChanceService.selectByPrimaryKey(xiaoshouId).getRoomId()));
		model.addAttribute("lista", saleChanceService.getxiangmu());
		model.addAttribute("listf", saleChanceService.getkehu());
		model.addAttribute("list3", saleChanceService.getuser());
		return "updatexiaoshou";
	}
	@RequestMapping("/update.do")
	public String update(SaleChance sal) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addtime =   sdf.format(new Date());
        Date ddate =sdf.parse(addtime);
		sal.setUpdateTime(ddate);
		saleChanceService.updateByPrimaryKeySelective(sal);
		return "redirect:list.do";
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
		saleChanceService.del(map);
		return "redirect:list.do";
	}
	@RequestMapping("/zhuanrengou.do")
	public String zhuanrengou(String customerName,String userName,Model model){
		model.addAttribute("userName", userName);
		model.addAttribute("customerName", customerName);
		model.addAttribute("list1", orderService.getFangjian());
		model.addAttribute("list2", payTypeService.getList());
		return "zhuanrengou";
	}
	@RequestMapping("/zhuanqianyue.do")
	public String zhuanqianyue(String customerName,String userName,Model model){
		model.addAttribute("userName", userName);
		model.addAttribute("customerName", customerName);
		model.addAttribute("list", orderService.getFangjian());
		model.addAttribute("tel", saleChanceService.gettel(customerName).getTel());
		model.addAttribute("list2", payTypeService.getList());
		return "zhuanqianyue";
	}
	@RequestMapping("/selArea.do")
	public void selArea(String roomId,HttpServletResponse res){
		HtRoom ht = orderService.selArea(roomId);
		Float area = ht.getInnerArea();
		Float price = ht.getInnerPrice();
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(area+"/"+price);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
/*	@RequestMapping("/add.do")
	public String add(PayType payType){
		payTypeService.add(payType);
		return "redirect:list.do";
	}
	
	@RequestMapping("/update.do")
	public String update(PayType payType,Model model){
		payTypeService.updateByPrimaryKeySelective(payType);
		return "redirect:list.do";
	}
*/
}