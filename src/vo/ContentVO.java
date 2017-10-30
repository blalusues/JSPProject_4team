package vo;

import java.util.Date;

//10/23 »ý¼º

public class ContentVO {
	int content_no;  //auto
	String title;
	int read_count;
	String writer;
	Date write_time;
	String main_img;
	String location;
	String start_date;
	String end_date;

	/////////////////////////////////////////////////////////////////////////////////////////////
	public ContentVO(int content_no, String title, int read_count, String writer, Date write_time, String main_img,
			String location, String start_date, String end_date) {
		super();
		this.content_no = content_no;
		this.title = title;
		this.read_count = read_count;
		this.writer = writer;
		this.write_time = write_time;
		this.main_img = main_img;
		this.location = location;
		this.start_date = start_date;
		this.end_date = end_date;
	}


	public ContentVO() {
	}
	///////////////////////////////////////////////////////////////////////////////////////////
	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "ContentVO [content_no=" + content_no + ", title=" + title + ", read_count=" + read_count + ", writer="
				+ writer + ", write_time=" + write_time + ", main_img=" + main_img + ", location=" + location
				+ ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}

	
}
