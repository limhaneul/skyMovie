<%@page import="Board.BoaredDAO"%>
<%@page import="Board.ReplyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%
	
		String id=(String)session.getAttribute("id");
		int renum = Integer.parseInt(request.getParameter("renum"));
		int type = Integer.parseInt(request.getParameter("type"));
		

		
		ReplyBean rb =new ReplyBean();
		
		BoaredDAO dao =new BoaredDAO();
		
		
		rb.setId(id);
		rb.setRenum(renum); 
		rb.setType(type);
		
		 
		int check=dao.Rereplydelete(rb);

		out.print(check);


%>