package itemShop.bean;

public class PaymentHistoryDTO {

	private String category;
	private String item_code;
	private String item_name;
	private String item_content;
	private String item_img;
	private int item_charge;
	private String user_id;
	private String pay_log;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public int getItem_charge() {
		return item_charge;
	}
	public void setItem_charge(int item_charge) {
		this.item_charge = item_charge;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPay_log() {
		return pay_log;
	}
	public void setPay_log(String pay_log) {
		this.pay_log = pay_log;
	}
	
	
	
}
