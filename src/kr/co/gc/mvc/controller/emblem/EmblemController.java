package kr.co.gc.mvc.controller.emblem;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gc.mvc.dao.PloggingDaoInter;
import kr.co.gc.mvc.dto.EmblemUpdateVO;
import kr.co.gc.mvc.dto.MemberVO;
import kr.co.gc.mvc.dto.MyEmblemVO;
import kr.co.gc.mvc.dto.PloggingVO;
import kr.co.gc.mvc.dto.SumVO;

@Controller
public class EmblemController {
	
	@Autowired
	private PloggingDaoInter ploggingDaoInter; 
	
	@RequestMapping("/myEmblem")
	public String myEmblem(Model m, EmblemUpdateVO uvo, HttpSession session) {
		String id = (String) session.getAttribute("sessionID");
		MyEmblemVO evo = ploggingDaoInter.callEmb(id);
		m.addAttribute("evo", evo);
		return "user/emblem";
	}
}
