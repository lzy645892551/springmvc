package com.wanda.controller;

import java.io.IOException;
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

import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.OpeningReport;
import com.wanda.bean.PayType;
import com.wanda.service.HtRoomService;
import com.wanda.service.HtUnitService;
import com.wanda.service.OpenService;
import com.wanda.service.OpeningPayService;
import com.wanda.service.PayTypeService;
import com.wanda.service.ProjectService;
import com.wanda.util.ExportOpen;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/open")
public class OpenController {

	@Autowired
	private OpenService service;
	
	@Autowired
	private HtUnitService unitservice;
	
	@Autowired
	private HtRoomService roomservice;
	
	@Autowired
	private ProjectService proservice;
	
	@Autowired
	private PayTypeService payservice;
	
	@Autowired
	private OpeningPayService openpayservice;
	
	@RequestMapping("list.do")
	public String getList(Model model) {
		List<OpeningReport> list = service.getList();
		model.addAttribute("list", list);
		for (OpeningReport open : list) {
			System.out.println(open);
		}
		return "open/list";
	}
	
	@RequestMapping("tobasicinfo.do")
	public String basicInfo(Model model) {
		model.addAttribute("prolist", unitservice.toAdd());
		roomservice.rollBackSix();//将所有待选房间都回退到3(未开盘)状态
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = cal.getTime();
		String time = sdf.format(date);
		model.addAttribute("updatetime", date);
		
		sdf = new SimpleDateFormat("yyyy-MM-dd 08:00:00");
		cal.add(Calendar.DAY_OF_MONTH, 1);
		date = cal.getTime();
		time = sdf.format(date);
		System.out.println(time);
		model.addAttribute("opentime", date);
		
		return "open/basicinfo";
	}
	
	@RequestMapping("chooseroom.do")
	public String chooseRoom(OpeningReport open, HttpServletRequest req, Model model) {
		open.setState("待审核");
		
		System.out.println("\n+++++++"+open+"\n");
		HtProject project = proservice.selectByPrimaryKey(open.getProject().getProjectId());
		open.getProject().setProjectName(project.getProjectName());;
		req.getSession().setAttribute("open", open);
		model.addAttribute("roomList", roomservice.getList(open.getProject().getProjectId()));
		
		return "open/chooseroom";
	}
	
	@RequestMapping("getroom.do")
	public String getRoom(HttpServletRequest req,Model model) {
		
		
		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
		roomservice.addbatch(open.getProject().getProjectId());
		
		System.out.println("open.get.projectId----" + open.getProject().getProjectId());
		List<HtRoom> roomList = roomservice.getList(open.getProject().getProjectId());
		System.out.println(roomList);
		model.addAttribute("roomList", roomList);
		
		return "open/chooseroom";
	}
	
	/*@RequestMapping("addbatch.do")
	public String addBatch(String ids) {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		roomservice.openbatch(map);
		
		return "redirect:";
	}*/
	
	@RequestMapping("removebatch.do")
	public String removeBatch(HttpServletRequest req, String ids, Model model) {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		roomservice.removeBatch(map);
		
		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
		List<HtRoom> roomList = roomservice.getList(open.getProject().getProjectId());
		System.out.println(roomList);
		model.addAttribute("roomList", roomList);
		
		return "open/chooseroom";
	}
	
	@RequestMapping("removeall.do")
	public String removeAll(HttpServletRequest req,Model model) {
		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
		roomservice.removeAll(open.getProject().getProjectId());
		
		System.out.println("open.get.projectId----" + open.getProject().getProjectId());
		List<HtRoom> roomList = roomservice.getList(open.getProject().getProjectId());
		System.out.println(roomList);
		model.addAttribute("roomList", roomList);
		
		return "open/chooseroom";
	}
	
	@RequestMapping("getprice.do")
	public String getPrice(HttpServletRequest req, Model model) {
		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
		model.addAttribute("roomList", roomservice.getList(open.getProject().getProjectId()));
		
		return "open/importprice";
	}
	
	@RequestMapping("getdiscount.do")
	public String getDiscount() {
		
		return "open/importdiscount";
	}
	
	@RequestMapping("getpay.do")
	public String getPay(HttpServletRequest req, Model model) {
//		String s = req.getParameter("discount");
//		double discount = Double.parseDouble(s);
//		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
//		open.setDiscount(discount);
//		
//		System.out.println("discount==="+ discount);
//		
//		List<PayType> list = payservice.getList();
//		model.addAttribute("payList", list);
		String s = req.getParameter("discount");
		double discount = Double.parseDouble(s);
		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
		open.setDiscount(discount);
		System.out.println("discount==="+ discount);
		
//		List<OpeningPay> list = openpayservice.selectByOpenId(open.getOpeningReportId());
//		req.getSession().setAttribute("openPayList", list);
		List<String> idList = new ArrayList<String>();
		req.getSession().setAttribute("idList", idList);
		List<PayType> openPayList = new ArrayList<PayType>();
		req.getSession().setAttribute("openPayList", openPayList);
		
		return "open/importpay";
	}
	
	@RequestMapping("choosepay.do")
	public String choosePay(HttpServletRequest req, Model model) {
		
		List<PayType> list = payservice.getList();
		model.addAttribute("payList", list);
		
		return "open/paydialog";
	}
	
	//在openPayList中添加信息
	@RequestMapping("addpay.do")
	public String addPay(HttpServletRequest req, String ids, Model model) {
		String[] id = ids.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
		map.put("snos", list);
		List<PayType> openPayList = payservice.selectByList(map);
		List<PayType> openPayListsession = new ArrayList<PayType>();
		List<String> idList = (List<String>) req.getSession().getAttribute("idList");
//		if(openPayList != null) {
			for (PayType payType : openPayList) {
				if(!idList.contains(payType.getPayTypeId())) {
					idList.add(payType.getPayTypeId());
				}
			}
//		}
		map.put("snos", idList);
		openPayListsession = payservice.selectByList(map);
		
//		List<OpeningPay> openPayList = openpayservice.selectByOpenId(open.getOpeningReportId());
		req.getSession().setAttribute("openPayList", openPayListsession);
		System.out.println("idList---" + idList);
		System.out.println("openPayList---" + openPayList);
		
		return "open/importpay";
	}
	
	@RequestMapping("delpay.do")
	public String delPay(HttpServletRequest req, String ids, Model model) {
		String[] id = ids.split(",");
//		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			list.add(id[i]);
		}
//		map.put("snos", list);
		
		@SuppressWarnings("unchecked")
		List<PayType> openPayList = (List<PayType>) req.getSession().getAttribute("openPayList");
		List<String> idList = (List<String>) req.getSession().getAttribute("idList");
		if(openPayList != null) {
			for (int i = openPayList.size()-1; i >=0; i--) {
				if(openPayList.get(i) != null){
					PayType openingPay = openPayList.get(i);
					if(list.contains(openingPay.getPayTypeId())) {
						openPayList.remove(openingPay);
						idList.remove(openingPay.getPayTypeId());
					}
				}
			}
		}
//		openpayservice.delPay(map);
		req.getSession().setAttribute("openPayList", openPayList);
		req.getSession().setAttribute("idList", idList);
		System.out.println("idList---" + idList);
		System.out.println("openPayList---" + openPayList);
		
		return "open/importpay";
	}
	
	@RequestMapping("topreview.do")
	public String toPreview(HttpServletRequest req, Model model) {
		
		
		return "open/preview";
	}
	
	@RequestMapping("submit.do")
	public String submit(HttpServletRequest req, Model model) {
		OpeningReport open = (OpeningReport) req.getSession().getAttribute("open");
		List<PayType> openPayList = (List<PayType>) req.getSession().getAttribute("openPayList");
		System.out.println("open---" + open);
		service.add(open);
		System.out.println("主键是：----" + open.getOpeningReportId());//已经将openReport主键返回
		roomservice.roomOpen(open.getOpeningReportId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (PayType payType : openPayList) {
			Map<String, String> mapp = new HashMap<String, String>();
			mapp.put("payid", payType.getPayTypeId());
			mapp.put("opid", open.getOpeningReportId());
			list.add(mapp);
		}
		map.put("snos", list);
		openpayservice.addPay(map);
		
		List<OpeningReport> openreportlist = service.getList();
		model.addAttribute("list", openreportlist);
//		for (OpeningReport open : list) {
//			System.out.println(open);
//		}
		return "open/list";
	}
	
	@RequestMapping("/pageExport.do")
	public void pageExport(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		request.setCharacterEncoding("UTF-8");
		
		String param = request.getParameter("list");
        JSONObject json=JSONObject.fromObject(param);
        @SuppressWarnings("unchecked")
        List<Map<String,String>> payList=json.getJSONArray("data");
        
		/*Object str = request.getParameter("list");
		JSONArray jsonArray =JSONArray.fromObject(str);
		JSONObject jsonOne;  
		List<HtUnit> list = new ArrayList<HtUnit>();
		for(int i=0;i<jsonArray.size();i++){  
		         jsonOne = jsonArray.getJSONObject(i);  
		         HtUnit unit = new HtUnit();
		         
		         String proName = (String) jsonOne.get("proName");
		         String roomCode = (String) jsonOne.get("roomCode");
		         String area = (String) jsonOne.get("area");
		         String priceType = (String) jsonOne.get("priceType");
		         String price = (String) jsonOne.get("price");
		         String total = (String) jsonOne.get("total");
		         
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
		} */

		response.setHeader("Content-Disposition","attachment;filename=exportdata.xls");//指定下载的文件名  
		response.setContentType("application/vnd.ms -excel");
		ExportOpen  ex = new ExportOpen();
		ex.buildStudentExcel(payList, "exportOpen.xls",response.getOutputStream());
	}
	
}




