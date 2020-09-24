<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 //이게 현재 
	//한글처리
	request.setCharacterEncoding("UTF-8");

	String name =request.getParameter("name");//실제 파일명 갖고오기
	String path =request.getParameter("path");//path 갖고오기
	
	
	String realpath =getServletContext().getRealPath("/"+path);//다운로드할 실제경로 전달
	
	
	response.setContentType("Application/x-msdowunload");//문서형식으로 내보내겠다고 수정
	
	//웹 브라우저 파일명 클릭시
	//1.Content-disposition속성에 attachment;
	//무조건 다운로드가 뜨게 만드는 헤더속성의 값
	response.setHeader("Content-Disposition",
			"attachment; fileName=\"" + URLEncoder.encode(name,"UTF-8")+ "\";");
	 
	//경로완성
	File f =new File(realpath+"//"+name);
	
	// 읽어드릴 스트림 통로완성
	FileInputStream fis = new FileInputStream(f);
	
	
	//파일다운로드를 요청한 클라이언트의 웹브라우저로 읽어 들인 파일의 정보를 버퍼 메모리 공간에서 
	//내보내기 위한 출력 스트림통로 만들기
	OutputStream ops =response.getOutputStream();
	
	
	out.clear();//이미 존재하고 있던 out내장객체를 클리어한다
	out = pageContext.pushBody();
	
	
	//8kb씩 넘겨주기위해 배열생성
	byte[] buffer= new byte[1024*8];
	
	int count=0;//읽어드릴 변수
	
	while((count=fis.read(buffer))!=-1){
		
		ops.write(buffer,0,count);
		
	}
	fis.close();
	ops.close();
%>

</body>
</html>