package Board;

import java.sql.Date;

public class ReplyBean {

	private int num;
	private int type;
	private int renum;
	private String id; 
	private String subcontent;	
	private int re_ref;//그룹번호
	private int re_lev;//들여쓰기
	private int re_seq;//그룹내의 순서
	private int up;
	private Date datetime;	

	public ReplyBean(){}
	
	
	
	public ReplyBean(int num, int type, String id, String subcontent, int up) {
		super();
		this.num = num;
		this.type = type;
		this.id = id;
		this.subcontent = subcontent;
		this.up = up;
	}
	
	public int getRenum() {
		return renum;
	}



	public void setRenum(int renum) {
		this.renum = renum;
	}



	public int getRe_ref() {
		return re_ref;
	}



	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}



	public int getRe_lev() {
		return re_lev;
	}



	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}



	public int getRe_seq() {
		return re_seq;
	}



	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}



	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubcontent() {
		return subcontent;
	}
	public void setSubcontent(String subcontent) {
		this.subcontent = subcontent;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	
	
	
	


}
