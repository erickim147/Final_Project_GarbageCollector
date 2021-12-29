package kr.co.gc.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.BoardSubVO;
import kr.co.gc.mvc.dto.BoardVO;
import kr.co.gc.mvc.dto.PageVO;
@Repository
public class BoardDaoImple implements BoardDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void insert(BoardVO vo) {
		ss.insert("bd.insert", vo);

	}

	@Override
	public List<BoardVO> list(PageVO vo) {
		return ss.selectList("bd.list", vo);
	}

	@Override
	public void hit(int no) {
		ss.update("bd.hit", no);

	}

	@Override
	public BoardVO detail(int no) {
		return  ss.selectOne("bd.detail", no);	
	}

	@Override
	public void update(BoardVO vo) {
		ss.update("bd.update", vo);

	}

	@Override
	public void del(int no) {
		ss.delete("bd.del", no);

	}

	@Override
	public BoardVO mview(int no) {
		return ss.selectOne("bd.mview", no);
	}

	@Override
	public void app(int no) {
		ss.update("bd.app", no);
		
	}

	@Override
	public List<BoardVO> searchList(PageVO vo) {
		return ss.selectList("bd.searchlist", vo);
	}

	@Override
	public int getTotalCount(BoardVO bvo) {
		return ss.selectOne("bd.totalCnt", bvo);
	}

	@Override
	public int getTotalCount1() {
		return ss.selectOne("bd.totalCnt1");
	}

	@Override
	public void sinsert(BoardSubVO vo) {
		ss.insert("bd.sinsert", vo);
		
	}

	@Override
	public List<BoardSubVO> srec(int no) {
		return ss.selectList("bd.sid",no);
	}

	@Override
	public List<BoardVO> plist() {
		return ss.selectList("bd.plist");
	}

	@Override
	public void can(int no) {
		ss.update("bd.can", no);
		
	}

	@Override
	public void cdel(BoardSubVO vo) {
		ss.delete("bd.cdel", vo);
		
	}
	
	
	
	

}
