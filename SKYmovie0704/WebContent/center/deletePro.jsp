<%@page import="Board.BoaredDAO"%>
<%@page import="Board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%
   
   	String id=(String)session.getAttribute("id");
   
   	String newid= request.getParameter("newid");
   

	if( !(id.equals(newid) )){
	%>
	<script>
	alert("삭제권한이 없습니다");
	history.back();	
	</script>	
	<% 	
	return;
	}
	
   	
   	int num=Integer.parseInt(request.getParameter("num"));
   	int type=Integer.parseInt(request.getParameter("type"));

   	
	new BoaredDAO().DeleteReview(num, type);
	   
   %>
   
   <script>
   if(<%=type%>==1){
	alert("삭제 완료 하였습니다");
	location.href="<%=request.getContextPath()%>/center/MovieReview.jsp";
	}
   else if(<%=type%>==2){
	   alert("삭제 완료 하였습니다");
		location.href="<%=request.getContextPath()%>/center/gallery.jsp"; 
   }
   
	</script>	