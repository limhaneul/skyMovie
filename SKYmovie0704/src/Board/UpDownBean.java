package Board;

public class UpDownBean {
	
	
	private int num;
	private int type;
	private String id;
	private String updown;
	private int sumUP;
	private int sumDown;
	
	
	public int getSumUP() {
		return sumUP;
	}


	public void setSumUP(int sumUP) {
		this.sumUP = sumUP;
	}


	public int getSumDown() {
		return sumDown;
	}


	public void setSumDown(int sumDown) {
		this.sumDown = sumDown;
	}


	public UpDownBean(int num, int type, String id, String updown) {
		super();
		this.num = num;
		this.type = type;
		this.id = id;
		this.updown = updown;
	}


	public UpDownBean(){}
	
	
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
	public String getUpdown() {
		return updown;
	}
	public void setUpdown(String updown) {
		this.updown = updown;
	}
	
	
	
	

}
