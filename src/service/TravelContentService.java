package service;

import java.util.List;

import dao.ContentDao;
import vo.ContentDetailVO;
import vo.ContentVO;

//2017/10/23 생성

public class TravelContentService {
	private ContentDao dao = ContentDao.getInstance();
	//////////////////////////////////////////////////////////////////////////////
	// singleton 패턴 적용
	private static TravelContentService instance = new TravelContentService();

	public static TravelContentService getInstance() {
		return instance;
	}
	
	private TravelContentService() {
		
	}
	//////////////////////////////////////////////////////////////////////////////
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
}
