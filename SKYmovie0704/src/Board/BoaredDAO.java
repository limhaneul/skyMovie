package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.print.attribute.SetOfIntegerSyntax;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import Member.MemberBean;


public class BoaredDAO {
	
	
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
		
		
		
		
	}//closeDate()
	
	
	private Connection getConnection() throws Exception {
		Connection con=null;
		
		Context init = new InitialContext();
		
		ds =(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con =ds.getConnection();
		
		return con;
		
	}//getConnection()
	
	
	
	
	
	


	public void insertFile(FileBean f) {
		
		int type=1;//게시판구분
		int num=0; //글번호
		
		try {
			
			con=getConnection();
			
			sql="select max(num) from numtype where type=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, type);
			
			rs=ps.executeQuery();
			
			if(rs.next()){
				num=rs.getInt(1);
			}else{
				num=1;
			}
			
			sql="insert into skyFile values(?,?,?,?,?)";	
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,num);
			ps.setInt(2,type);
			ps.setString(3,f.getRealsave());
			ps.setString(4,f.getShowsave());
			ps.setString(5,f.getPath());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertFile()메소드에서 오류가 났습니다"+e);
		}finally {
			closeData();
		}
		
		
	}//insertFile
	
	
	
	

	public int getCountFile(int type,int num){//글이 있는지 없는 지 확인
		int number=0;
		
		try {
			
			con=getConnection();
		
			sql="select count(num) from skyFile where type=? and num=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1,type);
			ps.setInt(2,num);
			
			rs=ps.executeQuery();
				
			if(rs.next()){//작성글있을경우에
				number=rs.getInt(1);
				return number;
			}
			
			
		} 
		catch (Exception e) {
			System.out.println("getCountFile()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
		return number;
		
		
	}//getCountFile
	
	
	
		public List<FileBean> getFiles(int num ,int  type){
			List<FileBean> list = new ArrayList<FileBean>();
			
			
			try {
				con=getConnection();
				
				
				sql="select realsave,showsave,path from skyFile where num=? and type =?";
				
				
				ps=con.prepareStatement(sql);
				
				ps.setInt(1,num);
				ps.setInt(2,type);
				
				rs=ps.executeQuery();
				
				while(rs.next()) {
					FileBean f = new FileBean();
					
					f.setRealsave(rs.getString("realsave"));
					f.setShowsave(rs.getString("showsave"));
					f.setPath(rs.getString("Path"));
					
					list.add(f);
				}
				
				
				
			} catch (Exception e) {
				System.out.println("getFiles()메소드에서 오류가 났습니다"+e);
			}finally {
				closeData();
			}
			
			
			
			
			
			
			
			return list;
		}
	
	
	
	
	
	
	
	
	public int InsertReview(BoardBean m){//게시글DB에 게시물추가
		
		int type=1;//게시판구분
		int num=0; //글번호
		int check=0;
		try {
			con=getConnection();
			
			sql="select max(num) from numtype where type=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, type);
			
			rs=ps.executeQuery();

			
			if(rs.next()){
				num=rs.getInt(1)+1;
				
				System.out.println("새로운 number업데이트");
				sql="insert into numtype values(?,?)";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, num);
				ps.setInt(2, type);
				
				ps.executeUpdate();
				
			
			}else{
				num=1;
				sql="insert into numtype values(?,?)";
				ps=con.prepareStatement(sql);
				ps.setInt(1, num);
				ps.setInt(2, type);
				ps.executeUpdate();
			}
			
			System.out.println("새로운 number업데이트 완료");
		sql="insert into skyboard values(?,?,?,?,?,now(),?,?,?,?)";	
		ps=con.prepareStatement(sql);
			
		ps.setInt(1,num);
		ps.setString(2,m.getId());
		ps.setString(3,m.getSubject());
		ps.setString(4,m.getContent());
		ps.setInt(5,0);
		ps.setInt(6,type);
		ps.setInt(7,0);
		ps.setString(8,m.getGrade());
		ps.setString(9,m.getIp());
		
		System.out.println("값 초기화 완료");
		check=ps.executeUpdate();
		
		return check;
			
		} catch (Exception e) {
			System.out.println("InsertReview()메소드에서 오류가 났습니다"+e);
		}finally {
			closeData();
		}
		
		
		return check;
	}//InsertReview()끝
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getCountBoard(int type){//글이 있는지 없는 지 확인
		int num=0;
		
		try {
			
			con=getConnection();
		
			sql="select count(num) from numtype where type=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1,type);
			
			rs=ps.executeQuery();
				
			if(rs.next()){//작성글있을경우에
				num=rs.getInt(1);
				return num;
			}
			
			
		} 
		catch (Exception e) {
			System.out.println("getCountBoard()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
		return num;
		
		
	}//getCountBoard
	
	
	public List<BoardBean> getBoardList(int StartRow,int pageSize){//게시판 글목록 출력
		
		List<BoardBean> list = new ArrayList<>();
		
		int type=1;
		try {
			con =getConnection();
			
			//sql="select* from skyBoard where type = ? order by num desc limit ?,?";
			
			
		sql="select s.num,s.id,s.subject,s.content,s.readcount,s.joindate,s.type,s.up,s.grade,s.ip, "+
			" ifnull(r.ea,0) rea "+
			"from skyboard s left outer join (select num,count(*) ea "+
											  "from reply "+
											  "where type = ? "+
			                                  " group by num ) r "+
			"on s.num = r.num "+
			"where type = ? "
			+ " order by s.num desc limit ?,? ";
			
			
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, type);
			ps.setInt(2, type);
			ps.setInt(3,StartRow);
			ps.setInt(4, pageSize);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				BoardBean bb =new BoardBean(
						rs.getInt(1),
						rs.getString("id"),
						rs.getString("subject"),
						rs.getString("Content"),
						rs.getInt("readcount"),
						rs.getDate("joindate"),
						rs.getInt("type"),
						rs.getInt("up"),
						rs.getString("Grade"),
						rs.getString("ip"),
						rs.getInt("rea")
						);	
				list.add(bb);
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("getBoardList()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
	
		
		return list;
	}
	
	public void updateReadCount(int num,int type) {//조회수 늘림
		
		
		try {
			con=getConnection();
			
			if(type==2) {
			sql="update skygoods set readcount=readcount+1 where num=?";
			}else {
				sql="update skyboard set readcount=readcount+1 where num=?";
			}
			
			
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,num);
			
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadCount()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
		
	}
	
	

	public BoardBean getBoardcontent(int num,int type){//글내용갖고오기
		
		BoardBean bb=null;
		try {
			con =getConnection();
			
			sql="select* from skyBoard where num=? and type=? ";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, type);
			
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				 bb =new BoardBean(
						rs.getInt(1),
						rs.getString("id"),
						rs.getString("subject"),
						rs.getString("Content"),
						rs.getInt("readcount"),
						rs.getDate("joindate"),
						rs.getInt("type"),
						rs.getInt("up"),
						rs.getString("Grade"),
						rs.getString("ip")
						);	
				
				
				return bb;
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("getBoardcontent()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
	
		
		return bb;
	}//getBoardcontent();
	
	
	
	
	 public void UpdateReview(BoardBean bb) {
		 
		 
		 try {
			con=getConnection();
			
			sql="update skyboard set subject=?,content=?,grade=? where num=? and type=? ";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,bb.getSubject());
			ps.setString(2,bb.getContent());
			ps.setString(3,bb.getGrade());
			ps.setInt(4, bb.getNum());
			ps.setInt(5, bb.getType());
			
			ps.executeUpdate();
			
		}  catch (Exception e) {
			System.out.println("UpdateReview()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		 
		 
		 
	 }//UpdateReview()
	 
	 
	 public void DeleteReview(int num ,int type) {
		 
		 
		 try {
			con=getConnection();
			
			sql="delete from numtype where num=? and type=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,num);
			ps.setInt(2,type);
			
			ps.executeUpdate();
			
		}  catch (Exception e) {
			System.out.println("DeleteReview()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		 
		 
		 
	 }//DeleteReview
	 
	
	 public void insertReply(ReplyBean re){
		 
		int renum=0;
		 try {
			con = getConnection();
			
			sql="select max(renum) from reply";
	
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				renum=rs.getInt(1)+1;
			}else {
				renum=1;
			}
			
			
			
			sql="insert into reply(renum,num,type,id,subcontent,re_ref,re_lev,re_seq,up,joindate) values(?,?,?,?,?,?,?,?,?,now() )";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, renum);
			ps.setInt(2,re.getNum());
			ps.setInt(3,re.getType());
			ps.setString(4,re.getId());
			ps.setString(5,re.getSubcontent());
			ps.setInt(6,renum);
			ps.setInt(7,0);
			ps.setInt(8,0);
			ps.setInt(9,0);
		 	ps.executeUpdate();
			
		 	
		 	
		 } 
		 catch (Exception e) {
			System.out.println("insertReply()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		 
		 
	 }//insertReply
	 
	 
	 public JSONArray getReply(ReplyBean re){
		 
		 JSONArray ja =new JSONArray();
		 
		 try {
			con=getConnection();
			
			
			sql="select num,type,id,subcontent,up,date_format(joindate,'%y-%m-%d %T') date,renum,re_lev  from reply where num=? and type=? "
					+ "  order by re_ref asc, re_seq asc";
			
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,re.getNum());
			ps.setInt(2,re.getType());
			
			rs=ps.executeQuery();
			
			
			while (rs.next()) {
				
			JSONObject jo =new JSONObject();
			
			//jo.put("num",rs.getInt(1));
			//jo.put("type",rs.getInt("type"));
			jo.put("id",rs.getString("id"));
			jo.put("subcontent",rs.getString("subcontent"));
			//jo.put("up",rs.getInt("up"));
			jo.put("joindate",rs.getString("date"));
			jo.put("renum",rs.getInt("renum"));
			jo.put("re_lev",rs.getInt("re_lev"));
				
				
			ja.add(jo);	
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("getReply()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		 
		 return ja;
	 }//getReply
	 
	 
	 public int Replycount(ReplyBean r) {
		 int num =0;
		 
		try{
			con= getConnection();
			
			sql="select count(*) from reply where num=? and type=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,r.getNum());
			ps.setInt(2,r.getType());
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				
				num=rs.getInt(1);
				
			}
			
			
		}
		catch (Exception e) {
			System.out.println("Replycount()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		 
		
 
		 
		 return num;
	 }//Replycount
	

	 
	public int Insertgoods(GoodsBean g){
		
		int check=0;
		int num=0;
		int type=2;
		
		//버그 수정 해야함 인자값을 받아서 실패하면 다시 롤백해주는 형태로 
		try {
			con=getConnection();
			
			sql="select max(num) from numtype where type=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, type);
			
			rs=ps.executeQuery();

			
			if(rs.next()){
				num=rs.getInt(1)+1;
				
				System.out.println("새로운 number업데이트");
				sql="insert into numtype values(?,?)";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, num);
				ps.setInt(2, type);
				
				ps.executeUpdate();
				
			
			}else{
				num=1;
				sql="insert into numtype values(?,?)";
				ps=con.prepareStatement(sql);
				ps.setInt(1, num);
				ps.setInt(2, type);
				ps.executeUpdate();
			}
			
			con=getConnection();
				sql="insert into skygoods(num,type,id,subject,content,readcount "
						+ ",joindate,up,ip,realsave,path)"
						+ " values(?,?,?,?,?,?,now(),?,?,?,?)";	
					
				ps=con.prepareStatement(sql);
					
				ps.setInt(1,num);
				ps.setInt(2,type);
				ps.setString(3,g.getId());
				ps.setString(4,g.getSubject());
				ps.setString(5,g.getContent());
				ps.setInt(6,0);//조회수
				ps.setInt(7,0);// 추천
				ps.setString(8,g.getIp());
				ps.setString(9,g.getRealsave());
				ps.setString(10,g.getPath());
				
				check=ps.executeUpdate();
			
				
				return check;
		} catch (Exception e) {
			System.out.println("Insertgoods()메소드에서 오류가 났습니다"+e);
		}finally {
			closeData();
		}
		
		
		return check;
		
	}//Insertgoods
	
	
	
	
	
	public List<GoodsBean> getgoodsList(int startRow,int pageSize){
		
		List<GoodsBean> list = new ArrayList<>();
		
		int type=2;
		try {
			con =getConnection();
			
			//sql="select* from skyBoard where type = ? order by num desc limit ?,?";
			
			
		sql="select s.num,s.type,s.id,s.subject,s.content,s.readcount,s.joindate,s.up,s.ip,s.realsave,s.path, "+
			" ifnull(r.ea,0) rea "+
			"from skygoods s left outer join (select num,count(*) ea "+
											  "from reply "+
											  "where type = ? "+
			                                  "group by num ) r "+
			"on s.num = r.num "+
			"where type = ? "
			+ " order by s.num desc limit ?,? ";
			
			
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, type);
			ps.setInt(2, type);
			ps.setInt(3,startRow);
			ps.setInt(4, pageSize);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				GoodsBean gb =new GoodsBean(
					    rs.getInt(1),
					    rs.getInt(2),
					    rs.getString("id"),		
					    rs.getString("subject"),
					    rs.getString("content"),
					    rs.getInt("readcount"),
					    rs.getDate("joindate"),
					    rs.getInt("up"),
					    rs.getString("ip"),
					    rs.getString("realsave"),
					    rs.getString("path"),
					    rs.getInt("rea")
						);	
				list.add(gb);
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("getgoodsList()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
	
		
		return list;
	}//getgoodsList()
	
	
	public GoodsBean getgoodscontent(int num,int type){//글내용갖고오기
		
		GoodsBean gg=null;
		try {
			con =getConnection();
			
			sql="select* from skygoods where num=? and type=? ";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, type);
			
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			gg =new GoodsBean(
					    rs.getInt(1),
					    rs.getInt(2),
					    rs.getString("id"),		
					    rs.getString("subject"),
					    rs.getString("content"),
					    rs.getInt("readcount"),
					    rs.getDate("joindate"),
					    rs.getInt("up"),
					    rs.getString("ip"),
					    rs.getString("realsave"),
					    rs.getString("path")
						);	
				System.out.println("완료");
				return gg;
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("getgoodscontent()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
	
		
		return gg;
	}//getBoardcontent();
	
	
	
	public void updateGoods(GoodsBean g) {
		
		 try {
				con=getConnection();
				
				sql="update skygoods set subject=?,content=?,realsave =?,path=? where num=? and type=? ";
				
				ps=con.prepareStatement(sql);
				
				ps.setString(1,g.getSubject());
				ps.setString(2,g.getContent());
				ps.setString(3,g.getRealsave());
				ps.setString(4,g.getPath());
				ps.setInt(5, g.getNum());
				ps.setInt(6, g.getType());
				ps.executeUpdate();
				System.out.println("updateGoods 완료");
				
			}  catch (Exception e) {
				System.out.println("updateGoods()메소드에서 오류가 났습니다"+e);
			}
			finally {
			
				closeData();
			
			}
		
	}
	
	
	public void insertRereply(ReplyBean re) {
		
		int renum=0;
		 try {
			con = getConnection();
			
			sql="select max(renum) from reply";
	
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				renum=rs.getInt(1)+1;
			}else {
				renum=1;
			}
			
			sql ="update reply set re_seq=re_seq+1 where re_ref=? and re_seq > ?";
			ps =con.prepareStatement(sql);
			ps.setInt(1,re.getRe_ref());//부모댓글의 그룹번호를 사용
			ps.setInt(2,re.getRe_seq());//부모댓글의 글순서
			ps.executeUpdate();
			
			sql="insert into reply(renum,num,type,id,subcontent,re_ref,re_lev,re_seq,up,joindate) values(?,?,?,?,?,?,?,?,?,now() )";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, renum);
			ps.setInt(2,re.getNum());
			ps.setInt(3,re.getType());
			ps.setString(4,re.getId());
			ps.setString(5,re.getSubcontent());
			ps.setInt(6,re.getRe_ref());
			ps.setInt(7,1);//들여쓰기
			ps.setInt(8,re.getRe_seq()+1);//순서
			
			ps.setInt(9,0);//추천
		 	ps.executeUpdate();
			
		 	
		 	
		 } 
		 catch (Exception e) {
			System.out.println("insertReply()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
	}
	
	
	public int replydelete(ReplyBean rb) {
		int check=0;
		 
		try {
			con=getConnection();
			
			
			sql="select id from reply where renum=? and type=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,rb.getRenum());
			ps.setInt(2,rb.getType());
			
			
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
			
				if(rs.getString("id").equals(rb.getId())) {
					sql="delete from reply where re_ref=? and type=?";
					
					ps=con.prepareStatement(sql);
					
					ps.setInt(1,rb.getRenum());
					ps.setInt(2,rb.getType());
					
					check=ps.executeUpdate();
					
					return check;
				
				}else {
					
					return check;
						
				}
		
			
			}
			
		
		} catch (Exception e) {
			System.out.println("replydelete()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		return check;
			
	}//replydelete
	
	
		public int Rereplydelete(ReplyBean rb) {
			int check=0;
			
			try {
				con=getConnection();
				
				
				sql="select id from reply where renum=? and type=?";
				
				ps=con.prepareStatement(sql);
				
				ps.setInt(1,rb.getRenum());
				ps.setInt(2,rb.getType());
				
				
				 
				rs=ps.executeQuery();
				
				if(rs.next()) {
					
					if(rs.getString("id").equals(rb.getId())) {
						sql="delete from reply where renum=? and type=?";
						
						ps=con.prepareStatement(sql);
						
						ps.setInt(1,rb.getRenum());
						ps.setInt(2,rb.getType());
						
						check=ps.executeUpdate();
						
						return check;
						
					}else {
						
						return check;
						
					}
					
					
				}
				
				
			} catch (Exception e) {
				System.out.println("Rereplydelete()메소드에서 오류가 났습니다"+e);
			}
			finally {
				
				closeData();
				
			}
			
		
		
		
		
		
		return check;
		
	}//Rereplydelete
	
		
		
	public int InsertUpDown(UpDownBean ud){
		
		int check=0;
		
		try {
				con=getConnection();
			
			sql="select * from updown where num =? and type=? and updown=? "
					+ " and id=?";   // 아이디 값과 num type updown 값을 비교하여 
									 //이미 추천  or 비추천 한 게시글인지 확인
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,ud.getNum());
			ps.setInt(2,ud.getType());
			ps.setString(3,ud.getUpdown());
			ps.setString(4,ud.getId());
			
			
			rs=ps.executeQuery();
			if(rs.next()){
				check=0;//이미 추천이나 비추천한 게시글인 경우에는 0을 반환
				return check;
			}
			
			
		
			sql="insert into updown(num,type,id,updown)"
					+ " values(?,?,?,?)";


			ps=con.prepareStatement(sql);
			
			ps.setInt(1,ud.getNum());
			ps.setInt(2,ud.getType());
			ps.setString(3,ud.getId());
			ps.setString(4,ud.getUpdown());
			
			check=ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("InsertUpDown()메소드에서 오류가 났습니다"+e);
		}
		finally {
			
			closeData();
			
		}
		
	
	
	return check;
	
		
		
		
	}//InsertUpdate
	
	public UpDownBean getUpdowncount(int num ,int type){//추천수와 비추천수를 갖고오는 메소드
		
		UpDownBean ub=new UpDownBean();
		
		
		try {
			con =getConnection();
			
			sql="select ifnull(count(u.num),0) up, d.dw "+
			" from updown u join (select ifnull(count(num),0) dw "+
								" from updown"+
								" where updown='down' "+
								" and num = ? "+
								" and type=?) d "+
			" where updown='up' "+
			" and num=? "+
			" and type=? ";
			
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, type);
			ps.setInt(3, num);
			ps.setInt(4, type);
			
			
			rs=ps.executeQuery();
			
			
			if(rs.next()){
				ub.setSumUP(rs.getInt(1));
				ub.setSumDown(rs.getInt(2));
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("getUpdowncount()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
		
		
		
		return ub;
	}//getUpdowncount
	
	
	
	
	
	
	
	public int getCountUpdown(String ud) {
		
		int count=0;
		
		try {
			
			con=getConnection();
			
			sql="select count(num) "
					+ " from updown"
					+ " where updown= ? ";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1,ud);
			
			rs=ps.executeQuery();
			
			
			if(rs.next()) {	
				count =rs.getInt(1);
				return count;
			}
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("getCountUpdown()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		
		
		
		
		
		return count;
	}
	
	
	
	
	public List<BoardBean> getbestworstBoard(String ud) {	
		List<BoardBean> list =new ArrayList<BoardBean>();
		
		
		try {
			con=getConnection();
			
			sql="select b.num,b.type, b.subject,b.id,ifnull(r.ea,0) rea "+
			" from skyboard b  join (select num,type,count(num) ud "+
										" from updown "+
			                            " where updown=? "+
			                            " group by num,type)u on b.num=u.num and b.type =u.type "+ 
			                            " left outer join (select num,count(*) ea "+
														 " from reply "+
													     " where type=1 "+
														 " group by num) r on b.num=r.num "+

			" order by u.ud desc limit 0,10";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, ud);
			
			
			rs=ps.executeQuery();
			
		
			while(rs.next()) {
				
			BoardBean bb =new BoardBean();
				
				bb.setNum(rs.getInt(1));
				bb.setType(rs.getInt(2));
				bb.setSubject(rs.getString("subject"));
				bb.setId(rs.getString("id"));
				bb.setRea(rs.getInt("rea"));
				
				
				
				list.add(bb);
			}			
			System.out.println("완료");
			
			
			
		} catch (Exception e) {
			System.out.println("getbestworstBoard()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
		
		return list;
	}//getbestworstBoard()
	
	
	
	public void bugNum(int type){
		
		
		try {
			con=getConnection();
	
			sql=" delete from numtype "+
				"where type = ? "+
					" and num=(select r.maxnum "+
							  " from (select max(num) maxnum "+
									" from numtype "+
					                " where type=? "+
					                " )r  ); "; 
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,type);
			ps.setInt(2,type);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("getbestworstBoard()메소드에서 오류가 났습니다"+e);
		}
		finally {
		
			closeData();
		
		}
		
	}//bugNum()
	
	
	
	
	
	
	
	
	
	 
}
