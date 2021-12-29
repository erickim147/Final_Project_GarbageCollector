package kr.co.gc.mvc.dao;

import java.util.List;

import kr.co.gc.mvc.dto.AinfoVO_gc;

public interface AinfoDaoInter_gc {
	
	public List<AinfoVO_gc> listAInfo(String userId);       //�÷α� Ȱ�� ����Ʈ�� DB���� ������������ �ڵ� 
	public List<AinfoVO_gc> todayVolunteer(String date);	
	public List<AinfoVO_gc> todayDistance(String date);		// ������ ����� ���̵� ��������
	public List<Integer> ploggingDistance(String date);
	public List<Integer> exerciseDistance(String date);
	public List<Integer> totalTrash(String date);
	
	public int maindistance();
}
