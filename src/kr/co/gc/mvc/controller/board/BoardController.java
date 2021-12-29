package kr.co.gc.mvc.controller.board;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.gc.mvc.dao.BoardDaoInter;
import kr.co.gc.mvc.dto.BoardSubVO;
import kr.co.gc.mvc.dto.BoardVO;
import kr.co.gc.mvc.dto.PageVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDaoInter mBoardDaoInter;
	
	@RequestMapping("/boardList")
	public String mBoardList(Model m, BoardVO bvo, String nowPage, String cntPerPage, HttpServletRequest request) {
		int spage=1;
		if(nowPage != null && !nowPage.equals("")) {
			spage = Integer.parseInt(nowPage);
		}
		if(cntPerPage == null) {
			cntPerPage ="10";
		}
		String ex_select = request.getParameter("ex_select");
		String searchValue = request.getParameter("searchValue");
		bvo.setEx_select(ex_select);
		bvo.setSearchValue(searchValue);
		int total = mBoardDaoInter.getTotalCount1();
		PageVO pvo = new PageVO(total, spage, Integer.parseInt(cntPerPage));
		pvo.setEx_select(ex_select);
		pvo.setSearchValue(searchValue);
		m.addAttribute("paging", pvo);
		List<BoardVO> list = mBoardDaoInter.list(pvo);
		m.addAttribute("list", list);
		m.addAttribute("ex_select", ex_select);
		m.addAttribute("searchValue", searchValue);
		m.addAttribute("count", total);
		return "board/boardList";
	}

	@RequestMapping("/write")
	public String iploging() {
		return "board/iploging";
	}

	@RequestMapping("/boardInsert")
	public String mBoardInsert(BoardVO vo) {
		mBoardDaoInter.insert(vo);
		return "redirect:/boardList";
	}

	@RequestMapping("/boardDetail")
	public String mBoardInfo(int no, Model m) {
		System.out.println("no:" + no); 
		mBoardDaoInter.hit(no);
		BoardVO vo = mBoardDaoInter.detail(no);
		List<BoardSubVO> svo = mBoardDaoInter.srec(no);
		m.addAttribute("svo",svo);
		System.out.println(svo);
		m.addAttribute("vo", vo);
		return "board/dploging";
	}
	@RequestMapping("/modify")
	public String modify(Model m,int no) {
		BoardVO vo = mBoardDaoInter.mview(no);
		m.addAttribute("vo",vo);
		return "board/mploging";
	}

	
	@PostMapping("/updateForm")
	public String updateForm(BoardVO vo) {
		System.out.println(vo.getBno());
		mBoardDaoInter.update(vo);
		return "redirect:/boardList";
	}
	
	@RequestMapping("/delete")
	public String delete(int no){
		mBoardDaoInter.del(no);
		return "redirect:/boardList";
	}
	
	@RequestMapping("/app")
	public String app(int no, String id) {
		BoardSubVO vo = new BoardSubVO();

		vo.setSno(no);

		vo.setSrec(id);

		mBoardDaoInter.app(no);

		mBoardDaoInter.sinsert(vo);

		return "redirect:/boardList";
	}
	
	@RequestMapping("/search")
	public String searchList(Model m, BoardVO bvo, String nowPage, String cntPerPage, HttpServletRequest request) {
		int spage=1;
		if(nowPage != null && !nowPage.equals("")) {
			spage = Integer.parseInt(nowPage);
		}
		if(cntPerPage == null) {
			cntPerPage ="10";
		}
		String ex_select = request.getParameter("ex_select");
		String searchValue = request.getParameter("searchValue");
		bvo.setEx_select(ex_select);
		bvo.setSearchValue(searchValue);
		int total = mBoardDaoInter.getTotalCount(bvo);
		System.out.println(total);
		System.out.println(searchValue);
		System.out.println(ex_select);
		PageVO pvo = new PageVO(total, spage, Integer.parseInt(cntPerPage));
		pvo.setEx_select(ex_select);
		pvo.setSearchValue(searchValue);
		m.addAttribute("paging", pvo);
		List<BoardVO> list = mBoardDaoInter.searchList(pvo);
		m.addAttribute("ex_select", ex_select);
		m.addAttribute("searchValue", searchValue);
		m.addAttribute("list", list);
		m.addAttribute("count", total);
		return "board/boardList";
	}

	@RequestMapping("/schedule")
	public String mBoardList(Model m, BoardVO bvo, HttpServletRequest request) {
		List<BoardVO> vo = mBoardDaoInter.plist();
		List<String> addrList = new ArrayList<String>();
		for(int i=0; i<vo.size(); i++) {
			addrList.add(vo.get(i).getBplace());
		}
		List<Integer> nList = new ArrayList<Integer>();
		for(int j=0; j<vo.size(); j++ ) {
			nList.add(vo.get(j).getBno());
		}
		String snList = "["; for(int sn : nList) { snList+="'"; snList+=sn;
		snList+="'"; snList+=","; }
		snList=snList.substring(0,snList.length()-1); snList+="]";
		
		String strList = "["; for(String str : addrList) { strList+="'"; strList+=str;
		strList+="'"; strList+=","; }
		strList=strList.substring(0,strList.length()-1); strList+="]";
		m.addAttribute("vo",vo);
		m.addAttribute("strList",strList);
		m.addAttribute("nList",nList);
		return "schedule/schedule";
	}
	
	@RequestMapping("/can")
	public String can(int sno,String srec) {
		BoardSubVO svo = new BoardSubVO();
		mBoardDaoInter.can(sno);
		svo.setSno(sno);
		svo.setSrec(srec);
		mBoardDaoInter.cdel(svo);
		return "redirect:/boardList";
	}
	



}
