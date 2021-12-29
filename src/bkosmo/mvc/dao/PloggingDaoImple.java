package bkosmo.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bkosmo.mvc.dto.EmblemUpdateVO;
import bkosmo.mvc.dto.MemberVO;
import bkosmo.mvc.dto.MyEmblemVO;
import bkosmo.mvc.dto.SumVO;



@Repository
public class PloggingDaoImple implements PloggingDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss2;

	@Override
	public MyEmblemVO callEmb(String id) {
		return ss2.selectOne("lev.emblem", id);
	}
	
	@Override
	public MemberVO memberInfo(String id) {
		return ss2.selectOne("lev.memberInfo", id);
	}

	@Override
	public void upSoloEmb(EmblemUpdateVO uvo) {
		ss2.update("lev.soloEmbUp", uvo);
	}

	@Override
	public void upPloggingEmb(EmblemUpdateVO uvo) {
		ss2.update("lev.ploggingEmbUp", uvo);
	}

	@Override
	public SumVO sum(String id) {
		return ss2.selectOne("lev.sum", id);
	}

	@Override
	public void upMexp(MemberVO mvo) {
		ss2.update("lev.upExp", mvo);
		
	}
	
}
