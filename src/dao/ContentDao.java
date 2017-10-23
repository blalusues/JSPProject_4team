package dao;

import java.sql.Date;

//10월 23일 테이블 Content
//content_no(int auto_increment, primary key),title(varchar),read_count(int),
//writer(varchar),write_time(date),main_img(varchar) 	

public class ContentDao {
	int content_no;
	String title;
	int read_count;
	String writer;
	Date write_time;
	String main_img;
	////////////////////////////////////////////////////////////////////////
}
