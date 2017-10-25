package dao;

import java.sql.*;
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
		 DBUtil.loadDriver(); // mysql ����̹� �ε� 
	 }
//////////////////////////////////////////////////////////////////////////////////////////////
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//////////////////////////////////////////////////////////////////////////////////////////////
	// ��ȸ�� ������ ������ ����� 
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
			System.out.println("ContentDao selectContentCount ����");
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
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION "
			     + "FROM CONTENT ORDER BY READ_COUNT DESC LIMIT ?,?";
		
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
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectContentList ����");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// �� �˻� ������ �����
	public int selectSearchCount(String searchTitle) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENT WHERE TITLE LIKE concat ('%', ?, '%')";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, searchTitle);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectSearchCount ����");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	public List<ContentVO> selectSearchList(String searchTitle, int startRow, int count) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION "
				+ "FROM CONTENT WHERE TITLE LIKE concat ('%', ?, '%') ORDER BY READ_COUNT DESC LIMIT ?,?";
		
		List<ContentVO> contentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, searchTitle);
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
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectSearchList ����");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// ī�װ� �˻�(location select)
	public int selectLocationCount(String location) {
		con = DBUtil.makeConnection();
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CONTENT WHERE LOCATION=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, location);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("ContentDao selectSearchCount ����");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	public List<ContentVO> selectLocationList(String location, int startRow, int count) {
		con = DBUtil.makeConnection();
		String sql = "SELECT CONTENT_NO,TITLE,READ_COUNT,WRITER,WRITE_TIME,MAIN_IMG,LOCATION "
				+ "FROM CONTENT WHERE LOCATION=? ORDER BY READ_COUNT DESC LIMIT ?,?";
		
		List<ContentVO> contentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, location);
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
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			System.out.println("ContentDao selectLocationList ����");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
    //�ı� ����,day,��� select
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
			System.out.println("ContentDao contentDetailSelect ����");
			e.printStackTrace();
		}finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return contentDetailList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	//�ۼ���,��¥,��ȸ�� ��� select
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
				content.setWriter(rs.getString(4));
				content.setWrite_time(rs.getTimestamp(5));
				content.setMain_img(rs.getString(6));
				content.setLocation(rs.getString(7));
			}
		} catch (SQLException e) {
			System.out.println("ContentDao contentSelect ����");
			e.printStackTrace();
		}finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return content;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	//��ȸ�� ����
	public int updateReadCount(int contentNumber){
		con = DBUtil.makeConnection();
		String sql = "UPDATE CONTENT SET READ_COUNT=READ_COUNT+1 WHERE CONTENT_NO=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNumber);

			result = pstmt.executeUpdate(); // SQL ����
		} catch (SQLException e) {
			System.out.println("ContentDao updateReadCount ����");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
//////////////////////////////////////////////////////////////////////////////////////////////
	// �۾���(���̺� �� ���� �� �߰��Ǿ�� ��)
	// content ���̺� �߰� (�ۼ��� �ѹ��� ����)
	public int insertContent(ContentVO content) {
		con = DBUtil.makeConnection();
		String sql = "INSERT INTO CONTENT(TITLE, WRITER, WRITE_TIME, MAIN_IMG, READ_COUNT, "
				+ "LOCATION) VALUES(?,?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content.getTitle());
			pstmt.setString(2, content.getWriter());
			pstmt.setTimestamp(3, new Timestamp(content.getWrite_time().getTime()));
			pstmt.setString(4, content.getMain_img());
			pstmt.setInt(5, content.getRead_count());
			pstmt.setString(6, content.getLocation());
			
			result = pstmt.executeUpdate(); // SQL ����
		} catch (SQLException e) {
			System.out.println("ContentDao insertContent ����");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	// ��� ���� �� �۹�ȣ �޾ƿ���
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
			System.out.println("ContentDao selectMaxContentNo ����");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	// contentDetail ���̺� �߰� (�ۼ��� Day���� ����) 
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
			
			result = pstmt.executeUpdate(); // SQL ����
		} catch (SQLException e) {
			System.out.println("ContentDao insertDetail ����");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
//////////////////////////////////////////////////////////////////////////////////////////////


}
