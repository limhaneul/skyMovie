package Board;

import java.sql.Date;

public class GoodsBean {

	private int num;
	private int type;
	private String id;
	private String subject;
	private String content;
	private int readcount;
	private Date joindate;
	private int up ;
	private String ip ;
	private String realsave;	
	private String path;
	private int rea;
	
	
	public GoodsBean(){}
	
	
	public GoodsBean(int num, int type, String id, String subject, String content, int readcount, Date joindate, int up,
			String ip, String realsave, String path ,int rea) {
		
		this.num = num;
		this.type = type;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.joindate = joindate;
		this.up = up;
		this.ip = ip;
		this.realsave = realsave;
		this.path = path;
		this.rea = rea;
	}
	
	
	public GoodsBean(int num, int type, String id, String subject, String content, int readcount, Date joindate, int up,
			String ip, String realsave, String path) {
		
		this.num = num;
		this.type = type;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.joindate = joindate;
		this.up = up;
		this.ip = ip;
		this.realsave = realsave;
		this.path = path;
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
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getRealsave() {
		return realsave;
	}
	public void setRealsave(String realsave) {
		this.realsave = realsave;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	
	
	
	
}
