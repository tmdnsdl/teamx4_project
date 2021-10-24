package member.model;

public class ReviewBean {
	private int reviewNum;
	private String userNum;
	private int restNum;
	private String restName;
	private int reviewStar;
	private int reviewTaste;
	private int reviewPrice;
	private int reviewService;
	private String reviewContent;
	private String reviewImage;
	private String reviewDate;
	
	public ReviewBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewBean(int reviewNum, String userNum, int restNum, String restName, int reviewStar, int reviewTaste,
			int reviewPrice, int reviewService, String reviewContent, String reviewImage, String reviewDate) {
		super();
		this.reviewNum = reviewNum;
		this.userNum = userNum;
		this.restNum = restNum;
		this.restName = restName;
		this.reviewStar = reviewStar;
		this.reviewTaste = reviewTaste;
		this.reviewPrice = reviewPrice;
		this.reviewService = reviewService;
		this.reviewContent = reviewContent;
		this.reviewImage = reviewImage;
		this.reviewDate = reviewDate;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public int getRestNum() {
		return restNum;
	}

	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public int getReviewTaste() {
		return reviewTaste;
	}

	public void setReviewTaste(int reviewTaste) {
		this.reviewTaste = reviewTaste;
	}

	public int getReviewPrice() {
		return reviewPrice;
	}

	public void setReviewPrice(int reviewPrice) {
		this.reviewPrice = reviewPrice;
	}

	public int getReviewService() {
		return reviewService;
	}

	public void setReviewService(int reviewService) {
		this.reviewService = reviewService;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
