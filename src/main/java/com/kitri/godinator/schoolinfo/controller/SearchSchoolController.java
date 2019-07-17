package com.kitri.godinator.schoolinfo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.service.SearchSchoolService;

@Controller
@RequestMapping("/searchschool")
public class SearchSchoolController {
	
	@Autowired
	private SearchSchoolService searchSchoolService;
	
	@RequestMapping(value = "/viewsearch", method = RequestMethod.GET)
	public String viewSearchSchool(Model model, HttpSession httpSession) {
		
		MemberDto memberDto = (MemberDto) httpSession.getAttribute("userInfo");
		
		if(memberDto != null) {
			System.out.println(memberDto.getUserId());
			Map<String, String> map = searchSchoolService.getUserPrefer(memberDto.getUserId());
			System.out.println(map);
			String userId = memberDto.getUserId();
			System.out.println(userId);
//			System.out.println(!"0".equals(map.get("H")));
			if(map != null) {
				if(!"0".equals(map.get("H"))) {
					List<HSchoolDto> hRecomList = searchSchoolService.getHRecomSchool(userId);
					model.addAttribute("hRecomList", hRecomList);
					System.out.println(hRecomList);
				} 
				if(!"0".equals(map.get("U"))) {
					List<USchoolDto> uRecomList = searchSchoolService.getURecomSchool(userId);
					model.addAttribute("uRecomList", uRecomList);
					System.out.println(uRecomList);
				}
			}
		}
		List<HSchoolDto> hSchoolList = searchSchoolService.getHSchoolList();
		List<USchoolDto> uSchoolList = searchSchoolService.getUSchoolList();
		
		model.addAttribute("hSchoolList", hSchoolList);
		model.addAttribute("uSchoolList", uSchoolList);
		return "/schoolinfo/searchschool";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public String searchSchool(@RequestParam Map<String, Object> parameter) {
		System.out.println("search parameter : " + parameter);
		return searchSchoolService.getSchoolsGroupByType(parameter);
	}
}