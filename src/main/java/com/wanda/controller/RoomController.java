package com.wanda.controller;

import java.util.ArrayList;
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

import com.wanda.bean.ApartmentLayout;
import com.wanda.bean.HtBuild;
import com.wanda.bean.HtProject;
import com.wanda.bean.HtRoom;
import com.wanda.bean.HtUnit;
import com.wanda.service.ApartmentLayoutService;
import com.wanda.service.BuildingService;
import com.wanda.service.HtUnitService;
import com.wanda.service.ProjectService;
import com.wanda.service.RoomService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired
	RoomService roomService;
	@Autowired
	ProjectService projectService;
	@Autowired
	BuildingService buildService;
	@Autowired
	ApartmentLayoutService layoutService;
	@Autowired
	HtUnitService unitService;
	Jedis jedis = new Jedis("127.0.0.1",6379);
		
	@RequestMapping("/roomManager.do")
	public String roomManager(HttpServletRequest request,HtRoom room){
		
//		if(jedis.lrange("room", 0, -1) != null&&!"".equals(jedis.lrange("room", 0, -1))){
//			System.out.println("进来"+jedis.lrange("room", 0, -1));
//			List<String> lrange = jedis.lrange("room", 0, -1);
//			JSONArray json = JSONArray.fromObject(lrange);
////			request.setAttribute("roomList",json.toString());
//			Iterator<Object> iterator = json.iterator();
//			List<HtRoom>roomList = new ArrayList<HtRoom>();
//			Map<String,Object> map = new HashMap<String,Object>();
//			JSONObject js = null;
//			HtUnit unit = new HtUnit();
//			Purpose purpose = new Purpose();
//			ApartmentLayout layout = new ApartmentLayout();
//			while(iterator.hasNext()){
//				js = (JSONObject) iterator.next();
//				System.out.println(js.toString());
//				room = new HtRoom();
//				room.setRoomId(UUID());
//				room.setRoomCode(js.getString("roomCode"));
//				room.setBuildId(js.getString("buildId"));
//				room.setProjectId(js.getString("projectId"));
//				room.setFloor(js.getInt("floor"));
//				room.setState(js.getInt("state"));
//				unit.setUnitId(js.getString("unitId"));
//				room.setUnit(unit);
//				purpose.setPurpose(js.getString("purpose"));
//				room.setPurpose(purpose);
//				layout.setApartmentLayout(js.getString("layout"));
//				room.setInnerArea(js.getInt("innerArea")+0.0f);
//				room.setInnerPrice(js.getInt("innerPrice")+0.0f);
//				room.setUnitPrice(js.getInt("unitPrice")+0.0f);
//				room.setBuildUpArea(js.getInt("buildUpArea")+0.0f);
//				roomList.add(room);
//			}
//			request.setAttribute("roomList", roomList);
//		}else{	
			List<HtRoom> roomList = roomService.getList(room);
			request.setAttribute("roomList", roomList);
//		}
		return "roomManager";
	}
		
		public  String UUID(){
			String select_UUID = buildService.SELECT_UUID();
			return select_UUID;
		}
		
		
	
	@RequestMapping("/roomReady.do")
	public String roomReady(HtRoom room,Model model){
		List<HtProject>proList = projectService.selectProject(null);
		List<ApartmentLayout>layoutList =layoutService.getList(room.getLayout());
		model.addAttribute("proList",proList);
		model.addAttribute("layoutList",layoutList);
		if(room!=null&&room.getRoomId()!=null){
			System.out.println(room.getRoomId());
			room = roomService.selectByPrimaryKey(room.getRoomId());
			System.out.println(room.getBuild().getBuildName());
			model.addAttribute("getRoom",room);
		}
		return "roomAddOrUpdate";
	}
	
	
	@RequestMapping("selectBui.do")
	public void selectPro(String projectId,HttpServletResponse response){
		try{
			System.out.println("来了"+projectId);
			HtBuild build = new HtBuild();
			build.setProjectId(projectId);
			List<HtBuild>buildList = buildService.selectByProId(build.getProjectId());
			JSONArray js = JSONArray.fromObject(buildList);
			response.getWriter().print(js.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("selectUni.do")
	public void selectUni(String buildId,HttpServletResponse response,HttpServletRequest request){
		try{
			System.out.println("来了"+buildId);
			HtUnit unit = new HtUnit();
			HtBuild build = new HtBuild();
			build.setBuildId(buildId);
			unit.setBuild(build);
			List<HtUnit>unitList = unitService.getList();
			System.out.println("这是啥啊"+unitList.get(0).getBuild().getFloorCount());
			JSONArray js = JSONArray.fromObject(unitList);
			response.getWriter().print(js.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectRoom.do")
	public void selectRoom(String unitId,HttpServletResponse response){
		try{
			System.out.println("来了"+unitId);
			HtUnit unit = unitService.selectByKey(unitId);
			Integer roomCount = Integer.parseInt(unit.getRoomCount());
			List<String>list = new ArrayList<String>();
			for(int i = 0;i<roomCount;i++){
				list.add((i+1)+"");
			}
			JSONArray js = JSONArray.fromObject(list);
			response.getWriter().print(js.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectRoom1.do")
	public void selectRoom1(String unitId,HttpServletResponse response){
		try{
			System.out.println("来了"+unitId);
			HtUnit unit = unitService.selectByKey(unitId);
			Integer floorCount = unit.getBuild().getFloorCount();
			List<String>list = new ArrayList<String>();
			for(int i = 0;i<floorCount;i++){
				list.add((i+1)+"");
			}
			JSONArray js = JSONArray.fromObject(list);
			response.getWriter().print(js.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/roomAddOrUpdate.do")
	public String roomAddOrUpdate(final HtRoom room){
		
		JSONObject json = JSONObject.fromObject(room);
		System.out.println(json.toString());
		Date date = new Date();
		room.setUpdateTime(date.toLocaleString());
		if(room.getRoomId()==null||room.getRoomId().trim().length()==0){
			new Thread(){
				public void run() {
					roomService.insert(room);
				};
			}.start();
			jedis.lpush("room", json.toString());
			room.setRoomCode(room.getFloor()+"0"+room.getRoomCode());
		}else{
			room.setRoomCode(room.getFloor()+"0"+room.getRoomCode());
			roomService.updateByPrimaryKeySelective(room);
		}
		jedis.close();
		return "redirect:roomManager.do";
	}
	
	@RequestMapping("/roomDeleteAll.do")
	public String roomDeleteAll(){
		roomService.deleteByPrimaryKey(null);
		return "redirect:roomManager.do";
	}
	
	@RequestMapping("/roomDelete.do")
	public String roomDelete(String roomId){
		Map<String,Object> map = new HashMap<String, Object>();
		String[] str = roomId.split(",");
		map.put("roomMap", str);
		roomService.deleteIn(map);
		return "redirect:roomManager.do";
	}
	
	
	
	@RequestMapping("/roomManagerDetail.do")
	public String roomDetail(String roomId,Model model){
		HtRoom room = roomService.selectByPrimaryKey(roomId);
		model.addAttribute("room", room);
		return "roomManagerDetail";
	}
	
	
	
}
