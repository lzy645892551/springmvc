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
import com.wanda.bean.Order;
import com.wanda.service.ContractService;
import com.wanda.service.HtRoomPayService;
import com.wanda.service.OrderService;
import com.wanda.service.PayTypeService;
import com.wanda.service.SaleChanceService;
import com.wanda.util.Export2;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/Admin")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ContractService contractService;
	@Autowired
	SaleChanceService saleChanceService;
	@Autowired
	PayTypeService payTypeService;
	@Autowired
	HtRoomPayService htRoomPayService;

	@RequestMapping("/list.do")
	public String list(Model model) {
		List<Order> list = orderService.getList();
		model.addAttribute("list", list);
		return "Dingan";
	}

	@RequestMapping("/listzuofei.do")
	public String list1(Model model) {
		List<Order> list = orderService.getList1();
		model.addAttribute("list", list);
		return "DinganZuoFei";
	}

	@RequestMapping("/selfangjian.do")
	public String fangjian(Model model) {
		model.addAttribute("list1", orderService.getFangjian());
		model.addAttribute("list", saleChanceService.getkehu());
		model.addAttribute("list2", payTypeService.getList());
		model.addAttribute("list3", saleChanceService.getuser());
		return "addDingan";
	}

	@RequestMapping("/selArea.do")
	public void selArea(String roomId, HttpServletResponse res) {
		HtRoom ht = orderService.selArea(roomId);
		Float area = ht.getInnerArea();
		Float price = ht.getInnerPrice();
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().print(area + "/" + price);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/add.do")
	public String add(Order order) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String addtime = sdf.format(new Date());
		Date ddate = sdf.parse(addtime);
		order.setCreateTime(ddate);
		orderService.insertSelective(order);
		return "redirect:list.do";
	}

	@RequestMapping("/update.do")
	public String update(Order order) {
		orderService.updateByPrimaryKeySelective(order);
		return "redirect:list.do";
	}

	@RequestMapping("/del.do")
	public String del(String ids) {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		orderService.dele(map);
		return "redirect:list.do";
	}

	@RequestMapping("/selbyid.do")
	public String selbyid(String orderId, Model model) throws ParseException {
		Order order = orderService.selectByPrimaryKey(orderId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String addtime = sdf.format(order.getCreateTime());
		model.addAttribute("time", addtime);
		model.addAttribute("order", order);
		HtRoom ht = orderService.selArea(order.getRoomId());
		model.addAttribute("ht", ht);
		List<HtRoom> list = orderService.getFangjian();
		model.addAttribute("list1", list);
		model.addAttribute("list2", payTypeService.getList());
		model.addAttribute("list3", saleChanceService.getuser());
		return "selDingan";
	}

	@RequestMapping("/huifu.do")
	public String huifu(String ids) {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		orderService.huifu(map);
		return "redirect:list.do";
	}

	@RequestMapping("/zuofei.do")
	public String zuofei(String ids) {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		orderService.zuofei(map);
		return "redirect:listzuofei.do";
	}

	@RequestMapping("/qianyue.do")
	public String qianyue(String ids) throws ParseException {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		orderService.qianyue(map);
		for (String orderId : list) {
			if (orderId != null && !"".equals(orderId)) {
				Order order = orderService.selectByPrimaryKey(orderId);
				Contract contract = new Contract();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String addtime = sdf.format(order.getCreateTime());
				Date ddate = sdf.parse(addtime);
				contract.setSignTime(ddate);
				contract.setFirstParty("万达");
				contract.setContractTotal(order.getTotal() + "");
				contract.setCustomerName(order.getCustomerName());
				contract.setOrderId(orderId);
				contract.setSecondParty(order.getCustomerName());
				contract.setName(order.getName());
				contract.setRoomId(order.getRoomId());
				contract.setUnitPrice(order.getUnitPrice());
				contract.setTotal(order.getTotal());
				contract.setPayTypeName(order.getPayTypeName());
				contract.setContractState(1);
				contract.setDeleteState("0");
				System.out.println(order.getCustomerName()+"顾客名字");
				System.out.println(saleChanceService.gettel(order.getCustomerName()).getCustomerId()+"顾客ID");
				
				contract.setCustomerId(saleChanceService.gettel(order.getCustomerName()).getCustomerId());
		        contract.setUserId(saleChanceService.getuserId(contract.getName()).getUserId());
		        contractService.insertSelective(contract);
		        
		        HtRoomPay htRoomPay = new HtRoomPay();
		        htRoomPay.setContractId(contractService.getId(orderId).getContractId());
		        htRoomPay.setOrderId(orderId);
		        htRoomPay.setRoomId(order.getRoomId());
		        htRoomPay.setCustomerId(contractService.getId(orderId).getCustomerId());
		        htRoomPay.setCustomerName(order.getCustomerName());
		        htRoomPay.setUserId(contractService.getId(orderId).getUserId());
		        htRoomPay.setName(order.getName());
		        htRoomPay.setReceivableMoney(Float.parseFloat(contractService.getId(orderId).getContractTotal()));
		        htRoomPay.setUncollectedMoney(Float.parseFloat(contractService.getId(orderId).getContractTotal()));
		        htRoomPay.setDeleteState("使用");
		        htRoomPayService.insertSelective(htRoomPay);
				
			}
		}
		return "redirect:list.do";
	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}

	@RequestMapping("/daochu.do")
	public void daochu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String str1 = request.getParameter("list");
		Object str = str1;
		JSONArray jsonArray = JSONArray.fromObject(str);
		JSONObject jsonOne;
		List<Order> list = new ArrayList<Order>();
		for (int i = 0; i < jsonArray.size(); i++) {
			jsonOne = jsonArray.getJSONObject(i);
			Order order = new Order();
			String orderId = (String) jsonOne.get("orderId");
			String customerName = (String) jsonOne.get("customerName");
			String payArea1 = (String) jsonOne.get("payArea");
			float payArea = Float.parseFloat(payArea1);
			String unitPrice1 = (String) jsonOne.get("unitPrice");
			float unitPrice = Float.parseFloat(unitPrice1);
			String total1 = (String) jsonOne.get("total");
			float total = Float.parseFloat(total1);
			String orderType = (String) jsonOne.get("orderType");
			String payTypeName = (String) jsonOne.get("payTypeName");
			String name = (String) jsonOne.get("name");

			order.setOrderId(orderId);
			order.setCustomerName(customerName);
			order.setPayArea(payArea);
			order.setUnitPrice(unitPrice);
			order.setTotal(total);
			order.setOrderType(orderType);
			order.setPayTypeName(payTypeName);
			order.setName(name);
			list.add(order);
		}

		response.setHeader("Content-Disposition", "attachment;filename=exportdata.xls");// 指定下载的文件名
		response.setContentType("application/vnd.ms -excel");
		Export2 ex = new Export2();
		ex.buildStudentExcel(list, "exportdata.xls", response.getOutputStream());
		// out.clear();
		// out=pageContext.pushBody();

	}

}