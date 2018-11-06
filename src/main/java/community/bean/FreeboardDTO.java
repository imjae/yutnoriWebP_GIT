package community.bean;

public class FreeboardDTO {
	private int freeboard_num;
	private String freeboard_writer;
	private String freeboard_subject;
	private String freeboard_content;
	private int freeboard_readCount;
	private String freeboard_date;
	
	public int getFreeboard_num() {
		return freeboard_num;
	}
	public void setFreeboard_num(int freeboard_num) {
		this.freeboard_num = freeboard_num;
	}
	
	public String getFreeboard_writer() {
		return freeboard_writer;
	}
	public void setFreeboard_writer(String freeboard_writer) {
		this.freeboard_writer = freeboard_writer;
	}
	
	public String getFreeboard_subject() {
		return freeboard_subject;
	}
	public void setFreeboard_subject(String freeboard_subject) {
		this.freeboard_subject = freeboard_subject;
	}
	
	public String getFreeboard_content() {
		return freeboard_content;
	}
	public void setFreeboard_content(String freeboard_content) {
		this.freeboard_content = freeboard_content;
	}
	
	public int getFreeboard_readCount() {
		return freeboard_readCount;
	}
	public void setFreeboard_readCount(int freeboard_readCount) {
		this.freeboard_readCount = freeboard_readCount;
	}
	
	public String getFreeboard_date() {
		return freeboard_date;
	}
	public void setFreeboard_date(String freeboard_date) {
		this.freeboard_date = freeboard_date;
	}
}
