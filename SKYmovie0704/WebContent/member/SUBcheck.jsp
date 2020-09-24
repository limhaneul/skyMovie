<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	
	String subname=request.getParameter("subname");


	MemberDAO md =new MemberDAO();


	int check=md.SUBcheck(subname); 
	
	
	out.print(check);

%>