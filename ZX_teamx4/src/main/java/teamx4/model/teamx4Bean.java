
package teamx4.model;

public class teamx4Bean {

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
	private int restStarSum;
	private int restTasteSum;
	private int restPriceSum;
	private int restServiceSum;
	private int restlike;
	
	
	public teamx4Bean() {
		
	}
	
	public teamx4Bean(int restNum, String restMainImg, String restImg, String restName, String restMenu,
			String restPrice, String restKeyword, String restTime1, String restTime2, String restAdress, String restTel,
			String restTag, int restStarSum, int restTasteSum, int restPriceSum, int restServiceSum, int restlike) {
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
		this.restStarSum = restStarSum;
		this.restTasteSum = restTasteSum;
		this.restPriceSum = restPriceSum;
		this.restServiceSum = restServiceSum;
		this.restlike = restlike;
	}


	public int getRestStarSum() {
		return restStarSum;
	}


	public void setRestStarSum(int restStarSum) {
		this.restStarSum = restStarSum;
	}


	public int getRestTasteSum() {
		return restTasteSum;
	}


	public void setRestTasteSum(int restTasteSum) {
		this.restTasteSum = restTasteSum;
	}


	public int getRestPriceSum() {
		return restPriceSum;
	}


	public void setRestPriceSum(int restPriceSum) {
		this.restPriceSum = restPriceSum;
	}


	public int getRestServiceSum() {
		return restServiceSum;
	}


	public void setRestServiceSum(int restServiceSum) {
		this.restServiceSum = restServiceSum;
	}


	public int getRestlike() {
		return restlike;
	}


	public void setRestlike(int restlike) {
		this.restlike = restlike;
	}


	public String getRestMainImg() {
		return restMainImg;
	}


	public void setRestMainImg(String restMainImg) {
		this.restMainImg = restMainImg;
	}


	public int getRestNum() {
		return restNum;
	}

	public void setRestNum(int restNum) {
		this.restNum = restNum;
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
