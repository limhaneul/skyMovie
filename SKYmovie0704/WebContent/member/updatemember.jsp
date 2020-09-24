<%@page import="java.util.ArrayList"%>
<%@page import="Member.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/center.css">
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>



<%
	request.setCharacterEncoding("utf-8");

	
 	String id=(String)session.getAttribute("id");
	
    	if(id==null){
 	%>
  		<script>
 		alert("로그인해주세요");
		location.href="<%=request.getContextPath()%>/home/index.jsp";
  		return; 
  		</script>
	
  		<%
    	}  



	MemberDAO dao =new MemberDAO();
	
	List<MemberBean> list=dao.MemberList(id);
%>



</head>
<body>

<jsp:include page="../hefo/header.jsp"/>





<jsp:include page="../hefo/aside.jsp"/>



<section class="databak">

<h1 class="subnameUp">회원정보</h1>

<div class="list">
		<ul>
		<li><button onclick="location.href='<%=request.getContextPath()%>/member/passupdate.jsp'" >비밀번호변경</button></li>
		<li>
		<form action="update.jsp">
		<input type="hidden" name="passwd" value="<%=list.get(0).getPasswd()%>">
		<input type="hidden" name="name" value="<%=list.get(0).getName()%>">
		<input type="hidden" name="subname" value="<%=list.get(0).getSubname()%>">
		<input type="hidden" name="age" value="<%=list.get(0).getAge()%>">
		<input type="hidden" name="email" value="<%=list.get(0).getEmail()%>">
		<input type="hidden" name="address1" value="<%=list.get(0).getAddress1()%>">
		<input type="hidden" name="address2" value="<%=list.get(0).getAddress2()%>">
		<input type="hidden" name="address3" value="<%=list.get(0).getAddress3()%>">
		<input type="hidden" name="address4" value="<%=list.get(0).getAddress4()%>">
		<input type="hidden" name="tel" value="<%=list.get(0).getTel()%>">
		<button type="submit">회원정보변경</button>
		</form>
		</li>

<li>
<button onclick="location.href='<%=request.getContextPath()%>/member/deleteMember.jsp'">탈퇴</button>
</li>
</ul>
</div>		


	<table class="data">
		<tr>
			<th colspan="2" align="center"><h2>나의 정보</h2></th>		
		</tr>
		
		<tr>
			<th>아이디 :</th>
			<td><%=list.get(0).getId()%></td>			
		</tr>
		
		<tr>
			<th>이름 :</th>
			<td><%=list.get(0).getName()%></td>
		</tr>		
		<tr>
			<th>닉네임 :</th>
			<td><%=list.get(0).getSubname()%></td>
		</tr>
		<tr>
			<th>이메일 주소 :</th>
			<td><%=list.get(0).getEmail()%></td>
		</tr>
		<tr>
			<th>휴대폰번호 :</th>
			<td><%=list.get(0).getTel()%></td>
		</tr>		
		<tr>
			<th>가입일 :</th>
			<td><%=list.get(0).getJoindate()%></td>
		</tr>
</table>	
</section>







<jsp:include page="../hefo/footer.jsp"/>


</body>
</html>