package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import vo.ContentDetailVO;
import vo.ContentVO;

public class ContentDao {
	// singleton
	private static ContentDao instance;

	public static ContentDao getInstance() {
		if (instance == null)
			instance = new ContentDao();
		return instance;
	}

	 private ContentDao() {
	        DBUtil.loadDriver(); // mysql 드라이버 로딩 
	    }
//////////////////////////////////////////////////////////////////////////////////////////////
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//////////////////////////////////////////////////////////////////////////////////////////////
    //후기 내용,day,경로 select
	public List<ContentDetailVO> contentDetailSelect(int contentNumber){
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,DAY,CONTENT,PATH FROM CONTENTDETAIL "
					 + "WHERE CONTENT_NO = ? ORDER BY DAY ASC";
		
		List<ContentDetailVO> contentDetailList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNumber);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ContentDetailVO contentDetail = new ContentDetailVO();
				contentDetail.setContent_no(rs.getInt(1));
				contentDetail.setDay(rs.getInt(2));
				contentDetail.setContent(rs.getString(3));
				contentDetail.setPath(rs.getString(4));
				
				contentDetailList.add(contentDetail);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao contentDetailSelect 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeRs(rs);
		}
		return contentDetailList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	//작성자,날짜,조회수 등등 select
	public ContentVO contentSelect(int contentNumber) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION "
				     + "FROM CONTENT WHERE CONTENT_NO=?";
		ContentVO content = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNumber);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				content = new ContentVO();
				content.setContent_no(rs.getInt(1));
				content.setTitle(rs.getString(2));
				content.setRead_count(rs.getInt(3));
				content.setWrite_time(rs.getTimestamp(4));
				content.setMain_img(rs.getString(5));
				content.setLocation(rs.getString(6));
			}
		} catch (SQLException e) {
			System.out.println("ContentDao contentSelect 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeRs(rs);
		}
		return content;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	//조회수 증가
	public int updateReadCount(int contentNumber){
		con = DBUtil.makeConnection();
		String sql = "UPDATE CONTENT SET READ_COUNT=READ_COUNT+1 WHERE CONTENT_NO=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNumber);

			result = pstmt.executeUpdate(); // SQL 실행
		} catch (SQLException e) {
			System.out.println("ContentDao updateReadCount 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// 글쓰기(테이블 두 개에 다 추가되어야 함)
	// content 테이블에 추가 (작성에 한번만 실행)
	public int insertContent(ContentVO content) {
		con = DBUtil.makeConnection();
		String sql = "INSERT INTO CONTENT(TITLE, WRITER, WRTIE_TIME, MAIN_IMG, READ_COUNT) "
				+ "VALUES(?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content.getTitle());
			pstmt.setString(2, content.getWriter());
			pstmt.setTimestamp(3, new Timestamp(content.getWrite_time().getTime()));
			pstmt.setString(4, content.getMain_img());
			pstmt.setInt(5, content.getRead_count());
			
			result = pstmt.executeUpdate(); // SQL 실행
		} catch (SQLException e) {
			System.out.println("ContentDao insertContent 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	// 방금 전에 쓴 글번호 받아오기
	public int selectMaxContentNo() {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT MAX(CONTENT_NO) FROM CONTENT";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectMaxContentNo 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	// contentDetail 테이블에 추가 (작성에 Day마다 실행) 
	public int insertDetail(ContentDetailVO detail) {
		con = DBUtil.makeConnection();
		String sql = "INSERT INTO CONTENTDETAIL(CONTENT_NO, DAY, CONTENT, PATH) VALUES(?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, detail.getContent_no());
			pstmt.setInt(2, detail.getDay());
			pstmt.setString(3, detail.getContent());
			pstmt.setString(4, detail.getPath());
			
			result = pstmt.executeUpdate(); // SQL 실행
		} catch (SQLException e) {
			System.out.println("ContentDao insertDetail 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
}
