package helpboard.controller;

public class NotifyListDTO {
	private int pg;
	private String notify_sort;
	private int startNum;
	private int endNum;
	private int startPage;
	private int endPage;
	private int totalA;
	private int totalP;
	
	public int getPg() {
		return pg;
	}
	public void setPg(int pg) {
		this.pg = pg;
	}

	public String getNotify_sort() {
		return notify_sort;
	}
	public void setNotify_sort(String notify_sort) {
		this.notify_sort = notify_sort;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalA() {
		return totalA;
	}
	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}
	public int getTotalP() {
		return totalP;
	}
	public void setTotalP(int totalP) {
		this.totalP = totalP;
	}
		
}
