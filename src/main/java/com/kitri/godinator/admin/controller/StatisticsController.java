package com.kitri.godinator.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.admin.service.SchoolService;
import com.kitri.godinator.admin.service.StatisticsService;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.VisitDto;

@Controller
@RequestMapping("/admin")
public class StatisticsController {
	
	@Autowired
	private StatisticsService service;
	
	@RequestMapping(value = "/countVisit", method = RequestMethod.GET)
	public void countVisit (@RequestParam(name = "user", defaultValue = "") String user) throws Exception {
		System.out.println("> 로그인안한 사람들 방문 수 세기 Controller 입성 : " + user);
		service.addCnt(user);
	}
	
	@RequestMapping(value = "/countUserVisit", method = RequestMethod.GET)
	public void countUserVisit (@RequestParam(name = "id", defaultValue = "") String id) throws Exception {
		System.out.println("> 로그인한 사람들 방문 수 세기 Controller 입성 : " + id);
		//service.addCnt(user);
	}
	
	   @RequestMapping(value = "/upperMemberList", method = RequestMethod.GET) // 검색할 때 들어오는건가
	   @ResponseBody
	   public String upperMemberList (@RequestParam Map<String, String> parameter, Model model) throws Exception {
		   JsonObject members = new JsonObject();
	       JsonArray jsonArray = new JsonArray();
		   
	       System.out.println("> 방문횟수 높은 member찾는 Controller입성");
	       
	       List<VisitDto> list = service.upperMemberList();
	       for(Object obj : list) {
	            if(obj != null) {
	                   JsonObject member = new JsonObject();
	                   
	                   String rownum = ((VisitDto)obj).getRownum();
	                   String visitCnt = ((VisitDto)obj).getVisitCnt();
	                   String visitUserId = ((VisitDto)obj).getVisitUserId();
	                   String userName = ((VisitDto)obj).getUserName();

	                   member.addProperty("rownum", rownum);
	                   member.addProperty("visitCnt", visitCnt);
	                   member.addProperty("visitUserId", visitUserId);
	                   member.addProperty("userName", userName);
	                   
	                   jsonArray.add(member);
	                   System.out.println(jsonArray);
	               }
	           }   
	       members.add("members", jsonArray);
	       //System.out.println(members);
	       return members.toString();
	   }
	
	
	@RequestMapping(value = "/report", method = RequestMethod.GET) // 신고화면 넘어가는 page
	public String goReportPage () {
		return "admin/report";
	}
	
	@RequestMapping(value = "/statistics", method = RequestMethod.GET) // 통계화면 넘어가는 page
	public String goStatisticsPage () {
		return "admin/visitSt";
	}
	
	@RequestMapping(value = "/visitSt", method = RequestMethod.GET) // 통계화면 넘어가는 page
	public String visitSt() {
		return "admin/visitSt";
	}
	@RequestMapping(value = "/memberSt", method = RequestMethod.GET) // 통계화면 넘어가는 page
	public String memberSt() {
		return "admin/memberSt";
	}
	@RequestMapping(value = "/factorSt", method = RequestMethod.GET) // 통계화면 넘어가는 page
	public String factorSt() {
		return "admin/factorSt";
	}
	@RequestMapping(value = "/searchlogSt", method = RequestMethod.GET) // 통계화면 넘어가는 page
	public String searchlogSt() {
		return "admin/searchlogSt";
	}


}
