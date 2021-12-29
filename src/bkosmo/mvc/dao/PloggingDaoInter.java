package bkosmo.mvc.dao;

import bkosmo.mvc.dto.EmblemUpdateVO;
import bkosmo.mvc.dto.MemberVO;
import bkosmo.mvc.dto.MyEmblemVO;
import bkosmo.mvc.dto.SumVO;

public interface PloggingDaoInter {
	public MyEmblemVO callEmb(String id);
	public MemberVO memberInfo(String id);
	public void upSoloEmb(EmblemUpdateVO uvo); 
	public void upPloggingEmb(EmblemUpdateVO uvo);
	public SumVO sum(String id);
	public void upMexp(MemberVO mvo);
}
