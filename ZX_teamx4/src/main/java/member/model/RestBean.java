package member.model;

public class RestBean {
	private int restNum;
	private String restMainImg;
	private String restImg;
	private String restName;
	private String restMenu;
	private String restPrice;
	private String restKeyword;
	private String restTime1;
	private String restTime2;
	private String restAdress;
	private String restTel;
	private String restTag;
		
	public RestBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestBean(int restNum, String restMainImg, String restImg, String restName, String restMenu, String restPrice,
			String restKeyword, String restTime1, String restTime2, String restAdress, String restTel, String restTag) {
		super();
		this.restNum = restNum;
		this.restMainImg = restMainImg;
		this.restImg = restImg;
		this.restName = restName;
		this.restMenu = restMenu;
		this.restPrice = restPrice;
		this.restKeyword = restKeyword;
		this.restTime1 = restTime1;
		this.restTime2 = restTime2;
		this.restAdress = restAdress;
		this.restTel = restTel;
		this.restTag = restTag;
	}

	public int getRestNum() {
		return restNum;
	}

	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}

	public String getRestMainImg() {
		return restMainImg;
	}

	public void setRestMainImg(String restMainImg) {
		this.restMainImg = restMainImg;
	}

	public String getRestImg() {
		return restImg;
	}

	public void setRestImg(String restImg) {
		this.restImg = restImg;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getRestMenu() {
		return restMenu;
	}

	public void setRestMenu(String restMenu) {
		this.restMenu = restMenu;
	}

	public String getRestPrice() {
		return restPrice;
	}

	public void setRestPrice(String restPrice) {
		this.restPrice = restPrice;
	}

	public String getRestKeyword() {
		return restKeyword;
	}

	public void setRestKeyword(String restKeyword) {
		this.restKeyword = restKeyword;
	}

	public String getRestTime1() {
		return restTime1;
	}

	public void setRestTime1(String restTime1) {
		this.restTime1 = restTime1;
	}

	public String getRestTime2() {
		return restTime2;
	}

	public void setRestTime2(String restTime2) {
		this.restTime2 = restTime2;
	}

	public String getRestAdress() {
		return restAdress;
	}

	public void setRestAdress(String restAdress) {
		this.restAdress = restAdress;
	}

	public String getRestTel() {
		return restTel;
	}

	public void setRestTel(String restTel) {
		this.restTel = restTel;
	}

	public String getRestTag() {
		return restTag;
	}

	public void setRestTag(String restTag) {
		this.restTag = restTag;
	}

}
