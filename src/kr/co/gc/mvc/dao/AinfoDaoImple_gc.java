package kr.co.gc.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.AinfoVO_gc;

@Repository
public class AinfoDaoImple_gc implements AinfoDaoInter_gc{

	@Autowired
	SqlSessionTemplate ss;						//������ ������ �ش� SqlSessionTemplate�� ss�� ����    -- WebContent/WEB-INF/spring/root-context.xml   ���� Ȯ�� ���� 


	@Override
	public List<AinfoVO_gc> listAInfo(String userId) {
		return ss.selectList("ainfo.listinfo", userId);            // �� ������  MyInformation  -> ��� / ���緮  ȭ�鿡 �� �÷α� Ȱ�� ����Ʈ 
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

