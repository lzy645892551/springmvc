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

import com.wanda.bean.HtRoomPay;
import com.wanda.service.ContractService;
import com.wanda.service.HtRoomPayService;
import com.wanda.service.OrderService;
import com.wanda.service.SaleChanceService;
import com.wanda.util.Export3;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/fangkuan")
public class HtRoomPayController {
	@Autowired
	private ContractService contractService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SaleChanceService saleChanceService;
	@Autowired
	private HtRoomPayService htRoomPayService;
	
	@RequestMapping("/list.do")
    public String list(Model model){
		model.addAttribute("list", htRoomPayService.getList());
		return "fangkuan";
	}
	@RequestMapping("/listlist.do")
	public String listlist(Model model){
		model.addAttribute("list", htRoomPayService.getLists());
		return "shenhe";
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
		htRoomPayService.del(map);
		return "redirect:list.do";
	}
	@RequestMapping("/tuikuan.do")
	public String tuikuan(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		htRoomPayService.tuikuan(map);
		return "redirect:list.do";
	}
	@RequestMapping("/zuofei.do")
	public String zuofei(String ids){
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		htRoomPayService.zuofei(map);
		return "redirect:list.do";
	}
	@RequestMapping("/huankuan.do")
	public String huankuan(String ids, String receivedMoneys,String uncollectedMoneys){
		String id = ids.substring(0, ids.length()-1);
		String receivedMoney = receivedMoneys.substring(0, receivedMoneys.length()-1);
		String uncollectedMoney = uncollectedMoneys.substring(0, uncollectedMoneys.length()-1);
		String[] idx = id.split(",");
		String[] receivedMoneyx = receivedMoney.split(",");
		String[] uncollectedMoneyx = uncollectedMoney.split(",");
		for(int i=0;i<idx.length;i++){
			HtRoomPay ht = new HtRoomPay();
			ht.setRoomPayId(idx[i]);
			
			Float rr = htRoomPayService.byid(idx[i]).getUncollectedMoney();
			Float bb = htRoomPayService.byid(idx[i]).getReceivableMoney();
			Float cc = htRoomPayService.byid(idx[i]).getReceivedMoney();
			if(cc==null||cc.equals("")){
				cc = 0f;
			}
			
			
			if(rr==Float.parseFloat(uncollectedMoneyx[i])&&bb<Float.parseFloat(uncollectedMoneyx[i])){
				
			}else{
				ht.setUncollectedMoney(Float.parseFloat(uncollectedMoneyx[i])-Float.parseFloat(receivedMoneyx[i]));
			}
			ht.setReceivedMoney(cc+Float.parseFloat(receivedMoneyx[i]));
			ht.setPayTime(new Date());
			htRoomPayService.uproomid(ht);
		}
		return "redirect:list.do";
	}
	@RequestMapping("/gengmingshenqing.do")
	public String gengmingshenqing(String id){
		htRoomPayService.gengmingshenqing(id);
		return "redirect:list.do";
	}
	@RequestMapping("/gengming.do")
	public String gengming(HtRoomPay htRoomPay){
		String cid = saleChanceService.gettel(htRoomPay.getCustomerName()).getCustomerId();
		System.out.println("===="+cid);
		htRoomPay.setCustomerId(cid);
		htRoomPayService.gengming(htRoomPay);
		return "redirect:list.do";
	}
	@RequestMapping("/huanfangshenqing.do")
	public String huanfangshenqing(String id){
		htRoomPayService.huanfangshenqing(id);
		return "redirect:list.do";
	}
	@RequestMapping("/huanfang.do")
	public String huanfang(String payTypeKind,String id){
		HtRoomPay ht = new HtRoomPay();
		ht.setRoomId(saleChanceService.getroomb(payTypeKind).getRoomId());
		ht.setRoomPayId(id);
		htRoomPayService.uproomid(ht);
		return "redirect:list.do";
	}
	@RequestMapping("/xuanzefang.do")
	public String xuanzefang(Model model){
		model.addAttribute("list", saleChanceService.getrooma());
		return "huanfangla";
	}
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class, 
			new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}
	@RequestMapping("/daochu.do")
	public void daochu(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String str1 = request.getParameter("list");
		System.out.println(str1);
		Object str = str1;
		JSONArray jsonArray =JSONArray.fromObject(str);
		JSONObject jsonOne;  
		List<HtRoomPay> list = new ArrayList<HtRoomPay>();
		for(int i=0;i<jsonArray.size();i++){  
		         jsonOne = jsonArray.getJSONObject(i);  
		         HtRoomPay order = new HtRoomPay();
		         String roomPayId = (String) jsonOne.get("roomPayId");
		         String contractId = (String) jsonOne.get("contractId");
		         String orderId = (String) jsonOne.get("orderId");
		         String roomId = (String) jsonOne.get("roomId");
		         String customerId = (String) jsonOne.get("customerId");
		         String customerName = (String) jsonOne.get("customerName");
		         String userId = (String) jsonOne.get("userId");
		         String name = (String) jsonOne.get("name");
		         String receivableMoney = (String) jsonOne.get("receivableMoney");
		         String receivedMoney = (String) jsonOne.get("receivedMoney");
		         String uncollectedMoney = (String) jsonOne.get("uncollectedMoney");
		         String payTime = (String) jsonOne.get("payTime");
		         String payType = (String) jsonOne.get("payType");
		         String finishTimes = (String) jsonOne.get("finishTimes");
		         String waitTimes = (String) jsonOne.get("waitTimes");
		         String deleteState = (String) jsonOne.get("deleteState");
		         
		      
		         order.setRoomPayId(roomPayId);
		         order.setContractId(contractId);
		         order.setOrderId(orderId);
		         order.setRoomId(roomId);
		         order.setCustomerId(customerId);
		         order.setCustomerName(customerName);
		         order.setUserId(userId);
		         order.setName(name);
		         order.setReceivableMoney(Float.parseFloat(receivableMoney));
		         if(receivedMoney!=null&&!"".equals(receivedMoney)){
		        	 order.setReceivedMoney(Float.parseFloat(receivedMoney));
		         }else{
		        	 order.setReceivedMoney(0.0f);
		         }
		         order.setUncollectedMoney(Float.parseFloat(uncollectedMoney));
		         order.setDeleteUser(payTime);
		         order.setPayType(payType);
		         order.setFinishTimes(finishTimes);
		         order.setWaitTimes(waitTimes);
		         order.setDeleteState(deleteState);
		         list.add(order);
		} 

		response.setHeader("Content-Disposition","attachment;filename=exportdata.xls");//指定下载的文件名  
		response.setContentType("application/vnd.ms -excel");
		Export3  ex = new Export3();
		ex.buildStudentExcel(list, "exportdata.xls",response.getOutputStream());
	}
	@RequestMapping("/shenhe")
	public String shenhe(String roomPayId){
		htRoomPayService.shenhe(roomPayId);
		return "redirect:listlist.do";
	}
	@RequestMapping("/butongguo")
	public String butongguo(String roomPayId){
		htRoomPayService.butongguo(roomPayId);
		return "redirect:listlist.do";
	}
}
