package vo;

import java.util.Date;

public class CommentVO {
	private int brdNo;
	private int commentNum;
	private String writer;
	private String content;
	private Date write_date;
	////////////////////////////////////////////////////////////
	public CommentVO(int brdNo, int commentNum, String writer, String content, Date write_date) {
		super();
		this.brdNo = brdNo;
		this.commentNum = commentNum;
		this.writer = writer;
		this.content = content;
		this.write_date = write_date;
	}
	public CommentVO() {}
	//////////////////////////////////////////////////////////////
	public int getBrdNo() {
		return brdNo;
	}
	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "CommentVO [brdNo=" + brdNo + ", commentNum=" + commentNum + ", writer=" + writer + ", content="
				+ content + ", write_date=" + write_date + "]";
	}
}
