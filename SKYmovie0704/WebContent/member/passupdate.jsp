
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="memcss/updatepasswd.css">
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









function updatepwd() {
	var getpass =RegExp(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/);//비밀번호체크
if(confirm("비밀번호를 바꾸시겠습니까?")){
	

	var _passwd1=$("input:password[name=password1]").val();
	var _passwd2=$("input:password[name=password2]").val();
	var _passwd3=$("input:password[name=password3]").val();
	
	
	if(_passwd1==""){
		$("input:password[name=password1]").focus();
		alert("비밀번호를 입력해주세요");
		return false;

	}
	if(_passwd2==""){
		$("input:password[name=password2]").focus();
		alert("비밀번호를 입력해주세요");
		return false;

	}
	if(_passwd3==""){
		$("input:password[name=password3]").focus();
		alert("비밀번호를 입력해주세요");
		return false;

	}

	if(!getpass.test(_passwd2)){//비밀번호
		$("input:text[name=password2]").focus();
		alert("비밀번호를 양식에 맞게 적어주세요");
		return false;
	}
	if(!getpass.test(_passwd3)){//비밀번호
		$("input:text[name=password3]").focus();
		alert("비밀번호를 양식에 맞게 적어주세요");
		return false;
	}
	
	if(_passwd2 != _passwd3){
		
		alert("바꿀려는 비밀번호가 서로 맞지 않습니다");
		return;		
	}
	
	
	$("#passup").empty();
	
	$.ajax({
		type:"post",
		async:true,
		url:"<%=request.getContextPath()%>/member/updatepwd.jsp" ,
		data:{password1:_passwd1,password2:_passwd2},
		dataType:"text",
		success:function(data ,textStatus){
			var check = data;
					
			
			if(data == 1){		
			
				alert("비밀번호가 변경되었습니다");
		
				location.href="<%=request.getContextPath()%>/home/index.jsp";
				
			}else if(data == 0){
				$("#passup").append("비밀번호가 맞지 않습니다").css("color", "red");
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
	<h2 align="center">비밀번호변경</h2>
  <form >
        <input type="password" name="password1" placeholder="현재비밀번호" required class="delin">
        <div id="passup"></div>
        <input type="password" name="password2" placeholder="비밀번호" required class="delin">
        <input type="password" name="password3" placeholder="비밀번호확인" required class="delin">
        <input type="button" value="비밀번호변경" onclick="updatepwd()" style="font-weight:bold;" class="delin" >   	 	
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