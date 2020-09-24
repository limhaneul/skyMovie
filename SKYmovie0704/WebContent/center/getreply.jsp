<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="Board.BoaredDAO"%>
<%@page import="Board.ReplyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	request.setCharacterEncoding("utf-8");


	int num=Integer.parseInt(request.getParameter("num"));
	int type=Integer.parseInt(request.getParameter("type"));

	ReplyBean re =new ReplyBean();
	
	re.setNum(num);
	re.setType(type);

	
	BoaredDAO dao = new BoaredDAO();
	
	JSONArray ja =dao.getReply(re);
	
	JSONObject jo = new JSONObject();
	
	jo.put("reply",ja);
	
	String s =jo.toJSONString();
	
	out.print(jo);
	

%>