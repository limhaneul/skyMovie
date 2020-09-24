package Board;

import java.sql.Date;

public class BoardBean {

	private int num;
	private String id;
	private String subject;
	private String content;
	private int readcount;
	private Date joindate;
	private int type ;
	private int up;
	private String grade ;
	private String ip ;
	private int rea;
	
	public BoardBean() {}
	
	public BoardBean(int num, String id, String subject, String content, int readcount, Date joindate, int type, int up,
			String grade, String ip) {
		this.num = num;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.joindate = joindate;
		this.type = type;
		this.up = up;
		this.grade = grade;
		this.ip = ip;
	}
	public BoardBean(int num, String id, String subject, String content, int readcount, Date joindate, int type, int up,
			String grade, String ip,int rea) {
		this.num = num;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.joindate = joindate;
		this.type = type;
		this.up = up;
		this.grade = grade;
		this.ip = ip;
		this.rea=rea;
	}

	public int getRea() {
		return rea;
	}

	public void setRea(int rea) {
		this.rea = rea;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	

	
	
}
