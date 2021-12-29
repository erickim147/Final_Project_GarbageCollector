package kr.co.gc.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.MemberVO;

@Repository
public class MemberDaoImple implements MemberDaoInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void memberJoin(MemberVO mvo) {
		ss.insert("mem.join", mvo);
	}

	@Override
	public int idCheck(String mid) {
		return ss.selectOne("mem.idchk", mid);
	}
	
	@Override
	public int permissionPwdCheck(String mpwd) {
		return ss.selectOne("mem.pwdChk", mpwd);
	}

	@Override
	public MemberVO memberDetail(String mid) {
		return ss.selectOne("mem.detail", mid);
	}

	@Override
	public void modify(MemberVO mvo) {
		ss.update("mem.modify", mvo);
	}

	@Override
	public void withdrawal(String mid) {
		ss.update("mem.withdrawal", mid);
	}

}
