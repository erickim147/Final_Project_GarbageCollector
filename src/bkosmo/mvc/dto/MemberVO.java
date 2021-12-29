package bkosmo.mvc.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
   private int mno;			// 회원 고유번호
   private String mid;		// 아이디
   private String mpwd;		// 비밀번호
   private String mname;	// 이름
   private String mbirth;	// 생년월일
   private String msex;		// 성별
   private String maddr;	// 주소
   private String mphone;	// 연락처
   private String memail;	// 이메일
   private String mphoto;	// 프로필사진
   private int mexp;		// 경험치
   private String mdate;	// 날짜
   private MultipartFile mfile;	// 파일업로드에 필요
   
   public int getMno() {
      return mno;
   }
   public void setMno(int mno) {
      this.mno = mno;
   }
   public String getMid() {
      return mid;
   }
   public void setMid(String mid) {
      this.mid = mid;
   }
   public String getMpwd() {
      return mpwd;
   }
   public void setMpwd(String mpwd) {
      this.mpwd = mpwd;
   }
   public String getMname() {
      return mname;
   }
   public void setMname(String mname) {
      this.mname = mname;
   }
   public String getMbirth() {
      return mbirth;
   }
   public void setMbirth(String mbirth) {
      this.mbirth = mbirth;
   }
   public String getMsex() {
      return msex;
   }
   public void setMsex(String msex) {
      this.msex = msex;
   }
   public String getMaddr() {
      return maddr;
   }
   public void setMaddr(String maddr) {
      this.maddr = maddr;
   }
   public String getMphone() {
      return mphone;
   }
   public void setMphone(String mphone) {
      this.mphone = mphone;
   }
   public String getMemail() {
      return memail;
   }
   public void setMemail(String memail) {
      this.memail = memail;
   }
   public String getMphoto() {
      return mphoto;
   }
   public void setMphoto(String mphoto) {
      this.mphoto = mphoto;
   }
   public int getMexp() {
      return mexp;
   }
   public void setMexp(int mexp) {
      this.mexp = mexp;
   }
   public String getMdate() {
      return mdate;
   }
   public void setMdate(String mdate) {
      this.mdate = mdate;
   }
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
   
}