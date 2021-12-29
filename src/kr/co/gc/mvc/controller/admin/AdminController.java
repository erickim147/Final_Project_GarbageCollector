package kr.co.gc.mvc.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/adminPage") 
	public String adminPage() {
		return "admin/adminPage";
	}
	
	
}
