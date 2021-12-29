package kr.co.gc.mvc.dao;

import java.util.List;

import kr.co.gc.mvc.dto.AinfoVO_gc;

public interface AinfoDaoInter_gc {
	
	public List<AinfoVO_gc> listAInfo(String userId);       //플로깅 활동 리스트를 DB에서 가져오기위한 코드 
	public List<AinfoVO_gc> todayVolunteer(String date);	
	public List<AinfoVO_gc> todayDistance(String date);		// 오늘의 봉사왕 아이디 가져오기
	public List<Integer> ploggingDistance(String date);
	public List<Integer> exerciseDistance(String date);
	public List<Integer> totalTrash(String date);
	
	public int maindistance();
}
