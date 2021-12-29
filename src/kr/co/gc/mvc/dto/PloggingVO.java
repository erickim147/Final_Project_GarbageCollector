package kr.co.gc.mvc.dto;

public class PloggingVO {
	private int pno;
	private String pid;
	private double pgeori;
	private String pstatus;
	private String pdate;
	private int sumgeori;
	private int sumpstatus;

	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public double getPgeori() {
		return pgeori;
	}
	public void setPgeori(double pgeori) {
		this.pgeori = pgeori;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getSumgeori() {
		return sumgeori;
	}
	public void setSumgeori(int sumgeori) {
		this.sumgeori = sumgeori;
	}
	public int getSumpstatus() {
		return sumpstatus;
	}
	public void setSumpstatus(int sumpstatus) {
		this.sumpstatus = sumpstatus;
	}

	
}
