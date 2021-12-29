package kr.co.gc.mvc.dao;

import kr.co.gc.mvc.dto.MemberVO;
import kr.co.gc.mvc.dto.MyLoginLoggerVO;

public interface LoginDaoInter {
	public String userPhoto(String mid);
	public int loginCheck(MemberVO mvo);
	public int delMemChk(MemberVO mvo);
	public void addLoginLogging(MyLoginLoggerVO lvo);
}
