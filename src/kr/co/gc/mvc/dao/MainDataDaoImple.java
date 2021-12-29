package kr.co.gc.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDataDaoImple implements MainDataDaoInter {
	
	@Autowired
	public SqlSessionTemplate ss;

	@Override
	public int teamTotal() {
		return ss.selectOne("main.teamTotal");
	}

	@Override
	public void upTeamEmb(String id) {
		ss.update("main.upTeamEmb", id);	
	}

	@Override
	public int checkTeam(String id) {
		return ss.selectOne("main.checkTeam", id);
	}
	
	
}
