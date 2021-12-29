package kr.co.gc.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gc.mvc.dto.GalleryDto;

@Repository
public class GalleryDaoImple implements GalleryDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addUP(GalleryDto dto) {
		ss.insert("gallery.addGallery",dto);
	}

	@Override
	public List<GalleryDto> getlist() {
		return ss.selectList("gallery.listGallery");
	}

	@Override
	public GalleryDto getDetail(int gno) {
		return ss.selectOne("gallery.detailGallery",gno);
	}

	@Override
	public void update(GalleryDto dto) {
		ss.update("gallery.updateGallery",dto);
	}

	@Override
	public void delete(GalleryDto dto) {
		ss.delete("gallery.deleteGallery",dto);
		
	}

	@Override
	public void likeUpdate(int gno) {
		ss.update("gallery.updateLike",gno);
	}

	@Override
	public void updateHit(int gno) {
		ss.update("gallery.updateHit",gno);		
	}
	
	

}
