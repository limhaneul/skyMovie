<%@page import="java.io.PrintWriter"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		request.setCharacterEncoding("utf-8");

		String id=request.getParameter("username");
		String passwd=request.getParameter("password");

		
		MemberDAO dao = new MemberDAO();
		
		
		int check=dao.loginID(id, passwd);
		if(check==1)session.setAttribute("id", id);
		
		out.print(check);
%>