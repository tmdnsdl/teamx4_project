package member.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberBean {
	private String user_num;
	private String user_name;
	private String user_image;
	private String user_email;
	private String user_gender;
	private int user_type; 
	private String user_review_list;
	private String user_like_list;
	private String user_diningName;
	private String user_diningAddr;
	private String user_diningReg;
	private String user_diningHp;
	private MultipartFile uploadFile;
	private MultipartFile uploadImage;
	
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
		this.user_image = uploadImage.getOriginalFilename();
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
		this.user_diningReg = uploadFile.getOriginalFilename();
	}
	public MemberBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberBean(String user_num, String user_name, String user_image, String user_email, String user_gender,
			int user_type, String user_review_list, String user_like_list, String user_diningName,
			String user_diningAddr, String user_diningReg, String user_diningHp) {
		super();
		this.user_num = user_num;
		this.user_name = user_name;
		this.user_image = user_image;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_type = user_type;
		this.user_review_list = user_review_list;
		this.user_like_list = user_like_list;
		this.user_diningName = user_diningName;
		this.user_diningAddr = user_diningAddr;
		this.user_diningReg = user_diningReg;
		this.user_diningHp = user_diningHp;
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
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
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
	public String getUser_diningName() {
		return user_diningName;
	}
	public void setUser_diningName(String user_diningName) {
		this.user_diningName = user_diningName;
	}
	public String getUser_diningAddr() {
		return user_diningAddr;
	}
	public void setUser_diningAddr(String user_diningAddr) {
		this.user_diningAddr = user_diningAddr;
	}
	public String getUser_diningReg() {
		return user_diningReg;
	}
	public void setUser_diningReg(String user_diningReg) {
		this.user_diningReg = user_diningReg;
	}
	public String getUser_diningHp() {
		return user_diningHp;
	}
	public void setUser_diningHp(String user_diningHp) {
		this.user_diningHp = user_diningHp;
	}
}
