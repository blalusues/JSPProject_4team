package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vo.CommentVO;
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
	// 조회수 순으로 페이지 만들기 
	public int selectContentCount() {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENT";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectContentCount 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	public List<ContentVO> selectContentList(int startRow, int count){
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION"
			     + ",START_DATE,EMAIL FROM CONTENT ORDER BY READ_COUNT DESC LIMIT ?,?";
		
		List<ContentVO> contentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContentVO content = new ContentVO();
				content.setContent_no(rs.getInt(1));
				content.setTitle(rs.getString(2));
				content.setRead_count(rs.getInt(3));
				content.setWriter(rs.getString(4));
				content.setWrite_time(rs.getDate(5));
				content.setMain_img(rs.getString(6));
				content.setLocation(rs.getString(7));
				content.setStart_date(rs.getString(8));
				content.setEmail(rs.getString(9));
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectContentList 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// 글 검색 페이지 만들기
	public int selectSearchCount(String search) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENT WHERE TITLE LIKE concat ('%', ?, '%')";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectSearchCount 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	public List<ContentVO> selectSearchList(String search, int startRow, int count) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION"
				+ ",START_DATE,EMAIL FROM CONTENT WHERE TITLE LIKE concat ('%', ?, '%') "
				+ "ORDER BY READ_COUNT DESC LIMIT ?,?";
		
		List<ContentVO> contentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContentVO content = new ContentVO();
				content.setContent_no(rs.getInt(1));
				content.setTitle(rs.getString(2));
				content.setRead_count(rs.getInt(3));
				content.setWriter(rs.getString(4));
				content.setWrite_time(rs.getDate(5));
				content.setMain_img(rs.getString(6));
				content.setLocation(rs.getString(7));
				content.setStart_date(rs.getString(8));
				content.setEmail(rs.getString(9));
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectSearchList 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// 카테고리 검색(location select)
	public int selectCategoryCount(String category) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENT WHERE LOCATION=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectCategoryCount 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	public List<ContentVO> selectCategoryList(String category, int startRow, int count) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION"
				+ ",START_DATE,EMAIL FROM CONTENT WHERE LOCATION=? ORDER BY READ_COUNT DESC LIMIT ?,?";
		
		List<ContentVO> contentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContentVO content = new ContentVO();
				content.setContent_no(rs.getInt(1));
				content.setTitle(rs.getString(2));
				content.setRead_count(rs.getInt(3));
				content.setWriter(rs.getString(4));
				content.setWrite_time(rs.getDate(5));
				content.setMain_img(rs.getString(6));
				content.setLocation(rs.getString(7));
				content.setStart_date(rs.getString(8));
				content.setEmail(rs.getString(9));
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectCategoryList 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// 타이틀, 지역 검색
	public int selectAllSearchCount(String search, String category) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENT WHERE TITLE LIKE concat ('%', ?, '%') AND "
				+ "LOCATION=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, category);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectAllSearchCount 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	public List<ContentVO> selectAllSearchList(String search, String category, int startRow, 
			int count) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION "
				+ ",START_DATE,EMAIL FROM CONTENT WHERE TITLE LIKE concat ('%', ?, '%') AND LOCATION=? "
				+ "ORDER BY READ_COUNT DESC LIMIT ?,?";
		
		List<ContentVO> contentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, category);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContentVO content = new ContentVO();
				content.setContent_no(rs.getInt(1));
				content.setTitle(rs.getString(2));
				content.setRead_count(rs.getInt(3));
				content.setWriter(rs.getString(4));
				content.setWrite_time(rs.getDate(5));
				content.setMain_img(rs.getString(6));
				content.setLocation(rs.getString(7));
				content.setStart_date(rs.getString(8));
				content.setEmail(rs.getString(9));
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectAllSearchList 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
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
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentDetailList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	//작성자,날짜,조회수 등등 select
	public ContentVO contentSelect(int contentNumber) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION"
				+ ",START_DATE,EMAIL FROM CONTENT WHERE CONTENT_NO=?";
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
				content.setWriter(rs.getString(4));
				content.setWrite_time(rs.getTimestamp(5));
				content.setMain_img(rs.getString(6));
				content.setLocation(rs.getString(7));
				content.setStart_date(rs.getString(8));
				content.setEmail(rs.getString(9));
			}
		} catch (SQLException e) {
			System.out.println("ContentDao contentSelect 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
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
		String sql = "INSERT INTO CONTENT(TITLE, WRITER, WRITE_TIME, MAIN_IMG, READ_COUNT, "
				+ "LOCATION,START_DATE,EMAIL) VALUES(?,?,?,?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content.getTitle());
			pstmt.setString(2, content.getWriter());
			pstmt.setTimestamp(3, new Timestamp(content.getWrite_time().getTime()));
			pstmt.setString(4, content.getMain_img());
			pstmt.setInt(5, content.getRead_count());
			pstmt.setString(6, content.getLocation());
			pstmt.setString(7, content.getStart_date());
			pstmt.setString(8, content.getEmail());
			
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
		String sql = "INSERT INTO CONTENTDETAIL(CONTENT_NO,DAY,CONTENT,PATH) "
				       + "VALUES(?,?,?,?)";
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
//댓글
	public int insertComment(CommentVO comment) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "INSERT INTO CMT(BRDNO,WRITER,CONTENT,WRITE_DATE,EMAIL) "
				     + "VALUES(?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment.getBrdNo());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContent());
			pstmt.setTimestamp(4, new Timestamp(comment.getWrite_date().getTime()));
			pstmt.setString(5, comment.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertComment 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
		}
		return result;
	}
	
	public List<CommentVO> selectComment(int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT COMNO,WRITER,CONTENT,WRITE_DATE,EMAIL FROM CMT WHERE BRDNO = ? "
					+"ORDER BY COMNO DESC";
		List<CommentVO> commentList = new ArrayList<>();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setCommentNum(rs.getInt(1));
				comment.setWriter(rs.getString(2));
				comment.setContent(rs.getString(3));
				comment.setWrite_date(rs.getTimestamp(4));
				comment.setEmail(rs.getString(5));

				commentList.add(comment);
			}
		} catch (SQLException e) {
			System.out.println("select list 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeRs(rs);
		}
		return commentList;
	}
	
	public int deleteComment(CommentVO comment) {
		con = DBUtil.makeConnection();
		int result=0;
		String sql = "DELETE FROM CMT WHERE COMNO = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment.getCommentNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteComment 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
		}
		return result;
	}

	public int updateContent(ContentVO content) {
		con = DBUtil.makeConnection();
		int result =0;
		String sql = "UPDATE CONTENT SET TITLE=?, WRITE_TIME=?, MAIN_IMG=? WHERE CONTENT_NO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content.getTitle());
			pstmt.setTimestamp(2, new Timestamp(content.getWrite_time().getTime()));
			pstmt.setString(3, content.getMain_img());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("dao updateContent 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}

	public int updateContentDetail(ContentDetailVO content) {
		con = DBUtil.makeConnection();
		int result =0;
		String sql = "UPDATE CONTENTDETAIL SET CONTENT=?, PATH=? WHERE CONTENT_NO=? AND DAY=?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content.getContent());
			pstmt.setString(2, content.getPath());
			pstmt.setInt(3, content.getContent_no());
			pstmt.setInt(4, content.getDay());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("dao updateContentdeTail 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeRs(rs);
			DBUtil.closeCon(con);
		}
		return result;
		
		
	}
	//day 개수 뽑기
	public int selectDayNumber(int content_no) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENTDETAIL WHERE CONTENT_NO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, content_no);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeRs(rs);
			DBUtil.closeCon(con);
		}
		return result;
	}

	public int insertDay(int contentNum,ContentDetailVO detail) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "INSERT INTO CONTENTDETAIL(CONTENT_NO,DAY,CONTENT,PATH) VALUES(?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNum);
			pstmt.setInt(2, detail.getDay());
			pstmt.setString(3, detail.getContent());
			pstmt.setString(4, detail.getPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("DAO insertDay 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}

	public int deleteDay(ContentDetailVO detail,int contentNum) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "DELETE FROM CONTENTDETAIL WHERE DAY = ? AND CONTENT_NO =? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, detail.getDay());
			pstmt.setInt(2, contentNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("DAO deleteDay 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
		}
		return result;
	
	}
	/////////////////////////////////////////////////////////////////////////
	public int delContent(int contentNum) {
		con = DBUtil.makeConnection();
		int result =0;
		String sql = "DELETE FROM CONTENT WHERE CONTENT_NO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delContent 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
		}
		return result;
	}
	
	public int delContentDetail(int contentNum) {
		con = DBUtil.makeConnection();
		int result =0;
		String sql = "DELETE FROM CONTENTDETAIL WHERE CONTENT_NO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delContent 에러");
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
			DBUtil.closePstmt(pstmt);
		}
		return result;
	}


}
