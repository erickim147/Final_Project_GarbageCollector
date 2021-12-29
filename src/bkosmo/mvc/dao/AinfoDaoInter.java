package bkosmo.mvc.dao;

import java.util.List;

import bkosmo.mvc.dto.AinfoVO;

public interface AinfoDaoInter {
	
	public void addainfo(AinfoVO vo);
	public List<AinfoVO> listAInfo();
	
}
