package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
