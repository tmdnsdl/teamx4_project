package teamx4.model;

public class reviewsBean {
	private String reviewName;
	private String userNum;
	private int restNum;
	private String reviewStar;
	private String reviewTaste;
	private String reviewPrice;
	private String reviewService;
	private String reviewContent;
	private String reviewImage;
	private String reviewDate;
	//메인페이지 리뷰 
	private String user_name;
	private String user_image;
	private String restname;
	
	public reviewsBean() {
		
	}

	public reviewsBean(String reviewName, String userNum, int restNum, String reviewStar, String reviewTaste,
			String reviewPrice, String reviewService, String reviewContent, String reviewImage, String reviewDate,
			String user_name, String user_image, String restname) {
		super();
		this.reviewName = reviewName;
		this.userNum = userNum;
		this.restNum = restNum;
		this.reviewStar = reviewStar;
		this.reviewTaste = reviewTaste;
		this.reviewPrice = reviewPrice;
		this.reviewService = reviewService;
		this.reviewContent = reviewContent;
		this.reviewImage = reviewImage;
		this.reviewDate = reviewDate;
		this.user_name = user_name;
		this.user_image = user_image;
		this.restname = restname;
	}

	public String getReviewName() {
		return reviewName;
	}

	public void setReviewName(String reviewName) {
		this.reviewName = reviewName;
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

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewTaste() {
		return reviewTaste;
	}

	public void setReviewTaste(String reviewTaste) {
		this.reviewTaste = reviewTaste;
	}

	public String getReviewPrice() {
		return reviewPrice;
	}

	public void setReviewPrice(String reviewPrice) {
		this.reviewPrice = reviewPrice;
	}

	public String getReviewService() {
		return reviewService;
	}

	public void setReviewService(String reviewService) {
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public String getRestname() {
		return restname;
	}

	public void setRestname(String restname) {
		this.restname = restname;
	}
	
	
	
	
	
	
}
