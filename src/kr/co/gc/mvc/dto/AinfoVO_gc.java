package kr.co.gc.mvc.dto;

public class AinfoVO_gc {
	
	private int plno;						// 회차 번호
	private String pluserId;				// sessionID
	private String pldate;					// 플로깅 활동 날짜
	private int pldistance;				// 플로깅 활동 거리
	private String pltime;					// 플로깅 활동 시간
	private int pltrashpick;						// 플로깅 활동 쓰레기 줍기 횟수 
	private String plstatus;
	public int getPlno() {
		return plno;
	}
	public void setPlno(int plno) {
		this.plno = plno;
	}
	public String getPluserId() {
		return pluserId;
	}
	public void setPluserId(String pluserId) {
		this.pluserId = pluserId;
	}
	public String getPldate() {
		return pldate;
	}
	public void setPldate(String pldate) {
		this.pldate = pldate;
	}
	public int getPldistance() {
		return pldistance;
	}
	public void setPldistance(int pldistance) {
		this.pldistance = pldistance;
	}
	public String getPltime() {
		return pltime;
	}
	public void setPltime(String pltime) {
		this.pltime = pltime;
	}
	public int getPltrashpick() {
		return pltrashpick;
	}
	public void setPltrashpick(int pltrashpick) {
		this.pltrashpick = pltrashpick;
	}
	public String getPlstatus() {
		return plstatus;
	}
	public void setPlstatus(String plstatus) {
		this.plstatus = plstatus;
	}
	
}
