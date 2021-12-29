package kr.co.gc.mvc.dao;

import java.util.List;

import kr.co.gc.mvc.dto.GalleryDto;

public interface GalleryDaoInter {
public void addUP(GalleryDto dto);
public List<GalleryDto> getlist();
public GalleryDto getDetail(int gno);
public void update(GalleryDto dto);
public void delete(GalleryDto dto);
public void likeUpdate(int gno);
public void updateHit(int gno);
}
