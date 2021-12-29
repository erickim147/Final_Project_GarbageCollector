package kr.co.gc.mvc.controller.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gc.mvc.dao.MemberDaoInter;
import kr.co.gc.mvc.dao.PloggingDaoInter;
import kr.co.gc.mvc.dto.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	@Autowired
	private PloggingDaoInter ploggingDaoInter;
	
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	@PostMapping("/memberJoin")
	public String memberJoinCon(HttpSession session, MemberVO mvo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String img_path = "resources\\imgfiles";
		String r_path = request.getRealPath("/");
		System.out.println("r_path : "+r_path);
		String oriFn = mvo.getMfile().getOriginalFilename();
		System.out.println("oriFn : " +oriFn);
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath :"+path);
		long size = mvo.getMfile().getSize();
		String contentType = mvo.getMfile().getContentType();
		System.out.println("파일크기 : "+size);
		System.out.println("파일타입 : "+contentType);
		File f = new File(path.toString());
		try {
			mvo.getMfile().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		mvo.setMphoto(oriFn);
		memberDaoInter.memberJoin(mvo);
		ploggingDaoInter.newEmblem(mvo.getMid());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script language='javascript'> alert('회원가입에 성공하였습니다. 이제 로그인 후 서비스 이용이 가능합니다.') </script>");
		out.flush();
		return "login/loginForm";
	}
	
	@RequestMapping("/idcheck")
	public String idCheck(Model m,String mid) {
		System.out.println("idAjax:"+mid);
		int cnt = memberDaoInter.idCheck(mid);
		m.addAttribute("res", cnt);
		return "memberIdChk";
	}
	
	@RequestMapping("/modify_permission")
	public String modifyPermission() {
		return "member/modifyPermission";
	}
	
	@PostMapping("/permission_process")
	public String permissionProcess(HttpSession session, HttpServletResponse response, MemberVO vo, Model m) throws IOException {
		int pwdchk = memberDaoInter.permissionPwdCheck(vo.getMpwd());
		if(pwdchk > 0) {
			System.out.println("비밀번호 인증");
			String id = (String) session.getAttribute("sessionID");
			MemberVO mvo = memberDaoInter.memberDetail(id);
			m.addAttribute("mvo", mvo);
			return "member/userPage";
		}else {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script language='javascript'> alert('비밀번호가 틀렸습니다.') </script>");
			out.flush();
			return "member/modifyPermission";
		}
	}
	
	@RequestMapping("/userPage")
	public String userPage() {
		return "member/userPage";
	}
	
	@PostMapping("/modify_process")
	public String medit(HttpSession session, MemberVO mvo, HttpServletRequest request, HttpServletResponse response, Model m) throws IOException {
		String oriFn = mvo.getMfile().getOriginalFilename();
		if(oriFn != "") {
			System.out.println("프로필 사진이 업데이트됨");
			String img_path = "resources\\imgfiles";
			String r_path = request.getRealPath("/");
			System.out.println("r_path : "+r_path);
			System.out.println("oriFn : " +oriFn);
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path).append("\\");
			path.append(oriFn);
			System.out.println("FullPath :"+path);
			long size = mvo.getMfile().getSize();
			String contentType = mvo.getMfile().getContentType();
			System.out.println("파일크기 : "+size);
			System.out.println("파일타입 : "+contentType);

			File f = new File(path.toString());
			try {
				mvo.getMfile().transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			mvo.setMphoto(oriFn);
		}else {
			System.out.println("기존 프로필사진");
		}
		memberDaoInter.modify(mvo);
		session.setAttribute("sessionPWD", mvo.getMpwd());
		session.setAttribute("sessionPhoto", mvo.getMphoto());
		PrintWriter out = response.getWriter();
		m.addAttribute("mvo", mvo);
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script language='javascript'> alert('성공적으로 수정되었습니다.') </script>");
		out.flush();
		return "member/userPage";        
	}
	
	@RequestMapping("/withdrawal_check")
	public String withdrawalCheck() {
		return "member/confirmWithdrawal";
	}
	
	@RequestMapping("/member_withdrawal")
	public String memberWithdrawal(MemberVO mvo, HttpServletResponse response, HttpSession session) throws IOException {
		int pwdchk = memberDaoInter.permissionPwdCheck(mvo.getMpwd());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if(pwdchk > 0) {
			memberDaoInter.withdrawal(mvo.getMid());
			System.out.println("회원탈퇴 성공");
			session.removeAttribute("sessionID");
			session.removeAttribute("sessionPWD");
			session.removeAttribute("sessionPhoto");
			out.println("<script language='javascript'> alert('회원탈퇴되었습니다.') </script>");
			out.flush();
			return "main/main";
		}else {
			out.println("<script language='javascript'> alert('비밀번호가 틀렸습니다.') </script>");
			out.flush();
			return "member/confirmWithdrawal";
		}
		
	}
}