package rest.model;

public class BlogBean {

	private String bloggername;
	private String postdate;
	private String bloggerlink;
	private String title;
	private String description;
	private String link;
	
	
	
	public BlogBean() {
		super();
	}
	public BlogBean(String bloggername, String postdate, String bloggerlink, String title, String description,
			String link) {
		super();
		this.bloggername = bloggername;
		this.postdate = postdate;
		this.bloggerlink = bloggerlink;
		this.title = title;
		this.description = description;
		this.link = link;
	}
	public String getBloggername() {
		return bloggername;
	}
	public void setBloggername(String bloggername) {
		this.bloggername = bloggername;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public String getBloggerlink() {
		return bloggerlink;
	}
	public void setBloggerlink(String bloggerlink) {
		this.bloggerlink = bloggerlink;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	
	
}


