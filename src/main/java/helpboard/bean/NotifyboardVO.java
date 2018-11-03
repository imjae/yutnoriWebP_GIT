package helpboard.bean;

public class NotifyboardVO {
	private int notifyboard_num;
	private String reporter_id;
	private String notify_sort;
	private String title;
	private String content;
	private int respond;
	
	public int getRespond() {
		return respond;
	}
	public void setRespond(int respond) {
		this.respond = respond;
	}
	public int getNotifyboard_num() {
		return notifyboard_num;
	}
	public void setNotifyboard_num(int notifyboard_num) {
		this.notifyboard_num = notifyboard_num;
	}
	public String getReporter_id() {
		return reporter_id;
	}
	public void setReporter_id(String reporter_id) {
		this.reporter_id = reporter_id;
	}
	public String getNotify_sort() {
		return notify_sort;
	}
	public void setNotify_sort(String notify_sort) {
		this.notify_sort = notify_sort;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
