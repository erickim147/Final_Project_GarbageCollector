package kr.co.gc.mvc.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gc.mvc.dao.AinfoDaoInter_gc;
import kr.co.gc.mvc.dao.MainDataDaoInter;
import kr.co.gc.mvc.dao.PloggingDaoInter;
import kr.co.gc.mvc.dto.AinfoVO_gc;
import kr.co.gc.mvc.dto.MyEmblemVO;

@Controller
public class DefaultController {
	
	@Autowired
	private AinfoDaoInter_gc ainfoDaoInter;
	@Autowired
	private PloggingDaoInter ploggingDaoInter;
	@Autowired
	private MainDataDaoInter mainDataDaoInter;
	
	@RequestMapping("/")
	public String defaultUrl(HttpSession session, Model m) {
		// 현재 날짜 구하기 
		LocalDate now = LocalDate.now();
		List<AinfoVO_gc> avoVlist = ainfoDaoInter.todayVolunteer(now.toString());
		List<AinfoVO_gc> avoDlist = ainfoDaoInter.todayDistance(now.toString());
		MyEmblemVO evoV = ploggingDaoInter.callEmb(avoVlist.get(0).getPluserId());
		MyEmblemVO evoD = ploggingDaoInter.callEmb(avoDlist.get(0).getPluserId());
		int tm = mainDataDaoInter.teamTotal();
		String id = (String) session.getAttribute("sessionID");
		if ( id != null) {
			if (tm >= 10000) {
				int chk = mainDataDaoInter.checkTeam(id);
				if (chk == 1) {
					mainDataDaoInter.upTeamEmb(id);
				}
			}
		}
		m.addAttribute("avoV", avoVlist.get(0));
		m.addAttribute("avoD", avoDlist.get(0));
		m.addAttribute("evoV", evoV);
		m.addAttribute("evoD", evoD);
		m.addAttribute("maindistance", ainfoDaoInter.maindistance());
		m.addAttribute("tm", tm);
		return "main/main";
	}
	
	// analytics start
	@RequestMapping("/myInfomation")                   
	public String myInfomation(Model m, HttpSession session) {
		List<AinfoVO_gc> list = ainfoDaoInter.listAInfo((String)session.getAttribute("sessionID"));
		int count = 1;
		for(AinfoVO_gc e : list) {
			e.setPlno(count);
			count++;
		}
		m.addAttribute("list", list);
		return "analytics/myInfomation";
	}
	@RequestMapping("/rankingList")
	public String rankingList() {
		return "analytics/rankingList";
	}
	// analytics end
	
	// board start
//	@RequestMapping("/boardList")
//	public String boardList() {
//		return "board/boardList";
//	}
	// board end
	
	//login start
//	@RequestMapping("/loginForm")
//	public String loginForm() {
//		return "login/loginForm";
//	}
	//login end
	
	//news start
	@RequestMapping("/newsPage")
	public String newsPage() {
		return "news/newsPage";
	}
	//news end
	
//	//schedule start
//	@RequestMapping("/schedule")
//	public String schedule() {
//		return "schedule/schedule";
//	}
	//schedule end
		
	//user start
//	@RequestMapping("/memberJoin")
//	public String memberJoin() {
//		return "user/memberJoin";
//	}
//	@RequestMapping("/userPage")
//	public String userPage() {
//		return "member/userPage";
//	}
	//user end
	@RequestMapping("/chartData")
	@ResponseBody
	public Map<String, List<List<Object>>> chartData(@RequestParam(value="paramList[]") List<String> paramList){
		Map<String, List<List<Object>>> resMap = new LinkedHashMap<String, List<List<Object>>>();
		List<List<Object>> ploggingList = new ArrayList<List<Object>>();
		List<List<Object>> trashList = new ArrayList<List<Object>>();
		int count = 0;
		for(String e : paramList) {
			if(count == 0) {
				List<Object> titleList1 = new ArrayList<Object>();
				List<Object> titleList2 = new ArrayList<Object>();
				titleList1.add("날짜");
				titleList1.add("운동");
				titleList1.add("플로깅");
				titleList2.add("날짜");
				titleList2.add("수거된 쓰레기량");
				ploggingList.add(titleList1);
				trashList.add(titleList2);
			}
			int pDistance = 0;
			int eDistance = 0;
			int tPick = 0;
			List<Object> resList1 = new ArrayList<Object>();
			List<Object> resList2 = new ArrayList<Object>();
			List<Integer> pList = ainfoDaoInter.ploggingDistance(e);
			List<Integer> eList = ainfoDaoInter.exerciseDistance(e);
			List<Integer> tList = ainfoDaoInter.totalTrash(e);
			for(int i=0; i<pList.size(); i++) pDistance = pDistance+pList.get(i);
			for(int i=0; i<eList.size(); i++) eDistance = eDistance+eList.get(i);
			for(int i=0; i<tList.size(); i++) {
				tPick = tPick+tList.get(i);
			}
			resList1.add(e);
			resList1.add(pDistance);
			resList1.add(eDistance);
			resList2.add(e);
			resList2.add(tPick);
			ploggingList.add(resList1);
			trashList.add(resList2);
			count++;
		}
		resMap.put("chart1", ploggingList);
		resMap.put("chart2", trashList);
		
		return resMap; 
	}
	
}
