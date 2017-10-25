package vo;

import java.util.List;

public class ContentPageVO {
	private List<ContentVO> contentList;
	private int startPage;
	private int endPage;
	private int currentPage;
	private int totalPage;
	
	public ContentPageVO() {}
	public ContentPageVO(List<ContentVO> contentList, int startPage, int endPage, int currentPage, int totalPage) {
		super();
		this.contentList = contentList;
		this.startPage = startPage;
		this.endPage = endPage;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
	}
	public List<ContentVO> getContentList() {
		return contentList;
	}
	public void setContentList(List<ContentVO> contentList) {
		this.contentList = contentList;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "ContentPageVO [contentList=" + contentList + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", currentPage=" + currentPage + ", totalPage=" + totalPage + "]";
	}
}
