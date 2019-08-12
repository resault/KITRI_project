package com.kitri.godinator.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
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
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;


@Controller
@RequestMapping("/school")
public class SchoolController {

   @Autowired
   private SchoolService schoolService;
   
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String mainMember () {
      return "admin/school";
   }
   
   @RequestMapping(value = "/list", method = RequestMethod.GET) // 검색할 때 들어오는건가
   @ResponseBody
   public String allMember (@RequestParam Map<String, String> parameter) throws Exception {
	   JsonObject schoolNames = new JsonObject();
       JsonArray jsonArray = new JsonArray();
	   
	   String category = parameter.get("category");
       String keyword = parameter.get("keyword");
       
       System.out.println("> 초기 페이지 init : " + keyword);
       	
       List<HSchoolDto> hlist = schoolService.viewAll(keyword);
       for(Object h : hlist) {
               if(h != null) {
                   JsonObject school = new JsonObject();
                   String schoolCate1 = ((HSchoolDto)h).getSchoolCate1();
                   String schoolName = ((HSchoolDto)h).getSchoolName();
                   String phone = ((HSchoolDto)h).getPhone();
                   String schoolAddress = ((HSchoolDto)h).getAddress() + " "+ ((HSchoolDto)h).getAddressDetail();
                   
                   
                   school.addProperty("schoolCate1", schoolCate1);
                   school.addProperty("schoolName", schoolName);
                   school.addProperty("phone", phone);
                   school.addProperty("schoolAddress", schoolAddress);
                   
                   jsonArray.add(school); // jsonArray는 model에 넣지 x
                   //System.out.println("(all) 검색된 school 결과 : " + school);
               }
           }    
       schoolNames.add("schoolNames", jsonArray);
       return schoolNames.toString();
   }
   
   @RequestMapping(value = "/searchlist", method = RequestMethod.GET) // 검색할 때 들어오는건가
   @ResponseBody
   public String searchMember (@RequestParam Map<String, String> parameter, Model model) throws Exception {
       System.out.println("> 파라미터 ok : " + parameter);
       //System.out.println("> 파라미터 ok : " + parameter.get("category") + "/" + parameter.get("keyword"));
       
        JsonObject schoolNames = new JsonObject();
        JsonArray jsonArray = new JsonArray();
        
        String category = parameter.get("category");
        String keyword = parameter.get("keyword");
        
        if(category != null && "name".equals(category)) { // 카테고리 학교명인 경우
             List<HSchoolDto> hlist = schoolService.searchSchool(parameter);
                for(Object h : hlist) {
                    if(h != null) {
                        JsonObject school = new JsonObject();
                        String schoolCate1 = ((HSchoolDto)h).getSchoolCate1();
                        String schoolName = ((HSchoolDto)h).getSchoolName();
                        String phone = ((HSchoolDto)h).getPhone();
                        String schoolAddress = ((HSchoolDto)h).getAddress() + " "+ ((HSchoolDto)h).getAddressDetail();
                        
                        school.addProperty("schoolCate1", schoolCate1);
                        school.addProperty("schoolName", schoolName);
                        school.addProperty("phone", phone);
                        school.addProperty("schoolAddress", schoolAddress);
                        
                        jsonArray.add(school); // jsonArray는 model에 넣지 x
                        System.out.println("> 검색된 school 결과(1) : " + school);
                    }
                }    
            schoolNames.add("schoolNames", jsonArray);
            return schoolNames.toString();
            
        } else if(category != null && "region".equals(category)) {
            // 카테고리 지역인 경우
            List<HSchoolDto> hlist = schoolService.searchRegion(parameter);
            for(Object h : hlist) {
                if(h != null) {
                    JsonObject school = new JsonObject();
                    String schoolCate1 = ((HSchoolDto)h).getSchoolCate1();
                    String schoolName = ((HSchoolDto)h).getSchoolName();
                    String phone = ((HSchoolDto)h).getPhone();
                    String schoolAddress = ((HSchoolDto)h).getAddress() + " "+ ((HSchoolDto)h).getAddressDetail();
                    
                    school.addProperty("schoolCate1", schoolCate1);
                    school.addProperty("schoolName", schoolName);
                    school.addProperty("phone", phone);
                    school.addProperty("schoolAddress", schoolAddress);
                    
                    jsonArray.add(school);
                    System.out.println("> 검색된 school 결과(2) : " + school);
                    
//                    model.addAttribute("list", school);
//                    System.out.println("이건 모델이야 "+ model);
                }
            }    
        schoolNames.add("schoolNames", jsonArray);
        
        return schoolNames.toString();
        
        } 
        return "";
   }
   
   @RequestMapping(value = "/modify", method = RequestMethod.GET) // 검색할 때 들어오는건가
   public String modify (@RequestParam Map<String, String> parameter, HSchoolDto dto) throws Exception {
	   System.out.println("	> 학교정보 DB수정을 위한 Controller 입성 : " + parameter);
	   
	   String schoolCode = parameter.get("schoolCode");
	   String schoolName = parameter.get("schoolName");
	   String schoolCate = parameter.get("schoolCate");
	   String homePage = parameter.get("homePage");
	   String phone = parameter.get("phone");
	   String zipcode = parameter.get("zipcode");
	   String address = parameter.get("address");
	   String addressDetail = parameter.get("addressDetail");
	   
	   // 이걸 dto에 넣어서 dto째로 갖고 다니기
	   dto.setSchoolCode(schoolCode);
	   dto.setSchoolName(schoolName);
	   dto.setSchoolCate1(schoolCate);
	   dto.setHomePage(homePage);
	   dto.setPhone(phone);
	   dto.setZipcode(zipcode);
	   dto.setAddress(address);
	   dto.setAddressDetail(addressDetail);
	   
	   schoolService.modifyInfo(dto);
	   
	   HSchoolDto h = new HSchoolDto();
	   System.out.println("	> DB 수정 완료 :" + h);
	   
	   return "";
   }
   
   
   @RequestMapping(value = "/goModify", method = RequestMethod.GET) 
   public String goModify (@RequestParam Map<String, String> parameter, Model model) throws Exception {
	   String schoolCate = parameter.get("schoolCate");
	   String schoolName = parameter.get("schoolName");
	   String phone = parameter.get("phone");
	   String schoolAddress = parameter.get("schoolAddress");
	   //String mento = parameter.get("mento");
	   
	   // 더 필요한 정보 학교코드, address1,2, zipcode, email
	   // schoolCode, address, addressDetail, homePage, zipcode
	   List<HSchoolDto> hlist = schoolService.viewMoreInfo(schoolName);
	   for(Object h : hlist) {
           if(h != null) {
               
               String schoolCode = ((HSchoolDto)h).getSchoolCode();
               String address = ((HSchoolDto)h).getAddress();
               String addressDetail = ((HSchoolDto)h).getAddressDetail();
               String homePage = ((HSchoolDto)h).getHomePage();
               String zipcode = ((HSchoolDto)h).getZipcode();
               
               model.addAttribute("schoolCode", schoolCode);
               model.addAttribute("address",address);
               model.addAttribute("addressDetail",addressDetail);
               model.addAttribute("homePage",homePage);
               model.addAttribute("zipcode",zipcode);
               
               System.out.println("	> 학교수정으로 넘어가서 불러온 DB : " + model);
           }
       }    
	   
	   model.addAttribute("schoolCate",schoolCate);
	   model.addAttribute("schoolName",schoolName);
	   model.addAttribute("phone",phone);
	   
	   return "admin/manageschool";
   }
   
   // 학교삭제
   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String deleteInfo (@RequestParam Map<String, String> parameter, Model model) throws Exception {
	   String schoolCode = parameter.get("schoolCode");
	   System.out.println("	> 학교정보 DB삭제 위한 Controller 입성 : " + schoolCode);
	   
	   schoolService.deleteInfo(schoolCode);
	   
	   return "삭제가 완료되었습니다.";
   }
   
   @RequestMapping(value = "/mentoInfo", method = RequestMethod.GET)
   @ResponseBody
   public String getMentoInfo (@RequestParam (name = "schoolCode") String schoolCode, Model model) throws Exception {
	   JsonObject mentoInfos = new JsonObject();
       JsonArray jsonArray = new JsonArray();
	   
	   System.out.println("	> 멘토정보를 얻어올 학교 코드 : " + schoolCode);
	   
	   List<MemberDto> list = schoolService.getMentoInfo(schoolCode);
	   for(Object h : list) {
           if(h != null) {
        	   JsonObject mentoInfo = new JsonObject();
               String userId = ((MemberDto)h).getUserId();
               String userName = ((MemberDto)h).getUserName();
               String userCate = ((MemberDto)h).getUserCate();
               String joinDate = ((MemberDto)h).getJoinDate();
               
               if(joinDate != null) {
               mentoInfo.addProperty("userId", userId);
               mentoInfo.addProperty("userName", userName);
               mentoInfo.addProperty("userCate", userCate);
               mentoInfo.addProperty("joinDate", joinDate);
               
               jsonArray.add(mentoInfo);
               //System.out.println("	> 해당학교 멘토list : " + jsonArray);
               }
           }
       }  
	   mentoInfos.add("mentoInfos", jsonArray);
	   System.out.println(mentoInfos);
       return mentoInfos.toString();
   }
}