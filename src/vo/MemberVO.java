package vo;

//10/23 ����

public class MemberVO {
	String id;

	////////////////////////////////////////////////////////////////
	public MemberVO(String id) {
		this.id = id;
	}

	/////////////////////////////////////////////////////////////////////
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + "]";
	}
}
