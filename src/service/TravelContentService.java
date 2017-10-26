package service;

import java.util.Date;
import java.util.List;

import dao.ContentDao;
import vo.CommentVO;
import vo.ContentDetailVO;
import vo.ContentPageVO;
import vo.ContentVO;

//2017/10/23 생성

public class TravelContentService {
	private ContentDao dao = ContentDao.getInstance();
////////////////////////////////////////////////////////////////////////////////////////////////
	// singleton 패턴 적용
	private static TravelContentService instance = new TravelContentService();

	public static TravelContentService getInstance() {
		return instance;
	}
	
	private TravelContentService() {}
//////////////////////////////////////////////////////////////////////////////////////////////
	private static final int COUNT_PER_PAGE = 6;
	public ContentPageVO makePage(int page) {
		int totalContentCount = dao.selectContentCount(); 
		
		// 총 페이지 수 계산
		int totalPage = totalContentCount / COUNT_PER_PAGE;
		if(totalContentCount % COUNT_PER_PAGE > 0) {
			totalPage++;
		}
		
		// 하단 시작 페이지
		int startPage = (page-1)/10*10 + 1;
		
		// 하단 끝 페이지
		int endPage = startPage + 9;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		// limit 시작행 계산
		int startRow = (page-1)*COUNT_PER_PAGE;
		
		// DB에서 현재 페이지에 보여질 게시글들 조회 
		List<ContentVO> contentList = dao.selectContentList(startRow, COUNT_PER_PAGE);
		
		// 한 페이지에 보여질 모든 데이터 담아서 작업 완료
		return new ContentPageVO(contentList, startPage, endPage, page, totalPage);
	}
	
	public ContentPageVO makeSearchPage(int page, String search) {
		int totalContentCount = dao.selectSearchCount(search); 
		// 총 페이지 수 계산
		int totalPage = totalContentCount / COUNT_PER_PAGE;
		if(totalContentCount % COUNT_PER_PAGE > 0) {
			totalPage++;
		}
		
		// 하단 시작 페이지
		int startPage = (page-1)/10*10 + 1;
		
		// 하단 끝 페이지
		int endPage = startPage + 9;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		// limit 시작행 계산
		int startRow = (page-1)*COUNT_PER_PAGE;
		
		// DB에서 현재 페이지에 보여질 게시글들 조회 
		List<ContentVO> contentList = dao.selectSearchList(search, startRow, COUNT_PER_PAGE);
		// 한 페이지에 보여질 모든 데이터 담아서 작업 완료
		return new ContentPageVO(contentList, startPage, endPage, page, totalPage);
	}
	
	public ContentPageVO makeCategoryPage(int page, String category) {
		int totalContentCount = dao.selectCategoryCount(category); 
		// 총 페이지 수 계산
		int totalPage = totalContentCount / COUNT_PER_PAGE;
		if(totalContentCount % COUNT_PER_PAGE > 0) {
			totalPage++;
		}
		
		// 하단 시작 페이지
		int startPage = (page-1)/10*10 + 1;
		
		// 하단 끝 페이지
		int endPage = startPage + 9;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		// limit 시작행 계산
		int startRow = (page-1)*COUNT_PER_PAGE;
		
		// DB에서 현재 페이지에 보여질 게시글들 조회 
		List<ContentVO> contentList = dao.selectCategoryList(category, startRow, COUNT_PER_PAGE);
		// 한 페이지에 보여질 모든 데이터 담아서 작업 완료
		return new ContentPageVO(contentList, startPage, endPage, page, totalPage);
	}
	
	public List<ContentDetailVO> read(int contentNumber) {
		List<ContentDetailVO> contentDetail = dao.contentDetailSelect(contentNumber);
		return contentDetail;
	}
	
	public ContentVO read(String id,int contentNumber) {
		ContentVO content = dao.contentSelect(contentNumber);
		if (content == null || content.getWriter().equals(id)) {
			return content;
		} else {
			dao.updateReadCount(contentNumber);
			content.setRead_count(content.getRead_count() + 1);
			return content;
		}		
	}
	public ContentVO readWithoutReadCount(int contentNum) {
		return dao.contentSelect(contentNum);
	}
	
	public int write(ContentVO content, List<ContentDetailVO> detailList) {
		int content_no = 0;
		int result = 0;
		
		content.setRead_count(0);
		content.setWrite_time(new Date());
		
		if(dao.insertContent(content) > 0) {
			content_no = dao.selectMaxContentNo();
		}
		
		for(int i=0; i<detailList.size(); i++) {
			ContentDetailVO detail = detailList.get(i);
			detail.setContent_no(content_no);
			detailList.set(i, detail);
			
			if(dao.insertDetail(detailList.get(i)) > 0) {
				result = 1;
			} else {
				result = 0;
				break;
			}
		}
		return result;
	}
	
	public boolean commentSignUp(CommentVO comment) {
		comment.setWrite_date(new Date());
		if (dao.insertComment(comment) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<CommentVO> commentSelect(int articleNum) {
		List<CommentVO> commentList = dao.selectComment(articleNum);
			return commentList;
	}
	
	public boolean commentDelete(CommentVO comment) {
		if(dao.deleteComment(comment)>0) {
			return true;
		}else {
			return false;
		}
	}

	public boolean updateRead(ContentVO content, List<ContentDetailVO> detailList) {
		content.setWrite_time(new Date());
		if((dao.updateContent(content)&&dao.updateContentDetail(detailList))==1) {
			return true;
		}
		return false;
	}
}
