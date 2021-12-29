package kr.co.gc.mvc.dto;

public class BoardVO {
	private int bno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private String bplace;
	private String bemail;
	private int brec;
	private int bmax;
	private int bhit;
	private String bdate;
	private String wdate;
	//검색기능을 위한 속성
	private String ex_select;
	private String searchValue;
	
	
	
	public String getEx_select() {
		return ex_select;
	}
	public void setEx_select(String ex_select) {
		this.ex_select = ex_select;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBplace() {
		return bplace;
	}
	public void setBplace(String bplace) {
		this.bplace = bplace;
	}
	public String getBemail() {
		return bemail;
	}
	public void setBemail(String bemail) {
		this.bemail = bemail;
	}
	public int getBrec() {
		return brec;
	}
	public void setBrec(int brec) {
		this.brec = brec;
	}
	public int getBmax() {
		return bmax;
	}
	public void setBmax(int bmax) {
		this.bmax = bmax;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
	
	
	
}
