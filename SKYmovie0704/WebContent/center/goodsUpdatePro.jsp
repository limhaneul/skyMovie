
<%@page import="java.util.Enumeration"%>
<%@page import="Board.BoaredDAO"%>
<%@page import="Board.GoodsBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가
	request.setCharacterEncoding("utf-8");
	
	
	
	//업로드할 실제 서버 경로
	String realFolder = getServletContext().getRealPath("/upload");
	
	int max =1000*1024*1024;
	
	
	
	//실제 파일 업로드를 담당하는 MultipartRequest객체 생성시 업로드 할 정보를 전달하여
 	//다중 파일 업로드를 진행함
	MultipartRequest Multi = 
	new MultipartRequest(request
						,realFolder,
						max,
						"UTF-8",
						new DefaultFileRenamePolicy());
	
	//입력했던 텍스트값 얻음
	
	String id=(String)session.getAttribute("id");
	String title = Multi.getParameter("title");//제목
	String content = Multi.getParameter("content");//내용
	int type = Integer.parseInt(Multi.getParameter("type"));
	int num = Integer.parseInt(Multi.getParameter("num"));
	
	
	GoodsBean g =new GoodsBean();
	
	g.setId(id);
	g.setSubject(title);
	g.setContent(content);
	g.setType(type);
	g.setNum(num);
	BoaredDAO bd =new BoaredDAO();
	/* //서버에 실제로 업로드된 파일명을 저장할 컬렉션프레임워크의 ArrayList생성
	ArrayList saveFiles = new ArrayList();
	
 	//클라이언트가 업로드한 파일의 원본명을 하나 씩 정할 ArrayList생성
	ArrayList showFiles = new ArrayList();
	
 	 */
 	//input name속성값을 모두 가져와서
 	//Enumeratuin 반복기 객체에 담아서 반환
 	Enumeration e = Multi.getFileNames();

 	
 		while(e.hasMoreElements()){
 		
 		String filename = (String)e.nextElement();
 		
 		String real =Multi.getFilesystemName(filename);
 		//서버에 실제로 업로드될 파일명
 		
 		if(real == null){
 			
 			real=Multi.getParameter("basic");
 		}
 		
 		
 		g.setRealsave(real);
 	
 		
 		g.setPath(request.getContextPath()+"/upload/"+real);
 		}
 	
 		bd.updateGoods(g); 
 	 	 
 	 		
 	response.sendRedirect(request.getContextPath()+"/center/gallery.jsp");
 	
 	

%>


	