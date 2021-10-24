package rest.model;

public class ReviewBean {

	private int reviewnum;
	private String usernum;
	private int restnum;
	private int reviewstar;
	private int reviewtaste;
	private int reviewprice;
	private int reviewservice;
	private String reviewcontent;
	private String reviewimage;
	private String reviewdate;
	
	
	public ReviewBean() {
		super();
	}
	public ReviewBean(int reviewnum, String usernum, int restnum, int reviewstar, int reviewtaste, int reviewprice,
			int reviewservice, String reviewcontent, String reviewimage, String reviewdate) {
		super();
		this.reviewnum = reviewnum;
		this.usernum = usernum;
		this.restnum = restnum;
		this.reviewstar = reviewstar;
		this.reviewtaste = reviewtaste;
		this.reviewprice = reviewprice;
		this.reviewservice = reviewservice;
		this.reviewcontent = reviewcontent;
		this.reviewimage = reviewimage;
		this.reviewdate = reviewdate;
	}
	
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	public String getUsernum() {
		return usernum;
	}
	
	public int getRestnum() {
		return restnum;
	}
	public void setRestnum(int restrid) {
		this.restnum = restrid;
	}
	public int getReviewstar() {
		return reviewstar;
	}
	public void setReviewstar(int reviewstar) {
		this.reviewstar = reviewstar;
	}
	public int getReviewtaste() {
		return reviewtaste;
	}
	public void setReviewtaste(int reviewtaste) {
		this.reviewtaste = reviewtaste;
	}
	public int getReviewprice() {
		return reviewprice;
	}
	public void setReviewprice(int reviewprice) {
		this.reviewprice = reviewprice;
	}
	public int getReviewservice() {
		return reviewservice;
	}
	public void setReviewservice(int reviewservice) {
		this.reviewservice = reviewservice;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public String getReviewimage() {
		return reviewimage;
	}
	public void setReviewimage(String reviewimage) {
		this.reviewimage = reviewimage;
	}
	public String getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	
	
}
