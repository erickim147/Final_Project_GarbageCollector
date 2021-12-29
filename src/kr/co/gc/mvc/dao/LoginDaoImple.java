package kr.co.gc.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.MemberVO;
import kr.co.gc.mvc.dto.MyLoginLoggerVO;

@Repository
public class LoginDaoImple implements LoginDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public String userPhoto(String mid) {
		return ss.selectOne("login.photo", mid);
	}
	
	@Override
	public int loginCheck(MemberVO mvo) {
		System.out.println("id :" + mvo.getMid());
		System.out.println("pwd : " + mvo.getMpwd());
		return ss.selectOne("login.check", mvo);
	}

	@Override
	public int delMemChk(MemberVO mvo) {
		return ss.selectOne("login.delchk", mvo);
	}

	@Override
	public void addLoginLogging(MyLoginLoggerVO lvo) {
		ss.insert("login.logger_in", lvo);
	}

}
