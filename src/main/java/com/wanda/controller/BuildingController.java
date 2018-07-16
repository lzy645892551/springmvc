package com.wanda.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanda.bean.ApartmentLayout;
import com.wanda.bean.HtBuild;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtUnit;
import com.wanda.bean.Purpose;
import com.wanda.service.ApartmentLayoutService;
import com.wanda.service.BuildingService;
import com.wanda.service.HtUnitService;
import com.wanda.service.ProjectService;
import com.wanda.service.RoomService;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("/build")
public class BuildingController {
	@Autowired
	BuildingService buildService;
	@Autowired
	ProjectService projectService;
	@Autowired
	RoomService roomService;
	@Autowired
	ApartmentLayoutService layoutService;
	@Autowired
	HtUnitService unitService;
	
	@RequestMapping("/buildingManager.do")
	public String buildingSelect(HttpServletRequest request,HtBuild build){
		List<HtBuild>buildingList = buildService.getList(build);
		List<HtProject>proList = projectService.selectProject(null);
		System.out.println("changdu了"+buildingList.size());
		request.setAttribute("proList", proList);
		request.getSession().setAttribute("buildingList", buildingList);
		return "buildingManager";
	}
	
	@RequestMapping("/buildDeleteAll.do")
	public String buildDeleteAll(){
		buildService.deleteByPrimaryKey("");
		return "redirect:buildingManager.do";
	}
	
	@RequestMapping("/buildingReady.do")
	public String buildingReady(HttpServletRequest request,HtBuild building,String batch){
			List<HtProject>proList = (List<HtProject>) request.getSession().getAttribute("proList");
			if(proList!=null&&proList.size()!=0){
				System.out.println("进来");
			}else{
				proList = projectService.selectProject(null);
				request.setAttribute("proList", proList);
			}
			if(batch!=null&&!"".equals(batch)){
				request.setAttribute("insertBatch", "true");
			}else if(building.getBuildId()!=null){
				
				HtBuild build = buildService.selectByPrimaryKey(building.getBuildId());
				build.setProjectId(build.getProject().getProjectId());
				request.setAttribute("building", build);
			}
		
		return "buildingAdd";
		
	}
	
	@RequestMapping("/buildDelete.do")
	public String buildDelete(String buildId){
		String []str = buildId.split(",");
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("buildMap", str);
		buildService.deleteIn(map);
		return "redirect:buildingManager.do";
	}
	
	@RequestMapping("/buildAddOrUpdate.do")
	public String buildAddOrUpdate(HtBuild build ,String buildCount,String projectName){
		Date date = new Date();
		System.out.println("楼名啊"+build.getBuildName());
		build.setBuildName(projectName+"#"+build.getBuildName());
		build.setUpdateTime(date.toLocaleString());
		HtBuild building = null;
		if(buildCount!=null&&buildCount.trim().length()>0){
			System.out.println("批量添加");
			System.out.println(buildCount);
			List<HtBuild>buildList = new ArrayList<HtBuild>();
			Map<String,List<HtBuild>>map = new HashMap<String, List<HtBuild>>();
			for(int i = 0;i<Integer.parseInt(buildCount);i++){
				building = new HtBuild();
				building.setUpdateTime(date.toLocaleString());
				building.setProjectId(build.getProjectId());
				building.setFloorCount(build.getFloorCount());
				building.setRoomCount(build.getRoomCount());
				building.setBuildId(buildService.SELECT_UUID());
				building.setBuildName(build.getBuildName()+(i+1));
				building.setRemark(build.getRemark());
				building.setUpdateUser(build.getUpdateUser());
				buildList.add(building);
			}
			map.put("buildList", buildList);
			buildService.insertBatch(map);
		}else{
			if(build.getBuildId()!=null&&build.getBuildId().trim().length()>0){
				buildService.updateByPrimaryKey(build);
			}else{
				buildService.insert(build);
			}
		}
		return "redirect:buildingManager.do";
	}
	
	@RequestMapping("buildingAddManager")
	public String buildingAddManager(HtBuild build,String buildCount){
		
		return "redirect:buildingManager.do";
	}
	
	@RequestMapping("/roomCreateBatch")
	public String roomCreateBatch(Model model){
		List<HtBuild>buildList = buildService.getList(null);
		model.addAttribute("buildList",buildList);
		List<ApartmentLayout>layList = layoutService.getList(null);
		model.addAttribute("layList",layList);
		return "createRoom";
	}
	
	@RequestMapping("/selectById.do")
	public void selectById(String buildId,HttpServletResponse response){
		try {
			 HtBuild build= buildService.selectByPrimaryKey(buildId);
			 System.out.println();
			 build.setProjectId(build.getProject().getProjectId());
			JSON json = JSONObject.fromObject(build);
			System.out.println(json.toString());
			response.getWriter().print(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/selectByBuildId.do")
	public void selectByBuildId(String buildId,HttpServletResponse response){
		try {
			System.out.println("进来");
			 HtUnit unit = new HtUnit();
			 HtBuild build= buildService.selectByPrimaryKey(buildId);
			 build.setProjectId(build.getProject().getProjectId());
			 unit.setBuild(build);
			 List<HtUnit>unitList = unitService.getListFromBuild(unit);
			JSONArray json = JSONArray.fromObject(unitList);
			System.out.println("数组"+json.toString());
			response.getWriter().print(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public  String UUID(){
		String select_UUID = buildService.SELECT_UUID();
		return select_UUID;
	}
	
	@RequestMapping("/addRoomredis.do")
	public void addRoomRedis(String datalist,HttpServletResponse response){
		final Date date = new Date();
		System.out.println(datalist);
		Jedis jedis = new Jedis("127.0.0.1", 6379);
		final JSONArray json = JSONArray.fromObject(datalist);
		Iterator<Object> iterator = json.iterator();
		new Thread(){
			public void run() {
				Iterator<Object> iterator = json.iterator();
				List<HtRoom>roomList = new ArrayList<HtRoom>();
				Map<String,Object> map = new HashMap<String,Object>();
				System.out.println("进入新县城");
				JSONObject js = null;
				HtRoom room=null;
				HtUnit unit = new HtUnit();
				Purpose p = new Purpose();
				ApartmentLayout layout = new ApartmentLayout();
				while(iterator.hasNext()){
					js = (JSONObject) iterator.next();
					System.out.println(js.toString());
					room = new HtRoom();
					layout.setApartmentLayout(js.getString("apartLayout"));
					List<ApartmentLayout> layList = layoutService.getList(layout);
					room.setRoomId(UUID());
					room.setRoomCode(js.getString("roomCode"));
					room.setBuildId(js.getString("buildId"));
					room.setProjectId(js.getString("projectId"));
					room.setFloor(js.getInt("floor"));
					room.setState(js.getInt("state"));
					room.setUnitId(js.getString("unitId"));
					room.setApartmentLayoutId(layList.get(0).getApartmentLayoutId());
					room.setInnerArea(js.getInt("innerArea")+0.0f);
					room.setInnerPrice(js.getInt("innerPrice")+0.0f);
					room.setUnitPrice(js.getInt("unitPrice")+0.0f);
					room.setBuildUpArea(js.getInt("buildUpArea")+0.0f);
					room.setState(js.getInt("state"));
					room.setUpdateTime(date.toLocaleString());
					room.setUpdateUser(js.getString("updateUser"));
					roomList.add(room);
				}
				map.put("roomList", roomList);
				roomService.insertBatch(map);
			};
		}.start();
		JSONObject js = null;
//		jedis.lpush("roomList","123");
		while(iterator.hasNext()){
			System.out.println("老县城");
			js = (JSONObject) iterator.next();
			jedis.lpush("room", js.toString());
		}
		jedis.close();
		try {
			response.getWriter().print("成功");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
}
