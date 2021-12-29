package kr.co.gc.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.EmblemUpdateVO;
import kr.co.gc.mvc.dto.MemberVO;
import kr.co.gc.mvc.dto.MyEmblemVO;
import kr.co.gc.mvc.dto.SumVO;

@Repository
public class PloggingDaoImple implements PloggingDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public MyEmblemVO callEmb(String id) {
		return ss.selectOne("lev.emblem", id);
	}

	@Override
	public void georiExpAdd() {
		ss.update("lev.georiexp");	
	}

//	@Override
//	public void ploggingExpAdd() {
//		ss.update("lev.ploggingexp");
//	}

	@Override
	public MemberVO memberInfo(String id) {
		return ss.selectOne("lev.memberInfo", id);
	}

	@Override
	public void upSoloEmb(EmblemUpdateVO uvo) {
		ss.update("lev.soloEmbUp", uvo);
	}

	@Override
	public void upPloggingEmb(EmblemUpdateVO uvo) {
		ss.update("lev.ploggingEmbUp", uvo);
	}

	@Override
	public void newEmblem(String mid) {
		ss.insert("lev.new", mid);	
	}

	@Override
	public SumVO sum(String id) {
		return ss.selectOne("lev.sum", id);
	}

	@Override
	public void upMexp(MemberVO mvo) {
		ss.update("lev.upExp", mvo);
		
	}
	
}
