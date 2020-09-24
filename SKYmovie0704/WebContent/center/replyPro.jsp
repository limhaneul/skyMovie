<%@page import="Board.BoaredDAO"%>
<%@page import="Board.ReplyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	
 		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		int num= Integer.parseInt(request.getParameter("num"));
		String reply = request.getParameter("reply");
		int type=Integer.parseInt(request.getParameter("type"));
		

		ReplyBean re = new ReplyBean();
		
		
		re.setId(id);
		re.setSubcontent(reply);
		re.setType(type);
		re.setNum(num);
		
		BoaredDAO dao = new BoaredDAO();
		
		dao.insertReply(re);
		
		
		
		

%>