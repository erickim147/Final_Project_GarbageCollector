package kr.co.gc.mvc.dto;

public class AinfoVO_gc {
	
	private int plno;						// ȸ�� ��ȣ
	private String pluserId;				// sessionID
	private String pldate;					// �÷α� Ȱ�� ��¥
	private int pldistance;				// �÷α� Ȱ�� �Ÿ�
	private String pltime;					// �÷α� Ȱ�� �ð�
	private int pltrashpick;						// �÷α� Ȱ�� ������ �ݱ� Ƚ�� 
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
