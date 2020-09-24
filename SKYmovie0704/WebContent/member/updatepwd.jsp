
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");


	String id =(String)session.getAttribute("id");
	String password1 =request.getParameter("password1");
	String password2 =request.getParameter("password2");
	
	
	
	MemberDAO dao =new MemberDAO();
	
	
	
	
	int check=dao.updatePwd(id,password1,password2);
	
	out.print(check);





%>