package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mysql.fabric.xmlrpc.base.Array;

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

	private TravelContentService() {
	}

	//////////////////////////////////////////////////////////////////////////////////////////////
	private static final int COUNT_PER_PAGE = 6;

	// 페이지 만들기
	public ContentPageVO makePage(int type, int page, String search, String category) {
		int totalContentCount = 0;

		// type=1 일반, type=2 search, type=3 category, type=4 search+category
		if (type == 1) {
			totalContentCount = dao.selectContentCount();
		} else if (type == 2) {
			totalContentCount = dao.selectSearchCount(search);
		} else if (type == 3) {
			totalContentCount = dao.selectCategoryCount(category);
		} else if (type == 4) {
			totalContentCount = dao.selectAllSearchCount(search, category);
		}

		// 총 페이지 수 계산
		int totalPage = totalContentCount / COUNT_PER_PAGE;
		if (totalContentCount % COUNT_PER_PAGE > 0) {
			totalPage++;
		}

		// 하단 시작 페이지
		int startPage = (page - 1) / 10 * 10 + 1;

		// 하단 끝 페이지
		int endPage = startPage + 9;
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// limit 시작행 계산
		int startRow = (page - 1) * COUNT_PER_PAGE;

		List<ContentVO> contentList = new ArrayList<>();
		// DB에서 현재 페이지에 보여질 게시글들 조회
		if (type == 1) {
			contentList = dao.selectContentList(startRow, COUNT_PER_PAGE);
		} else if (type == 2) {
			contentList = dao.selectSearchList(search, startRow, COUNT_PER_PAGE);
		} else if (type == 3) {
			contentList = dao.selectCategoryList(category, startRow, COUNT_PER_PAGE);
		} else if (type == 4) {
			contentList = dao.selectAllSearchList(search, category, startRow, COUNT_PER_PAGE);
		}
		// 한 페이지에 보여질 모든 데이터 담아서 작업 완료
		return new ContentPageVO(contentList, startPage, endPage, page, totalPage);
	}

	public List<ContentDetailVO> read(int contentNumber) {
		List<ContentDetailVO> contentDetail = dao.contentDetailSelect(contentNumber);
		return contentDetail;
	}

	public ContentVO read(String id, int contentNumber) {
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

		if (dao.insertContent(content) > 0) {
			content_no = dao.selectMaxContentNo();
		}

		for (int i = 0; i < detailList.size(); i++) {
			ContentDetailVO detail = detailList.get(i);
			detail.setContent_no(content_no);
			detailList.set(i, detail);

			if (dao.insertDetail(detailList.get(i)) > 0) {
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
		if (dao.deleteComment(comment) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateRead(ContentVO content, List<ContentDetailVO> detailList) {
		content.setWrite_time(new Date());
		int result = 0;
		if ((dao.updateContent(content) == 1)) {
			for (int i = 0; i < detailList.size(); i++) {
				ContentDetailVO detail = detailList.get(i);
				result = dao.updateContentDetail(detail);
				if (result == 0) {
					return false;
				}
			}
			return true;
		} else {
			return false;
		}
	}

	public int caculateDLNum(int content_no) {
		int result = dao.selectDayNumber(content_no);

		return result;
	}

	public boolean insertDay(int contentNum, List<ContentDetailVO> detailListOther) {
		int result = 0;
		for (int i = 0; i < detailListOther.size(); i++) {
			ContentDetailVO detail = detailListOther.get(i);
			result = dao.insertDay(detail);
			if (result == 0) {
				return false;
			}
		}
		return true;

	}

	public boolean DeleteDay(int contentNum, List<ContentDetailVO> detailListOther) {

		return false;
	}
}
