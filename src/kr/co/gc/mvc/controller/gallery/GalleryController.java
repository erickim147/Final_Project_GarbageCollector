package kr.co.gc.mvc.controller.gallery;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gc.mvc.dao.GalleryDaoInter;
import kr.co.gc.mvc.dto.GalleryDto;

@Controller
public class GalleryController {
	@Autowired
	private GalleryDaoInter galleryDaoInter; 
	
	@RequestMapping("/galleryList") 
	public String galleryList(Model m) {
		List<GalleryDto> list = galleryDaoInter.getlist();
		m.addAttribute("list",list);
		return "gallery/gallerylist";
	}
	
	@RequestMapping("/galleryInsertForm")
	public String galleryInsertForm() {
		return "gallery/galleryInsertForm";
	}
	
	@PostMapping("/galleryInsert")
	public String galleryInsert(HttpSession session, GalleryDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String img_path = "resources\\images";
		String r_path = request.getRealPath("/");
		System.out.println("r_path : "+r_path);
		String oriFn = dto.getGphoto().getOriginalFilename();
		System.out.println("oriFn : " +oriFn);
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath :"+path);
		long size = dto.getGphoto().getSize();
		String contentType = dto.getGphoto().getContentType();
		System.out.println("파일크기 : "+size);
		System.out.println("파일타입 : "+contentType);
		File f = new File(path.toString());
		try {
			dto.getGphoto().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		dto.setGfile(oriFn);
		/*
		 * PrintWriter out = response.getWriter();
		 * response.setContentType("text/html; charset=UTF-8"); out.flush();
		 */
		galleryDaoInter.addUP(dto);
		return "redirect:/galleryList";	
	}
	
	@GetMapping("/gallerydetail")
	public String updetailList(Model m, int gno) {
		
		GalleryDto dto = galleryDaoInter.getDetail(gno);
		
		m.addAttribute("dto", dto);
		galleryDaoInter.updateHit(gno);
		return "gallery/gallerydetail";
	}
	
	@GetMapping("/galleryUpdateForm")
	public String updateForm(Model m, int gno) {
		GalleryDto dto = galleryDaoInter.getDetail(gno);
		m.addAttribute("dto", dto);
		return "gallery/galleryUpdateForm";
	}
	
	@PostMapping("/galleryUpdate")
	public String updateLogic(GalleryDto dto) {
		galleryDaoInter.update(dto);
		return "redirect:/galleryList";
	}
	
	@GetMapping("/galleryDelete")
	public String deleteLogic(GalleryDto dto) {
		galleryDaoInter.delete(dto);
		return "redirect:/galleryList";
	}
	
	@PostMapping(value = "/galleryLike")
	public String updateLike(String gno) {
		int intGno = Integer.parseInt(gno);
		System.out.println("intGno:"+intGno);
		System.out.println("galleryLike가 호출됨");
		galleryDaoInter.likeUpdate(intGno);
		System.out.println("여기도");
		return "redirect:/galleryList";
	}
}

