
<%@page import="java.io.PrintWriter"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");


	String id =(String)session.getAttribute("id");
	String password =request.getParameter("password");
	
	
	
	MemberDAO dao =new MemberDAO();
	
	
	
	
	int check=dao.deleteMember(id,password);
	
	if(check==1){
		
		session.invalidate();
		out.print(check);
	
	}else{		
		out.print(check);
	}
	





%>