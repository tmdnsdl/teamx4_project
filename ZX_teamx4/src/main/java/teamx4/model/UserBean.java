package teamx4.model;

public class UserBean {

	private String user_num;
	private String user_name;
	private String user_image;
	private String user_email;
	private String user_review_list;
	private String user_like_list;
	private String user_gender;
	private int restNum;
	
	

	public UserBean() {
		super();
	}



	public UserBean(String user_num, String user_name, String user_image, String user_email, String user_review_list,
			String user_like_list, String user_gender, int restNum) {
		super();
		this.user_num = user_num;
		this.user_name = user_name;
		this.user_image = user_image;
		this.user_email = user_email;
		this.user_review_list = user_review_list;
		this.user_like_list = user_like_list;
		this.user_gender = user_gender;
		this.restNum = restNum;
	}



	public String getUser_num() {
		return user_num;
	}



	public void setUser_num(String user_num) {
		this.user_num = user_num;
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



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_review_list() {
		return user_review_list;
	}



	public void setUser_review_list(String user_review_list) {
		this.user_review_list = user_review_list;
	}



	public String getUser_like_list() {
		return user_like_list;
	}



	public void setUser_like_list(String user_like_list) {
		this.user_like_list = user_like_list;
	}



	public String getUser_gender() {
		return user_gender;
	}



	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}



	public int getRestNum() {
		return restNum;
	}



	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}


	



	
	
}
