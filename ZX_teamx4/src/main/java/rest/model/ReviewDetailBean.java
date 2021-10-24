package rest.model;

public class ReviewDetailBean {

	private int reviewstar;
	private int reviewtaste;
	private int reviewprice;
	private int reviewservice;
	private String reviewcontent;
	private String reviewimage;
	private String reviewdate;
	private String userimage;
	private String username;
	private String usernum;
	private int userreviewcount;
	private int reviewnum;
	
	
	
	public ReviewDetailBean() {
		super();
	}
	
	
	public ReviewDetailBean(int reviewstar, int reviewtaste, int reviewprice, int reviewservice, String reviewcontent,
			String reviewimage, String reviewdate, String userimage, String username, String usernum,
			int userreviewcount, int reviewnum) {
		super();
		this.reviewstar = reviewstar;
		this.reviewtaste = reviewtaste;
		this.reviewprice = reviewprice;
		this.reviewservice = reviewservice;
		this.reviewcontent = reviewcontent;
		this.reviewimage = reviewimage;
		this.reviewdate = reviewdate;
		this.userimage = userimage;
		this.username = username;
		this.usernum = usernum;
		this.userreviewcount = userreviewcount;
		this.reviewnum = reviewnum;
	}


	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
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
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsernum() {
		return usernum;
	}
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	public int getUserreviewcount() {
		return userreviewcount;
	}
	public void setUserreviewcount(int userreviewcount) {
		this.userreviewcount = userreviewcount;
	}
	
	
}
