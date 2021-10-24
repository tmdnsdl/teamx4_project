package rest.model;

public class ReviewScoreBean {

	private int avgStar;
	private int avgPrice;
	private int avgTaste;
	private int avgService;
	
	
	public ReviewScoreBean() {
		super();
	}
	public ReviewScoreBean(int avgStar, int avgPrice, int avgTaste, int avgService) {
		super();
		this.avgStar = avgStar;
		this.avgPrice = avgPrice;
		this.avgTaste = avgTaste;
		this.avgService = avgService;
	}
	public int getAvgStar() {
		return avgStar;
	}
	public void setAvgStar(int avgStar) {
		this.avgStar = avgStar;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}
	public int getAvgTaste() {
		return avgTaste;
	}
	public void setAvgTaste(int avgTaste) {
		this.avgTaste = avgTaste;
	}
	public int getAvgService() {
		return avgService;
	}
	public void setAvgService(int avgService) {
		this.avgService = avgService;
	}
	
	
}
