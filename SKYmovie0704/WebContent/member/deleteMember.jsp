<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="memcss/delmember.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>



<%
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


%>


<script type="text/javascript">



function deleteMember() {
if(confirm("정말로 탈퇴 하시겠습니까?")){
	
	var _passwd=$("input:password[name=password]").val();
	
		
			
	
	$.ajax({
		type:"post",
		async:true,
		url:"<%=request.getContextPath()%>/member/deleteMemberpro.jsp" ,
		data:{password:_passwd},
		dataType:"text",
		success:function(data ,textStatus){
			var check = data;
					
			
			if(data == 1){		
			
				alert("탈퇴 하셨습니다");
		
				location.href="<%=request.getContextPath()%>/home/index.jsp";
				
			}else if(data == 0){
				alert("비밀번호가 맞지않습니다");
				return false;
			}
	
		},//success
		error:function(){
			
			alert("에러발생");
		}
			
	});//ajax
}
}	
	
	


</script>





<title>회원탈퇴</title>
</head>
<body>
<jsp:include page="../hefo/header.jsp"/>



<jsp:include page="../hefo/aside.jsp"/>

<section class="del">
<div class="container">
	<h2 align="center">회원탈퇴</h2>
  <form >
        <input type="password" name="password" placeholder="비밀번호" required class="delin">
        <input type="button" value="회원탈퇴" onclick="deleteMember()" style="font-weight:bold;" class="delin" >   	
  </form>
</div>

<div class="bottom-container">
  <div class="row">
    <div class="col">
    <a href="#" onclick="history.back()" style="color:white; text-align:center" class="btndel" >취소</a>
    </div>
  </div>
</div>
</section>



	 <%-- <a href="<%=request.getContextPath()%>/test01/memberForm.jsp">회원가입</a> --%>
<jsp:include page="../hefo/footer.jsp"/>
</body>
</html>