package rest.model;

public class RestBean {

	private int restNum ;
	private String restmainimg;
	private String restimg;
	private String restname;
	private String restmenu ;
	private String restprice;
	private String restkeyword;
	private String resttime1 ;
	private String resttime2 ;
	private String restadress;
	private String resttel ;
	private String resttag ;
	private int restlike;
	
	
	
	
	
	public RestBean() {
		super();
	}

	
	
	public RestBean(int restNum, String restmainimg, String restimg, String restname, String restmenu, String restprice,
			String restkeyword, String resttime1, String resttime2, String restadress, String resttel, String resttag,
			int restlike) {
		super();
		this.restNum = restNum;
		this.restmainimg = restmainimg;
		this.restimg = restimg;
		this.restname = restname;
		this.restmenu = restmenu;
		this.restprice = restprice;
		this.restkeyword = restkeyword;
		this.resttime1 = resttime1;
		this.resttime2 = resttime2;
		this.restadress = restadress;
		this.resttel = resttel;
		this.resttag = resttag;
		this.restlike = restlike;
	}
	public int getRestlike() {
		return restlike;
	}
	public void setRestlike(int restlike) {
		this.restlike = restlike;
	}
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getRestmainimg() {
		return restmainimg;
	}
	public void setRestmainimg(String restmainimg) {
		this.restmainimg = restmainimg;
	}
	public String getRestimg() {
		return restimg;
	}
	public void setRestimg(String restimg) {
		this.restimg = restimg;
	}
	public String getRestname() {
		return restname;
	}
	public void setRestname(String restname) {
		this.restname = restname;
	}
	public String getRestmenu() {
		return restmenu;
	}
	public void setRestmenu(String restmenu) {
		this.restmenu = restmenu;
	}
	public String getRestprice() {
		return restprice;
	}
	public void setRestprice(String restprice) {
		this.restprice = restprice;
	}
	public String getRestkeyword() {
		return restkeyword;
	}
	public void setRestkeyword(String restkeyword) {
		this.restkeyword = restkeyword;
	}
	public String getResttime1() {
		return resttime1;
	}
	public void setResttime1(String resttime1) {
		this.resttime1 = resttime1;
	}
	public String getResttime2() {
		return resttime2;
	}
	public void setResttime2(String resttime2) {
		this.resttime2 = resttime2;
	}
	public String getRestadress() {
		return restadress;
	}
	public void setRestadress(String restadress) {
		this.restadress = restadress;
	}
	public String getResttel() {
		return resttel;
	}
	public void setResttel(String resttel) {
		this.resttel = resttel;
	}
	public String getResttag() {
		return resttag;
	}
	public void setResttag(String resttag) {
		this.resttag = resttag;
	}
	
	
	
	
}
