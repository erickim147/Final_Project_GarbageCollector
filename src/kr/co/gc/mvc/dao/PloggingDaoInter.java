package kr.co.gc.mvc.dao;


import kr.co.gc.mvc.dto.EmblemUpdateVO;
import kr.co.gc.mvc.dto.MemberVO;
import kr.co.gc.mvc.dto.MyEmblemVO;
import kr.co.gc.mvc.dto.SumVO;

public interface PloggingDaoInter {
	public MyEmblemVO callEmb(String id);
	public void georiExpAdd();
	//public void ploggingExpAdd();
	public MemberVO memberInfo(String id);
	public void upSoloEmb(EmblemUpdateVO uvo); 
	public void upPloggingEmb(EmblemUpdateVO uvo);
	public void newEmblem(String mid);
	public SumVO sum(String id);
	public void upMexp(MemberVO mvo);
}
