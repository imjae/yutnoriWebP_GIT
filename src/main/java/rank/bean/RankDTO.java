package rank.bean;

public class RankDTO {
	private int rank;
	private String tear;
	private String name;
	private int money;
	private int win;
	private int lose;
	private String equ_character;
	private String equ_background;
	
	
	public int getRank() {
		return rank;
	}
	public String getEqu_character() {
		return equ_character;
	}
	public void setEqu_character(String equ_character) {
		this.equ_character = equ_character;
	}
	public String getEqu_background() {
		return equ_background;
	}
	public void setEqu_background(String equ_background) {
		this.equ_background = equ_background;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getTear() {
		return tear;
	}
	public void setTear(String tear) {
		this.tear = tear;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	
	
}
