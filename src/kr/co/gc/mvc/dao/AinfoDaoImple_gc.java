package kr.co.gc.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.AinfoVO_gc;

@Repository
public class AinfoDaoImple_gc implements AinfoDaoInter_gc{

	@Autowired
	SqlSessionTemplate ss;						//서블릿을 나눠서 해당 SqlSessionTemplate은 ss로 지정    -- WebContent/WEB-INF/spring/root-context.xml   에서 확인 가능 


	@Override
	public List<AinfoVO_gc> listAInfo(String userId) {
		return ss.selectList("ainfo.listinfo", userId);            // 웹 페이지  MyInformation  -> 운동량 / 봉사량  화면에 들어갈 플로깅 활동 리스트 
	}


	@Override
	public List<AinfoVO_gc> todayVolunteer(String date) {
		return ss.selectList("ainfo.todayVolunteer", date);
	}
	
	@Override
	public int maindistance() {
	return ss.selectOne("ainfo.maindistance");
	}

	@Override
	public List<AinfoVO_gc> todayDistance(String date) {
		return ss.selectList("ainfo.todayDistance", date);
	}


	@Override
	public List<Integer> ploggingDistance(String date) {
		return ss.selectList("ainfo.ploggingDistance", date);
	}


	@Override
	public List<Integer> exerciseDistance(String date) {
		return ss.selectList("ainfo.exerciseDistance", date);
	}


	@Override
	public List<Integer> totalTrash(String date) {
		return ss.selectList("ainfo.totalTrash", date);
	}

}

