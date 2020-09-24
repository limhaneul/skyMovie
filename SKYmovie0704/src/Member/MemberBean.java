package Member;

import java.sql.Date;

public class MemberBean {
	
	private int num;
	private String id; 
	private String passwd;
	private String email;
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	private String name;
	private String subname;
	private int age;	
	private String gender;
	private String tel;
	private Date joindate;
	
	public MemberBean() {}
	
	public MemberBean(String id, String passwd, String email, String address1, String address2,
			String address3, String address4, String name, String subname, int age, String gender, String tel) {
		this.id = id;
		this.passwd = passwd;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.name = name;
		this.subname = subname;
		this.age = age;
		this.gender = gender;
		this.tel = tel;
	}

	public MemberBean(int num, String id, String passwd, String email, String address1, String address2,
			String address3, String address4, String name, String subname, int age, String gender, String tel,
			Date joindate) {
		super();
		this.num = num;
		this.id = id;
		this.passwd = passwd;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.name = name;
		this.subname = subname;
		this.age = age;
		this.gender = gender;
		this.tel = tel;
		this.joindate = joindate;
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubname() {
		return subname;
	}
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getAddress4() {
		return address4;
	}

	public void setAddress4(String address4) {
		this.address4 = address4;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	
	
	
	
}
