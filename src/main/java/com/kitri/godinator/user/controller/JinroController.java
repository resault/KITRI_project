package com.kitri.godinator.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jinro")
public class JinroController {
	
	@RequestMapping("/geomsa")
	public String viewMember() {
		return "admin/jinrogeomsa";
	}

}
