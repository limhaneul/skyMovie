<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Piedra&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%String id=(String)session.getAttribute("id"); %>


<script>
 
 function loginfor() {
	 open("<%=request.getContextPath()%>/member/login.jsp", "" ,"width=520,height=310"); 
}
  
</script>




<aside class="wrapper">
<div id="but1">
	<%
		if(id==null){//로그인 안됐을때
	%>
	<button class="mainbut" onclick="loginfor()">로그인</button>
	<button class="mainbut" onclick="location.href='../member/join.jsp'">회원가입</button>
	<%}else{//로그인 됐을때%>
	
		<div id="login">
		
		
		<a href="../member/updatemember.jsp"><img src="../img/icon.png" class="userimg"></a>
		<h5 align="center"><%=id %>님 환영합니다</h5>
		<button class="logout mainbut" onclick="location.href='../member/logout.jsp'">로그아웃</button>
		<button class="mydata mainbut" onclick='location.href="../member/updatemember.jsp"'>회원정보</button>
		</div>
	<%}%>
	<form action="#" method="get" name="sch_f" id="sch_f">
	<p>
	<input type="text" name="keyword" id="keyword" title="검색어입력" placeholder="검색어 입력"/>
	<a href="#"><img src="../img/Search-512.webp" id="serimg" title="검색"></a>
	</p>		
	</form>
</div>
</aside>
