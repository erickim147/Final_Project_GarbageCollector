package kr.co.gc.mvc.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gc.mvc.dao.LoginDaoInter;
import kr.co.gc.mvc.dto.MyLoginLoggerVO;

@Component
@Aspect
public class LoginAdvice {

	private String userAgent;
	
	@Autowired
	private LoginDaoInter loginDaoInter;
	
	//Login Logger
	@Around("execution(* kr.co.gc.mvc.controller.*.*.logf*(..))")
	public ModelAndView loginLogger(ProceedingJoinPoint jp) {
		System.out.println("µø¿€!");
		Object[] fd = jp.getArgs();
		
		ModelAndView rpath=null;
		String methodName = jp.getSignature().getName();
		
		if(methodName.equals("logfinProcess")) {
			try {
				userAgent = String.valueOf(fd[3]);
				MyLoginLoggerVO vo = new MyLoginLoggerVO();
				rpath = (ModelAndView)jp.proceed();
				if(fd[0] instanceof HttpSession &&
				   fd[1] instanceof HttpServletRequest) {
					HttpSession session = (HttpSession)fd[0];
					HttpServletRequest request = (HttpServletRequest)fd[1];
					String uid = (String) session.getAttribute("sessionID");
					if(uid != null) {
						vo.setIdn(uid);
						vo.setStatus("login");
						vo.setReip(request.getRemoteAddr());
						vo.setUagent(userAgent);
						loginDaoInter.addLoginLogging(vo);
					}
				}
			} catch (Throwable e) {
				e.printStackTrace();
			}
			//=-----------------
		}else if(methodName.equals("logfoutProcess")) {
			try {
				MyLoginLoggerVO vo = new MyLoginLoggerVO();
				if(fd[0] instanceof HttpSession
						&& fd[1] instanceof HttpServletRequest) {
						HttpSession session = (HttpSession) fd[0];
						HttpServletRequest request = (HttpServletRequest) fd[1];
						String uid = (String) session.getAttribute("sessionID"); 
						if(uid != null) {
							vo.setIdn(uid);
							vo.setStatus("logout");
							vo.setReip(request.getRemoteAddr());
							vo.setUagent(userAgent);
							loginDaoInter.addLoginLogging(vo);
						}
				}
				rpath = (ModelAndView)jp.proceed();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		System.out.println("insert!");
		return rpath;
	}
}
		
