<%@page import="javax.naming.Context"%>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
			request.setCharacterEncoding("utf-8");
			//한글처리
			
			
			
			
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email= request.getParameter("email");
			String subname = request.getParameter("subname");
			int age =  Integer.parseInt( request.getParameter("age"));
			String gender = request.getParameter("gender");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");			
			String tel =request.getParameter("tel") ;


		MemberBean mb =new MemberBean(id, passwd, email, address1,address2,address3,address4, name,subname,age, gender,tel);
			
	
		MemberDAO dao=new MemberDAO();
		
		
		dao.insertMember(mb);
%>


		<script>
		
		
		alert("회원가입 되셨습니다");
		
		location.href="<%=request.getContextPath()%>/home/index.jsp";
		
		</script>