package com.kitri.godinator.mentor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.mentor.service.MentorPageNaviDto;
import com.kitri.godinator.mentor.service.MentorService;
import com.kitri.godinator.model.EditDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorInfoDto;

@Controller
@RequestMapping("/mentor")
public class MentorController {
	
	@Autowired
	private MentorService mentorService;
	
	// #### 권한확인 ####
	@RequestMapping("/checkAuth")
	public @ResponseBody String checkAuth(HttpSession session) {
		String result = "-1";
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo"); 
		if(memberDto != null) {
			String id = memberDto.getUserId();
			int cnt = mentorService.checkAuth(id);
			result = cnt + "";
		}
		return result;
	}
	
	// #### 멘토 목록 ####
	@RequestMapping("/findmentor")
	public String getMentor(@RequestParam Map<String, String> parameter, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		
		if(memberDto != null) {
			String userId = memberDto.getUserId();
			
			String schoolCate1 = ((parameter.get("schoolCate1") != null) ? parameter.get("schoolCate1").toString() : "h");
			String hcate2 = ((parameter.get("hcate2") != null) ? parameter.get("hcate2").toString() : "0");
			String ucate2 = ((parameter.get("ucate2") != null) ? parameter.get("ucate2").toString() : "0");
			String schoolCate3 = ((parameter.get("schoolCate3") != null && parameter.get("schoolCate3") != "") ? parameter.get("schoolCate3").toString() : "0");
			
			parameter.put("pageSize", "5");
			parameter.put("articleSize", "10");
			parameter.put("userId", userId);
			parameter.put("schoolCate1", schoolCate1);
			parameter.put("hcate2", hcate2);
			parameter.put("ucate2", ucate2);
			parameter.put("schoolCate3", schoolCate3);
			
			List<MentorInfoDto> list = mentorService.getMentor(parameter);
			
			// 페이지 처리
			MentorPageNaviDto pageNavi = mentorService.getPageNavi(parameter);
			
			pageNavi.makeNavigator();
			
			model.addAttribute("parameter", parameter);
			model.addAttribute("list", list);
			model.addAttribute("pageNavi", pageNavi);
			
		}
		return "mentor/findmentor";
	}
	
}
