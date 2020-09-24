<%@page import="Board.BoardBean"%>
<%@page import="Board.BoaredDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가
	request.setCharacterEncoding("utf-8");
	
	String id=(String)session.getAttribute("id");//아이디얻고
	String title = request.getParameter("title");//제목 얻고
	String content = request.getParameter("content");//내용얻고
	String grade = request.getParameter("selected");
	int num =Integer.parseInt(request.getParameter("num"));
	int type =Integer.parseInt(request.getParameter("type"));
			
			
	BoardBean b = new BoardBean(); 
	
	b.setId(id);
	b.setSubject(title);
	b.setContent(content);
	b.setGrade(grade);
	b.setNum(num);
	b.setType(type);
	BoaredDAO bd =new BoaredDAO();
	
	bd.UpdateReview(b);

	
	response.sendRedirect(request.getContextPath()+"/center/MovieReview.jsp");

%>
