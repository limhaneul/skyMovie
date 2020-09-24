<%@page import="Board.UpDownBean"%>
<%@page import="Board.BoaredDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

		String id=(String)session.getAttribute("id");
		int type =Integer.parseInt(request.getParameter("type"));
		int num =Integer.parseInt(request.getParameter("num"));
		String updown = request.getParameter("updown");
		
		
		
		UpDownBean ud =new UpDownBean(num,type,id,updown);
		
		
		
		BoaredDAO dao = new BoaredDAO();
		
		
		int check=dao.InsertUpDown(ud);
		
		out.print(check);
		
		
	

%>