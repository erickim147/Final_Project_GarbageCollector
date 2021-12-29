package kr.co.gc.mvc.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gc.mvc.dao.LoginDaoInter;
import kr.co.gc.mvc.dto.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDaoInter loginDaoInter;

	@RequestMapping("/loginForm")
	public String loginForm(HttpServletRequest request, Model m){
		String mobileVal = request.getParameter("mobile");
		if(mobileVal != null && mobileVal.equals("mobile")) {
			m.addAttribute("mobile", mobileVal);
			return "login/loginForm";
		} else {
			return "login/loginForm";
		}
	}
	
	@RequestMapping("/loginProcess")
	public ModelAndView logfinProcess(HttpSession session,HttpServletRequest request, HttpServletResponse response, MemberVO mvo, @RequestHeader("User-Agent") String userAgent) throws IOException {
		System.out.println("id : " + mvo.getMid());
		System.out.println("pwd : " + mvo.getMpwd());
		String userPhoto = loginDaoInter.userPhoto(mvo.getMid());
		System.out.println("photo : " + userPhoto);
		int map = loginDaoInter.loginCheck(mvo);
		ModelAndView mav = new ModelAndView();
		if(map > 0) {
			System.out.println("로그인 인증");
			session.setAttribute("sessionID", mvo.getMid());
			session.setAttribute("sessionPWD", mvo.getMpwd());
			session.setAttribute("sessionPhoto", userPhoto);
			String mobileChk = request.getParameter("mobile");
			if(mobileChk.equals("mobile")) {
				mav.setViewName("redirect:/mobile/mobileStart");
				System.out.println("mobileLogin");
			} else {
				mav.setViewName("redirect:/");
				System.out.println("WebLogin");
			}
		}else {
//			mav.setViewName("error");
//			mav.addObject("emsg", "로그인 실패입니다.");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			int delMem = loginDaoInter.delMemChk(mvo);
			if(delMem > 0) {
				System.out.println("탈퇴된 회원");
				session.getAttribute("sessionID");
				session.getAttribute("sessionPWD");
				out.println("<script language='javascript'> alert('탈퇴한 회원입니다.') </script>");
				out.flush();
				mav.setViewName("login/loginForm");
			}else {
				System.out.println("존재하지않는 회원");
				out.println("<script language='javascript'> alert('존재하지않는 회원입니다.') </script>");
				out.flush();
				mav.setViewName("login/loginForm");
			} 
		}
		return mav;
	}
	
	@GetMapping("/logoutProcess")
	public ModelAndView logfoutProcess(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionPWD");
		session.removeAttribute("sessionPhoto");
		mav.setViewName("redirect:/");
		return mav;
	}
	
	
}
