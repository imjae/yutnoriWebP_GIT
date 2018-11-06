package community.bean;

public class Freeboard_commentDTO {
	private int freeboard_num;
	private int free_comment_num;
	private String free_comment_writer;
	private String free_comment_content;
	private String free_comment_date;
	
	public int getFreeboard_num() {
		return freeboard_num;
	}
	public void setFreeboard_num(int freeboard_num) {
		this.freeboard_num = freeboard_num;
	}
	
	public int getFree_comment_num() {
		return free_comment_num;
	}
	public void setFree_comment_num(int free_comment_num) {
		this.free_comment_num = free_comment_num;
	}
	
	public String getFree_comment_writer() {
		return free_comment_writer;
	}
	public void setFree_comment_writer(String free_comment_writer) {
		this.free_comment_writer = free_comment_writer;
	}
	
	public String getFree_comment_content() {
		return free_comment_content;
	}
	public void setFree_comment_content(String free_comment_content) {
		this.free_comment_content = free_comment_content;
	}
	
	public String getFree_comment_date() {
		return free_comment_date;
	}
	public void setFree_comment_date(String free_comment_date) {
		this.free_comment_date = free_comment_date;
	}
}
