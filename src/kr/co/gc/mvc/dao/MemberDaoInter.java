package kr.co.gc.mvc.dao;

import kr.co.gc.mvc.dto.MemberVO;

public interface MemberDaoInter {
	public void memberJoin(MemberVO mvo);
	public int idCheck(String mid);
	public int permissionPwdCheck(String mpwd);
	public MemberVO memberDetail(String mid);
	public void modify(MemberVO mvo);
	public void withdrawal(String mid);
}
