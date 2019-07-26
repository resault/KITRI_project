package com.kitri.godinator.mentor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.mentor.service.MentorPageNaviDto;
import com.kitri.godinator.mentor.service.MsgService;
import com.kitri.godinator.model.EditDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MsgDto;

@Controller
@RequestMapping("/msg")
public class MsgController {

	@Autowired
	private MsgService msgService;
	
	@RequestMapping(value = "/writemsg", method = RequestMethod.GET)
	public String writeMsg(@RequestParam String rcp, Model model) {
		model.addAttribute("rcp", rcp);
		return "mentor/writemsg";
	}

	@RequestMapping(value = "/writemsg", method = RequestMethod.POST)
	public @ResponseBody String writeMsg(@RequestParam Map<String, String> parameter, HttpSession session) {
		String result = "0";
		MemberDto userInfo = (MemberDto)session.getAttribute("userInfo");
		if(userInfo != null) {
			parameter.put("sendId", userInfo.getUserId());
			result = msgService.writeMsg(parameter);
		}
		
		return result;
	}

	@RequestMapping("/msgbox")
	public String msgBox(@RequestParam Map<String, String> parameter, Model model, HttpSession session) {
		MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
		if(userInfo != null) {
			String userId = userInfo.getUserId();
			String msgCate = ((parameter.get("msgCate") != null) ? parameter.get("msgCate").toString() : "0");
			String srcCate = ((parameter.get("srcCate") != null) ? parameter.get("srcCate").toString() : "0");
			
			parameter.put("pageSize", "5");
			parameter.put("articleSize", "10");
			parameter.put("userId", userId);
			parameter.put("msgCate", msgCate);
			parameter.put("srcCate", srcCate);
			
			List<MsgDto> list = msgService.getMsgList(parameter);
			
			// 페이지 처리
			MentorPageNaviDto pageNavi = msgService.getPageNavi(parameter);
			
			pageNavi.makeNavigator();
			
			model.addAttribute("parameter", parameter);
			model.addAttribute("list", list);
			model.addAttribute("navigator", pageNavi);
		}
		return "mentor/msgbox";
	}
	
	@RequestMapping("/viewmsg")
	public String viewMsg(@RequestParam Map<String, String> parameter, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			String userId = memberDto.getUserId();
			String seq = parameter.get("seq");
			MsgDto msgDto = msgService.getMsg(seq, userId);
			model.addAttribute("parameter", parameter);
			model.addAttribute("msg", msgDto);
		}
		return "mentor/viewmsg";
	}
	
	@RequestMapping("/trash")
	public @ResponseBody String mvTrash(@RequestParam(value = "seqArr") String[] seqArr, @RequestParam(value = "sendIdArr") String[] sendIdArr, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String result = "0";
		if(memberDto != null) {
			String userId = memberDto.getUserId();
			result = msgService.mvTrash(seqArr, sendIdArr, userId);
		}
		return result;
	}
	
	@RequestMapping("/delete")
	public @ResponseBody String delMsg(@RequestParam(value = "seqArr") String[] seqArr, @RequestParam(value = "sendIdArr") String[] sendIdArr, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String result = "0";
		if(memberDto != null) {
			String userId = memberDto.getUserId();
			result = msgService.delMsg(seqArr, sendIdArr, userId);
		}
		return result;
	}
	
	@RequestMapping("/restore")
	public @ResponseBody String restoreMsg(@RequestParam(value = "seqArr") String[] seqArr, @RequestParam(value = "sendIdArr") String[] sendIdArr, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String result = "0";
		if(memberDto != null) {
			String userId = memberDto.getUserId();
			result = msgService.restoreMsg(seqArr, sendIdArr, userId);
		}
		return result;
	}
	
	
}
