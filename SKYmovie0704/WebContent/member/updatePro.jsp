<%@page import="javax.naming.Context"%>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
			request.setCharacterEncoding("utf-8");
			//한글처리
			
			
			
			
			String id=(String)session.getAttribute("id");	
			String subname = request.getParameter("subname");
			int age =  Integer.parseInt( request.getParameter("age"));
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
	
			String tel =request.getParameter("tel") ;


			
		MemberDAO dao=new MemberDAO();
		
		
		dao.updateMember(id,subname,age,address1,address2,address3,address4,tel);
%>


		<script>
		
		
		alert("회원정보가 수정 되셨습니다");
		
		location.href="<%=request.getContextPath()%>/member/updatemember.jsp";
		
		</script>