package community.bean;

public class ImgboardDTO {
	private int imgboard_num;
	private String imgboard_writer;
	private String imgboard_subject;
	private String imgboard_content;
	private String imgboard_img;
	private int imgboard_readCount;
	private String imgboard_date;
	
	public int getImgboard_num() {
		return imgboard_num;
	}
	public void setImgboard_num(int imgboard_num) {
		this.imgboard_num = imgboard_num;
	}
	
	public String getImgboard_writer() {
		return imgboard_writer;
	}
	public void setImgboard_writer(String imgboard_writer) {
		this.imgboard_writer = imgboard_writer;
	}
	
	public String getImgboard_subject() {
		return imgboard_subject;
	}
	public void setImgboard_subject(String imgboard_subject) {
		this.imgboard_subject = imgboard_subject;
	}
	
	public String getImgboard_content() {
		return imgboard_content;
	}
	public void setImgboard_content(String imgboard_content) {
		this.imgboard_content = imgboard_content;
	}
	
	public String getImgboard_img() {
		return imgboard_img;
	}
	public void setImgboard_img(String imgboard_img) {
		this.imgboard_img = imgboard_img;
	}
	
	public int getImgboard_readCount() {
		return imgboard_readCount;
	}
	public void setImgboard_readCount(int imgboard_readCount) {
		this.imgboard_readCount = imgboard_readCount;
	}
	
	public String getImgboard_date() {
		return imgboard_date;
	}
	public void setImgboard_date(String imgboard_date) {
		this.imgboard_date = imgboard_date;
	}
}
