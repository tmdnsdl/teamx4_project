package admin.model;

public class AdminReviewBean {

	private String usernum;
	private String restname;
	private String reviewcontent;
	private int reviewstar;
	private int reviewtaste;
	private int reviewservice;
	private int reviewprice;
	private String reviewdate;
	private int reviewnum;
	
	
	
	
	public AdminReviewBean() {
		super();
	}
	public AdminReviewBean(String usernum, String restname, String reviewcontent, int reviewstar, int reviewtaste,
			int reviewservice, int reviewprice, String reviewdate, int reviewnum) {
		super();
		this.usernum = usernum;
		this.restname = restname;
		this.reviewcontent = reviewcontent;
		this.reviewstar = reviewstar;
		this.reviewtaste = reviewtaste;
		this.reviewservice = reviewservice;
		this.reviewprice = reviewprice;
		this.reviewdate = reviewdate;
		this.reviewnum = reviewnum;
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
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	public String getRestname() {
		return restname;
	}
	public void setRestname(String restname) {
		this.restname = restname;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
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
	public int getReviewservice() {
		return reviewservice;
	}
	public void setReviewservice(int reviewservice) {
		this.reviewservice = reviewservice;
	}
	public int getReviewprice() {
		return reviewprice;
	}
	public void setReviewprice(int reviewprice) {
		this.reviewprice = reviewprice;
	}
	public String getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	
}
