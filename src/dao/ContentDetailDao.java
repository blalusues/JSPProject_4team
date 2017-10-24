package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//10�� 23�� ���̺� ContentDetail
//content_no(int)(�ܷ�Ű �����ϴ� ���̺� Content),day(int),content(varchar),path(varchar)

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
