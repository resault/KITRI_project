package com.kitri.godinator.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.admin.service.MemberService;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	HSchoolDto HSchoolDto;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/view")
	public String viewMember() {
		return "admin/member";
	}
	@RequestMapping("/main")
	public String goMain() {
		return "admin/adminmain";
	}
	
	   @RequestMapping(value = "/list", method = RequestMethod.GET) // 검색할 때 들어오는건가
	   @ResponseBody
	   public String allMember (@RequestParam Map<String, String> parameter, Model model) throws Exception {
		   JsonObject members = new JsonObject();
	       JsonArray jsonArray = new JsonArray();
		   
	       String keyword = parameter.get("keyword");
	       String status = "";
	       String i1 = "";
	       String i2;
	       
	       System.out.println("> 초기 페이지 init : " + keyword);
	       
	       int result = memberService.countAllMembers(keyword); // 총 멤버수
	       int result2 = memberService.countAllMentors(); // 총 멘토수
	       members.addProperty("result", result);
	       members.addProperty("result2", result2);
	       
	       List<MemberDto> mlist = memberService.viewAll(keyword);
	       for(Object obj : mlist) {
	            if(obj != null) {
	                   JsonObject member = new JsonObject();
	                   
	                   //user_id, user_name, h_school_code, u_school_code, user_cate, join_date
	                   String userId = ((MemberDto)obj).getUserId();
	                   String userName = ((MemberDto)obj).getUserName();
	                   String hSchoolCode = ((MemberDto)obj).getHSchoolCode();
	                   String uSchoolCode = ((MemberDto)obj).getUSchoolCode();
	                   String userCate = ((MemberDto)obj).getUserCate();
	                   String joinDate = ((MemberDto)obj).getJoinDate();
	                   String temp = ((MemberDto)obj).getTemp();

	                   /** userCate 변경 **/
	                   if(userCate.equals("s"))  // 학생
	                	   status = "학생";
	                    else if (userCate.equals("p")) // 학부모
	                	   status = "학부모";
				/*
				 * if(temp.equals("r")) { // 멘토요청 보낸 이들 i1 =
				 * "<td><input type='button' id='mentoConfirm' value='멘토승인'>"; //i2 = "html()";
				 * }else { i1 = "<td>"; //i2 = "html('')"; }
				 */
	                   
	                  /** 학교 이름 GET **/
	                   //List<HSchoolDto> name = memberService.getHSchoolName(hSchoolCode);
	                   //System.out.println("각자코드?" + hSchoolCode);
	               	
	                   ////
	                   member.addProperty("userId", userId);
	                   member.addProperty("userName", userName);
	                   member.addProperty("hSchoolCode", hSchoolCode);
	                   member.addProperty("uSchoolCode", uSchoolCode);
	                   member.addProperty("userCate", status);
	                   member.addProperty("joinDate", joinDate);
	                   member.addProperty("temp", temp);
	                   //member.addProperty("i2", i2);
	                   
	                   jsonArray.add(member);
	               }
	           }   
	       members.add("members", jsonArray);
	       System.out.println(members);
	       return members.toString();
	   }
	   
	   @RequestMapping(value = "/mentor", method = RequestMethod.GET)
		public void changeMentor(@RequestParam Map<String, String> parameter) {
		   String id = parameter.get("memberid");
		   System.out.println("> 멘토로 바꿀 ID : "+ id);
		   
		   memberService.setMentor(id);
		   //return "admin/member";
		}   
	   
	   @RequestMapping(value = "/goModify", method = RequestMethod.GET) 
	   public String goModify (@RequestParam Map<String, String> parameter, Model model) throws Exception {
		   String memberid = parameter.get("memberid");
		   System.out.println("> " +memberid + " 넘어옴");
		   
		   // 이름, 회원구분, 고등학교, 대학교, 연락처(합), 주소(합), 가입일
		   
		   List<MemberDto> hlist = memberService.viewMoreInfo(memberid);
		   for(Object h : hlist) {
	           if(h != null) {
	               
	               String userId = ((MemberDto)h).getUserId();
	               String userName = ((MemberDto)h).getUserName();
	               String userCate = ((MemberDto)h).getUserCate();
	               String hSchoolCode = ((MemberDto)h).getHSchoolCode();
	               String uSchoolCode = ((MemberDto)h).getUSchoolCode();
	               String email = ((MemberDto)h).getEmail();
	               String phone1 = ((MemberDto)h).getPhone1();
	               String address = ((MemberDto)h).getAddress();
	               String joinDate = ((MemberDto)h).getJoinDate();
	               
	               model.addAttribute("userId", userId);
	               model.addAttribute("userName",userName);
	               model.addAttribute("userCate",userCate);
	               model.addAttribute("hSchoolCode",hSchoolCode);
	               model.addAttribute("uSchoolCode",uSchoolCode);
	               
	               model.addAttribute("phone1",phone1);
	               model.addAttribute("email",email);
	               model.addAttribute("address",address);
	               model.addAttribute("joinDate",joinDate);
	               
	               System.out.println("	> 멤버관리로 넘어가서 불러온 DB : " + model);
	           }
	       }    
		   
		   return "admin/managemember";
	   }
	   
	   @RequestMapping(value = "/delete", method = RequestMethod.GET)
	   public String deleteInfo (@RequestParam Map<String, String> parameter, Model model) throws Exception {
		   String userid = parameter.get("userid");
		   System.out.println("	> 학교정보 DB삭제 위한 Controller 입성 : " + userid);
		   
		   memberService.deleteInfo(userid); // 멘토아닐경우 먹힘
		   
		   // 멤토인경우도 할 것 > if문
		   
		   memberService.deleteInfo_child(userid); // 멘토인사람은 자식이 있어서 자식테이블 먼저 지워야함
		   return "삭제가 완료되었습니다.";
	   }
	   
	   @RequestMapping(value = "/board", method = RequestMethod.GET)
	   @ResponseBody
	   public String getBoardInfo (@RequestParam Map<String, String> parameter, Model model) throws Exception {
		   JsonObject boards = new JsonObject();
	       JsonArray jsonArray = new JsonArray();
		   
		   String userid = parameter.get("userid");
		   System.out.println("	> board!!");
		   
		   int cnt = memberService.countBoard(userid);
		   model.addAttribute("cnt", cnt);
		   
		   List<BoardDto> list = memberService.viewBoard(userid);
	       for(Object obj : list) {
	            if(obj != null) {
	                   JsonObject board = new JsonObject();
	                   
	                   //user_id, user_name, h_school_code, u_school_code, user_cate, join_date
	                   String date = ((BoardDto)obj).getbPostdate();
	                   String subject = ((BoardDto)obj).getBoardSubject();
	                   String content = ((BoardDto)obj).getBoardContent();

	                   board.addProperty("date", date);
	                   board.addProperty("subject", subject);
	                   board.addProperty("content", content);
	                   
	                   jsonArray.add(board);
	                   //System.out.println(jsonArray);
	               }
	           }   
	       boards.add("boards", jsonArray);
	       System.out.println(boards);
	       
	       return boards.toString();
	   }
	   

	private void getSchoolName(String hSchoolCode) {
		List<HSchoolDto> name = memberService.getHSchoolName(hSchoolCode);
    	
    	for(Object obj : name) {
            if(obj != null) {
                   JsonObject member = new JsonObject();
                   String highname = ((HSchoolDto)obj).getSchoolName();
                   System.out.println("제발 나와라...."+highname);
            }}
		}
	   
}
