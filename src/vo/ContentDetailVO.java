package vo;

//10/23 »ý¼º

public class ContentDetailVO {
	private int content_no;
	private int day;
	private String content;
	private String path;
	private String[] dividePath;
	//////////////////////////////////////////////////////////////////////////////////
	public ContentDetailVO(int content_no, int day, String content, String path) {
		super();
		this.content_no = content_no;
		this.day = day;
		this.content = content;
		this.path = path;
	}

	public ContentDetailVO() {
	}
	////////////////////////////////////////////////////////////////////////////////////

	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	public String[] getDividePath() {
		return dividePath;
	}

	public void setDividePath(String[] dividePath) {
		this.dividePath = dividePath;
	}

	@Override
	public String toString() {
		return "ContentDetailVO [content_no=" + content_no + ", day=" + day + ", content=" + content + ", path=" + path
				+ "]";
	}

}
