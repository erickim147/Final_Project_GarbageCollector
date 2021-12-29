package kr.co.gc.mvc.dto;

import org.springframework.web.multipart.MultipartFile;

public class GalleryDto {
private int gno;
private String gwriter;
private String gfile;
private String gtitle;
private String gtext;
private String gdate;
private int ghit;
private int glike;
private String hashtag;
private MultipartFile gphoto;
public int getGno() {
	return gno;
}
public void setGno(int gno) {
	this.gno = gno;
}
public String getGwriter() {
	return gwriter;
}
public void setGwriter(String gwriter) {
	this.gwriter = gwriter;
}
public String getGfile() {
	return gfile;
}
public void setGfile(String gfile) {
	this.gfile = gfile;
}
public String getGtitle() {
	return gtitle;
}
public void setGtitle(String gtitle) {
	this.gtitle = gtitle;
}
public String getGtext() {
	return gtext;
}
public void setGtext(String gtext) {
	this.gtext = gtext;
}
public String getGdate() {
	return gdate;
}
public void setGdate(String gdate) {
	this.gdate = gdate;
}
public int getGhit() {
	return ghit;
}
public void setGhit(int ghit) {
	this.ghit = ghit;
}
public int getGlike() {
	return glike;
}
public void setGlike(int glike) {
	this.glike = glike;
}
public String getHashtag() {
	return hashtag;
}
public void setHashtag(String hashtag) {
	this.hashtag = hashtag;
}
public MultipartFile getGphoto() {
	return gphoto;
}
public void setGphoto(MultipartFile gphoto) {
	this.gphoto = gphoto;
}




}
