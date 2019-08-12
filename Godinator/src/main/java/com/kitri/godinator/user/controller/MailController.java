package com.kitri.godinator.user.controller;

import java.util.Random;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.user.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
    
	@Autowired
	private MailService mailService;
	
    // 회원가입 이메일 인증
    @RequestMapping(value = "/sendMail/auth", method = RequestMethod.POST, produces = "application/json")
    //@ResponseBody
    public String sendMailAuth(HttpSession session, @RequestParam String email, Model model) {
    	System.out.println("이메일 인증 controller");
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "[고디네이터] 회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("고디네이터 회원가입 인증코드 안내입니다.<br>");
        sb.append("아래코드를 입력해 주세요.<br><br>");
        sb.append("귀하의 인증 코드는 [ " + joinCode + " ] 입니다.");
        
        boolean flag = mailService.send(subject, sb.toString(), "godinator22@gmail.com", email, null);
        
        if(flag==true) {
        	model.addAttribute("email",email);
        	return "user/authentication";
        }else {
        	return "error";
        }
    }
    
    @RequestMapping(value = "/sendMail/check", method = RequestMethod.POST, produces = "application/json")
    //@ResponseBody
    public String sendMailCheck(HttpSession session, @RequestParam("authenCode") String authenCode, 
    							@RequestParam("email") String email, Model model) {
    	System.out.println("이메일 체크 controller");
    	System.out.println(email);
      String joinCode = (String)session.getAttribute("joinCode");
      
     
      
     String[] values = email.split("@");
      
      String emailStr = values[0];
      String emailDomain = values[1];
      System.out.println("emailStr :" + emailStr);
      System.out.println("emailDomain :" + emailDomain);
      
      
      if(authenCode.equals(joinCode)) {
    	  model.addAttribute("emailStr",emailStr);
    	  model.addAttribute("emailDomain",emailDomain);
    	  return "user/register_1";
      }else {
    	  return "error";
      }
    	
    	
    	
    	
    }
 
   
 
   
    }

