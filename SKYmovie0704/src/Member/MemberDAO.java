package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	private Connection con=null;
	private DataSource ds =null;
	private PreparedStatement ps=null;
	private ResultSet rs = null;
	private String sql ="";
	
	
	
	private void closeData() {
		
			try {
				if(rs !=null)
					rs.close();
				
				if(ps !=null)
					ps.close();
				
				if(con !=null)
					con.close();
				
				
			} catch (SQLException e) {
				System.out.println("closeData()메소드 진행 중 오류"+e);
			}
		
		
		
		
	}
	
	
	private Connection getConnection() throws Exception {
		Connection con=null;
		
		Context init = new InitialContext();
		
		ds =(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con =ds.getConnection();
		
		return con;
	}
	
	
	
	public void insertMember(MemberBean mb) {
		int num;
		
		try {
			con=getConnection();
			
			sql ="select max(num) from skymember";
			
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}	
			sql="insert into skyMember values(?,?,?,?,?,?,?,?,?,?,?,?,?, now() )";

			ps=con.prepareStatement(sql);
			
			ps.setInt(1,num);
			ps.setString(2,mb.getId());
			ps.setString(3,mb.getPasswd());
			ps.setString(4,mb.getEmail());
			ps.setString(5,mb.getAddress1());
			ps.setString(6,mb.getAddress2());
			ps.setString(7,mb.getAddress3());
			ps.setString(8,mb.getAddress4());
			ps.setString(9,mb.getName());
			ps.setString(10,mb.getSubname());
			ps.setInt(11,mb.getAge());
			ps.setString(12,mb.getGender());
			ps.setString(13,mb.getTel());
			
			ps.executeUpdate();		
			
			
		} catch (Exception e) {
		System.out.println("insertMember() 구문에서 실행 오류"+e);
		}finally {
			closeData();
		}

	}//insertMember();끝
	
	public int loginID(String id ,String pw) {
		int check=0;
		
		//아이디만있으면 0 로그인성공시 1 아이디조차도 없으면 2
		
		try {
			con =getConnection();
			
			sql="select id,passwd from skymember where id=?";
			
			
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,id);
			
			rs=ps.executeQuery();
			
			if(rs.next())//아이디가 있다
			{	
				
				if(rs.getString(2).equals(pw)) //비밀번호도 맞다
				{
					check=1;
				}
				else 
				{
					check=0;//비밀번호가 틀리다
				}
				
				
				
				
			}else {
				check=2;//존재하지않는 아이디입니다
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("loginID() 구문에서 실행 오류"+e);
			}finally {
				closeData();
			}
		
		
		return check;
	}//loginID()메소드 끝
	

	
	
	public int IDcheck(String id) {
		int check=0;
		
		
		
		try {
			con = getConnection();
			
			
			sql="select id from skyMember where id=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,id);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				check=1;
				return check;
			}
			
		} catch (Exception e) {
			System.out.println("IDcheck() 구문에서 실행 오류"+e);
			}finally {
				closeData();
		}
		
		
		
		
		
		
		
		return check;
		
	}//IDcheck();
	
	
	public int SUBcheck(String sub) {
		int check=0;
		
		try {
			con = getConnection();
			
			
			sql="select subname from skyMember where subname=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,sub);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				check=1;
				return check;
			}
			
		} catch (Exception e) {
			System.out.println("SUBcheck() 구문에서 실행 오류"+e);
			}finally {
				closeData();
		}
		
		
		
		
		
		
		
		return check;
		
	}//SUBcheck();
	
	
	public List MemberList(String id){
		List list = new ArrayList();
		try {
			con=getConnection();
			sql="select * from skyMember where id=?";
		   
		   ps=con.prepareStatement(sql);
		   
		   ps.setString(1, id);
		   
		   
		   rs= ps.executeQuery();
		   
		  while(rs.next()) {
			   
			
			 MemberBean mb =new MemberBean(rs.getInt(1),
					 						rs.getString("id"),
					 						rs.getString("passwd"),
					 						rs.getString("email"), 
					 						rs.getString("address1"),
					 						rs.getString("address2"),
					 						rs.getString("address3"),
					 						rs.getString("address4"),
					 						rs.getString("name"), 
					 						rs.getString("subname"),
					 						rs.getInt("age"), 
					 						rs.getString("gender"), 
					 						rs.getString("tel"), 
					 						rs.getDate("joindate"));
			   
			   list.add(mb);
		   }
		   
		} 
		catch (Exception e) {
			System.out.println("MemberList() 구문에서 실행 오류"+e);
		}
		finally 
		{
				closeData();
		}
		
		
		return list;
		
	}//MemberList()
	
	
	public void updateMember(String id,String subname,int age,String address1,String address2,String address3,String address4,String tel) {
		
		
		try {
			con=getConnection();
			
			sql="update skyMember set "
					+ "subname = ? ,"
					+ "age = ?, "
					+ "address1 = ? ,"
					+ "address2 = ? ,"
					+ "address3 = ? ,"
					+ "address4 = ? ,"
					+ "tel = ? "
					+ "where id = ? ";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,subname);
			ps.setInt(2,age);
			ps.setString(3,address1);
			ps.setString(4,address2);
			ps.setString(5,address3);
			ps.setString(6,address4);
			ps.setString(7,tel);
			ps.setString(8,id);

			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberList() 구문에서 실행 오류"+e);
		}
		finally 
		{
				closeData();
		}
		
		
		
		
		
		
	}//UPdateMember
	
	public int deleteMember(String id ,String pwd){
		int check=0;
		
		
		try {
			con=getConnection();
			
			sql="select id,passwd from skyMember where id = ? and  "
					+ " passwd = ? ";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,id);
			ps.setString(2,pwd);
			
			rs=ps.executeQuery();
			
			
			if(rs.next()){
				
				sql="delete from skyMember where id = ?";
				
				ps=con.prepareStatement(sql);
				
				ps.setString(1, id);
				ps.executeUpdate();
				
				check=1;
				
				return check;
				
			}
			
			
			
		}catch (Exception e) {
			System.out.println("deleteMember() 구문에서 실행 오류"+e);
		}
		finally 
		{
				closeData();
		}
		
		return check;
		
		
	}//deleteMember
	
	
	public int updatePwd(String id ,String pwd1 ,String pwd2){
		int check=0;
		
		
		try {
			con=getConnection();
			
			sql="select id,passwd from skyMember where id=? and passwd = ? ";
		
			ps=con.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, pwd1);
			
			rs=ps.executeQuery();
			
			if(rs.next()){
				
				sql="update skyMember set passwd=? where id=?";
				
				ps=con.prepareStatement(sql);
				ps.setString(1, pwd2);
				ps.setString(2, id);
				
				ps.executeUpdate();
				check=1;
				return check;
				
			}
			
			
		} catch (Exception e) {
			System.out.println("updatePwd() 구문에서 실행 오류"+e);
		}
		finally 
		{
				closeData();
		}
		
		
		
		return check;
	}//updatePwd
	
	public int emailCheck(String email) {
		int check=0;
		
		
		
		try {
			con = getConnection();
			
			
			sql="select id from skyMember where email=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,email);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				check=1;
				return check;
			}
			
		} catch (Exception e) {
			System.out.println("emailCheck() 구문에서 실행 오류"+e);
			}finally {
				closeData();
		}
		
		
		
		
		
		
		
		return check;
		
	}
	
}//CLASS 끝


