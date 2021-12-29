package kr.co.gc.mvc.dao;

import java.util.List;

import kr.co.gc.mvc.dto.BoardSubVO;
import kr.co.gc.mvc.dto.BoardVO;
import kr.co.gc.mvc.dto.PageVO;

public interface BoardDaoInter {

	public void insert(BoardVO vo);
	public List<BoardVO> list(PageVO pvo);
	public void hit(int no);
	public BoardVO detail(int no);
	public BoardVO mview(int no);
	public void update(BoardVO vo);
	public void del(int no);
	public void app(int no);
	public List<BoardVO> searchList(PageVO pvo);
	public int getTotalCount(BoardVO bvo);
	public int getTotalCount1();
	public void sinsert(BoardSubVO vo);
	public List<BoardSubVO> srec(int no);
	public List<BoardVO> plist();
	public void can(int no);
	public void cdel(BoardSubVO vo);
}
