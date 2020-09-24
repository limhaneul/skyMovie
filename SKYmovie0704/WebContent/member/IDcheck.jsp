<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	
	String id=request.getParameter("id");


	MemberDAO md =new MemberDAO();


	int check=md.IDcheck(id); 
	
	
	out.print(check);

%>