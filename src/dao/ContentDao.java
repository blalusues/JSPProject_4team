package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//10�� 23�� ���̺� Content
//content_no(int auto_increment, primary key),title(varchar),read_count(int),
//writer(varchar),write_time(date),main_img(varchar) 	

public class ContentDao {
	// singleton
	private static ContentDao instance;

	public static ContentDao getInstance() {
		if (instance == null)
			instance = new ContentDao();
		return instance;
	}

	private ContentDao() {
	}

	///////////////////////////////////////////////////////////
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	/////////////////////////////////////////////////////////
}
