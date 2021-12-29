package bkosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import bkosmo.mvc.dto.AinfoVO;

@Repository
public class AinfoDaoImple implements AinfoDaoInter{

	@Autowired
	SqlSessionTemplate ss2;
	
	@Override
	public void addainfo(AinfoVO vo) {
		ss2.insert("ainfo.addainfo",vo);
	}
	
	@Override
	public List<AinfoVO> listAInfo() {    //�÷α� Ȱ���� ����� DB���� �ҷ���
		return ss2.selectList("ainfo.listinfo");
	}
	
	

}
