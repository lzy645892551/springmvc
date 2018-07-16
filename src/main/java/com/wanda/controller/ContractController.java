package com.wanda.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.Contract;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtRoomPay;
import com.wanda.service.ContractService;
import com.wanda.service.HtRoomPayService;
import com.wanda.service.OrderService;
import com.wanda.service.PayTypeService;
import com.wanda.service.SaleChanceService;
import com.wanda.util.Export1;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/hetong")
public class ContractController {
	@Autowired
	private ContractService contractService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SaleChanceService saleChanceService;
	@Autowired
	PayTypeService payTypeService;
	@Autowired
	HtRoomPayService htRoomPayService;
	
	@RequestMapping("/list.do")
    public String list(Model model){
		model.addAttribute("list", contractService.getList());
		return "hetong";
	}
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class, 
			new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}
	@RequestMapping("/selfangjian.do")
	public String selfangjian(Model model){
		model.addAttribute("list", orderService.getFangjian());
		model.addAttribute("dingdanname", orderService.getList());
		model.addAttribute("list2", payTypeService.getList());
		model.addAttribute("list3", saleChanceService.getuser());
		return "addHeTong";
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
	@RequestMapping("/add.do")
	public String add(Contract contract) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addtime = sdf.format(new Date());
        Date ddate =sdf.parse(addtime);
        String[] s = contract.getCustomerName().split("&");
        contract.setOrderId(s[0]);
        contract.setCustomerName(s[1]);
        contract.setSignTime(ddate);
        contract.setContractState(1);
        contract.setDeleteState("0");
        contract.setCustomerId(saleChanceService.gettel(contract.getCustomerName()).getCustomerId());
        contract.setUserId(saleChanceService.getuserId(contract.getName()).getUserId());
        contractService.insertSelective(contract);
        
        HtRoomPay htRoomPay = new HtRoomPay();
        htRoomPay.setContractId(contractService.getcId(contract.getSignTime()).getContractId());
        htRoomPay.setRoomId(contract.getRoomId());
        htRoomPay.setCustomerId(saleChanceService.gettel(contract.getCustomerName()).getCustomerId());
        htRoomPay.setCustomerName(contract.getCustomerName());
        htRoomPay.setUserId(saleChanceService.getuserId(contract.getName()).getUserId());
        htRoomPay.setName(contract.getName());
        htRoomPay.setReceivableMoney(Float.parseFloat(contract.getContractTotal()));
        htRoomPay.setUncollectedMoney(Float.parseFloat(contract.getContractTotal()));
        htRoomPay.setDeleteState("使用");
        htRoomPayService.insertSelective(htRoomPay);
		return "redirect:list.do";
	}
	@RequestMapping("/addd.do")
	public String addd(Contract contract) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String addtime = sdf.format(new Date());
		Date ddate =sdf.parse(addtime);
		contract.setSignTime(ddate);
		contract.setContractState(1);
		contract.setDeleteState("0");
		contract.setCustomerId(saleChanceService.gettel(contract.getCustomerName()).getCustomerId());
        contract.setUserId(saleChanceService.getuserId(contract.getName()).getUserId());
		contractService.insertSelective(contract);
		
		HtRoomPay htRoomPay = new HtRoomPay();
        htRoomPay.setContractId(contractService.getcId(contract.getSignTime()).getContractId());
        htRoomPay.setRoomId(contract.getRoomId());
        htRoomPay.setCustomerId(saleChanceService.gettel(contract.getCustomerName()).getCustomerId());
        htRoomPay.setCustomerName(contract.getCustomerName());
        htRoomPay.setUserId(saleChanceService.getuserId(contract.getName()).getUserId());
        htRoomPay.setName(contract.getName());
        htRoomPay.setReceivableMoney(Float.parseFloat(contract.getContractTotal()));
        htRoomPay.setUncollectedMoney(Float.parseFloat(contract.getContractTotal()));
        htRoomPay.setDeleteState("使用");
        htRoomPayService.insertSelective(htRoomPay);
		return "redirect:list.do";
	}
	@RequestMapping("/selbyid")
	public String selbyid(String contractId,Model model){
		Contract Contract = contractService.selectByPrimaryKey(contractId);
        model.addAttribute("time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Contract.getSignTime()));
		model.addAttribute("Contract", Contract);
		model.addAttribute("ht", orderService.selArea(Contract.getRoomId()));
		model.addAttribute("list", orderService.getFangjian());
		model.addAttribute("tel", saleChanceService.gettel(Contract.getCustomerName()).getTel());
		model.addAttribute("order", orderService.selectByPrimaryKey(Contract.getOrderId()));
		model.addAttribute("list2", payTypeService.getList());
		model.addAttribute("list3", saleChanceService.getuser());
		return "selHeTong";
	}
	@RequestMapping("/del")
	public String del(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		contractService.del(map);
		return "redirect:list.do";
	}
	@RequestMapping("/zuofei")
	public String zuofei(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		contractService.zuofei(map);
		return "redirect:list.do";
	}
	@RequestMapping("/huifu")
	public String huifu(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		contractService.huifu(map);
		return "redirect:zuofeilist.do";
	}
	@RequestMapping("/zuofeilist")
	public String zuofeilist(Model model){
		model.addAttribute("list", contractService.getLista());
		return "zuofeihetong";
	}
	@RequestMapping("/update")
	public String update(Contract contract){
		contractService.updateByPrimaryKeySelective(contract);
		return "redirect:list.do";
	}
	@RequestMapping("/daochu.do")
	public void daochu(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		request.setCharacterEncoding("UTF-8");
		String str1 = request.getParameter("list");
		Object str = str1;
		JSONArray jsonArray =JSONArray.fromObject(str);
		JSONObject jsonOne;  
		List<Contract> list = new ArrayList<Contract>();
		for(int i=0;i<jsonArray.size();i++){  
		         jsonOne = jsonArray.getJSONObject(i);  
		         Contract order = new Contract();
		         String roomId = (String) jsonOne.get("roomId");
		         String customerName = (String) jsonOne.get("customerName");
		         String contractId = (String) jsonOne.get("contractId");
		         String signTime = (String) jsonOne.get("signTime");
		         String total = (String) jsonOne.get("total");
		         String payTypeName = (String) jsonOne.get("payTypeName");
		         String name = (String) jsonOne.get("name");
		         String contractState = (String) jsonOne.get("contractState");
		         
		      
		         order.setRoomId(roomId);
		         order.setCustomerName(customerName);
		         order.setContractId(contractId);
		         order.setDeleteUser(signTime);
		         order.setTotal(Float.parseFloat(total));
		         order.setPayTypeName(payTypeName);
		         order.setName(name);
		         order.setContractState(Integer.parseInt(contractState));
		         list.add(order);
		} 

		response.setHeader("Content-Disposition","attachment;filename=exportdata.xls");//指定下载的文件名  
		response.setContentType("application/vnd.ms -excel");
		Export1  ex = new Export1();
		ex.buildStudentExcel(list, "exportdata.xls",response.getOutputStream());
	}
	@RequestMapping("/selzhekou")
	public void selzhekou(String payTypeName,HttpServletResponse res){
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(payTypeService.selbyname(payTypeName).getExplains());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
