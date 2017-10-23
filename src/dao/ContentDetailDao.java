package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//10월 23일 테이블 ContentDetail
//content_no(int)(외래키 참조하는 테이블 Content),day(int),content(varchar),path(varchar)

public class ContentDetailDao {
	// singleton
	private static ContentDetailDao instance;

	public static ContentDetailDao getInstance() {
		if (instance == null)
			instance = new ContentDetailDao();
		return instance;
	}

	private ContentDetailDao() {
	}

	///////////////////////////////////////////////////////////
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	/////////////////////////////////////////////////////////
}
