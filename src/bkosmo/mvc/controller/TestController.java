package bkosmo.mvc.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bkosmo.mvc.dao.AinfoDaoInter;
import bkosmo.mvc.dao.PloggingDaoInter;
import bkosmo.mvc.dto.AinfoVO;
import bkosmo.mvc.dto.EmblemUpdateVO;
import bkosmo.mvc.dto.MemberVO;
import bkosmo.mvc.dto.MyEmblemVO;
import bkosmo.mvc.dto.SumVO;

@Controller
public class TestController {

	@Autowired
	private AinfoDaoInter ainfoDaoInter;
	
	@Autowired
	private PloggingDaoInter ploggingDaoInter;

	
	@RequestMapping("/qrpage_origin")
	public String qrpage_origin() {
		return "qrpage_origin";
	}
	
	@RequestMapping("/mobileStart")
	public String mobileStart() {
		return "mobileStart";
	}

	@RequestMapping("/result")            // result ∆‰¿Ã¡ˆ∑Œ ¿Ãµø
	public String result(Model m) {
		List<AinfoVO> list = ainfoDaoInter.listAInfo();         // DB¿« ∞™ ∏ÆΩ∫∆Æ∑Œ ∫“∑Øø»
		m.addAttribute("list", list);
		return "result";
	}

	@RequestMapping("/index_origin")
	public String mobilestart() {
		return "index_origin";
	}
	
	@RequestMapping("/info")
	public String info(HttpSession session, AinfoVO vo, MyEmblemVO evo, MemberVO mvo, EmblemUpdateVO uvo, Model m) {
		// insert AinfoVO
		if(vo.getPltrashpick() > 0) {
			vo.setPlstatus("y");
		} else {
			vo.setPlstatus("n");
		}
		String id = (String)session.getAttribute("sessionID");
		vo.setPluserId(id);
		ainfoDaoInter.addainfo(vo); 
		// ==================================================
		evo = ploggingDaoInter.callEmb(id);
		mvo = ploggingDaoInter.memberInfo(id);
		/* ∞Ê«Ëƒ° */
		int d = vo.getPldistance();
		int exp1 = (d/1000)+1;
		int exp2;
		String p = vo.getPlstatus();
		if (p == "y") {
			exp2 = 5;
		}else {
			exp2 = 0;
		}
		int exp = exp1 + exp2;
		System.out.println(exp);
		mvo.setMid(id);
		System.out.println(mvo.getMid());
		mvo.setMexp(exp);
		System.out.println(mvo.getMexp());
		ploggingDaoInter.upMexp(mvo);
		
		/* ¥ﬁ∏∞∞≈∏Æ/«√∑Œ±Î »Ωºˆ «’ */
		uvo.setId(id);
		SumVO svo = ploggingDaoInter.sum(id);
		int sg = svo.getSumgeori();
		System.out.println("sg:"+sg);
		int sp = svo.getSumpstatus();
		System.out.println("sp:"+sp);
		
		/* ¥ﬁ∏Æ±‚ ø•∫Ì∑≥ µÓ±ﬁ */
		String se1 = evo.getSoloemb();
		String se2;
		if(sg < 10000) {
			se2 = "N";
		}else if(sg < 40000) {
			se2 = "B";
		}else if(sg < 100000) {
			se2 = "S";
		}else {
			se2 = "G";
		}
		if(!(se1.equals(se2))) {
			uvo.setSe2(se2);
			ploggingDaoInter.upSoloEmb(uvo);
			System.out.println(se2+"ø•∫Ì∑≥ »πµÊ!");
		}else {
			System.out.println("pass");
		}
		
		/* ºˆ¡§  - «√∑Œ±Î ¬¸ø© ø•∫Ì∑≥ µÓ±ﬁ */
		String pe1 = evo.getPloggingemb();
		System.out.println("pe1:"+pe1);
		String pe2;	
		
		if(sp < 3) {
			pe2 = "N";
		}else if(sp < 9 ) {
			pe2 = "B";
		}else if(sp < 15) {
			pe2 = "S";
		}else {
			pe2 = "G";
		}
		if(!(pe1.equals(pe2))) {
			uvo.setPe2(pe2);
			ploggingDaoInter.upPloggingEmb(uvo);
			System.out.println(pe2+"ø•∫Ì∑≥ »πµÊ!");
		}
		
		MyEmblemVO evo2 = ploggingDaoInter.callEmb(id);
		return "redirect:result";
	}

}
