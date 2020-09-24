<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/center.css">
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script type="text/javascript">

	var _number;
	var result=false;
	var subsult=false;
	var mailsult=false;
	function formcheck() {
		
		
		if($("input:text[name=id]").val()==""){
			$("input:text[name=id]").focus();
			alert("아이디를 입력해주세요");
			return false;
		}
	
		if($("input:text[name=id]").val()!=""&&!result){
				alert("아이디 중복 체크해주세요");
				return false;
		}
		if($(".name").val()==""){
			$(".name").focus();
			alert("이름을 입력해주세요");
			return false;
		}
		if($(".age").val()==""){
			$(".age").focus();
			alert("나이를 입력해주세요");
			return false;
	
		}
		if($("#passwd").val()==""){
			$("#passwd").focus();
			alert("비밀번호를 입력해주세요");
			return false;
	
		}
		
		if($("#passwd2").val()!=$("#passwd").val()){
			
				$("#passwd2").focus();
				alert("비밀번호가 맞지않습니다");
				return false;
			
		}
		
		if(!($("input:radio[name=gender]:checked").val() ) ){
			
		
			alert("성별을 체크해주세요");
			return false;
		
		}
		
		
		if($(".email").val()==""){
			
			$(".email").focus();
			alert("이메일을 입력해주세요");
			return false;
		
		}
		
		if($("#sample4_postcode").val()==""||$("#sample4_execDaumPostcode").val()==""
				||$("#sample4_roadAddress").val()==""||$("#sample4_detailAddress").val()==""){
			
			
			$("#sample4_postcode").focus();
			alert("주소를 입력해주세요");
			return false;
			
		}
		

		
		if($(".tel").val()==""){
			
			$(".tel").focus();
			alert("휴대폰번호를 입력해주세요");
			return false;
		
		}
		
		
		if($("input:text[name=subname]").val()==""){
			$("input:text[name=subname]").focus();
			alert("닉네임을 입력해주세요");
			return false;
		}
	
		

		if($("input:text[name=subname]").val()!=""&&!subsult){
				alert("닉네임 중복 체크해주세요");
				return false;
		}
		
		if(!mailsult){
			
			alert("이메일 인증 확인을 해주세요");
			return false;
			
		}
		
		
		
		//-------------------------------------------------
		
		
		
		
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getName = RegExp(/^[가-힣]+$/);		
		var gettel =RegExp(/^\d{3}\d{3,4}\d{4}$/);//휴대폰번호
		var getpass =RegExp(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/);//비밀번호체크
		//최소 8자 이상으로 영문자 대문자, 영문자 소문자, 숫자, 특수문자가 각각 최소 1개 이상
		
		
			if(!getpass.test($("input:password[name=passwd]").val() )){//비밀번호
				$("input:text[name=passwd]").focus();
				alert("비밀번호를 양식에 맞게 적어주세요");
				return false;
			}
			
			
			if(!getName.test($("input:text[name=name]").val() )){
				$("input:text[name=name]").focus();
				alert("이름을 정확하게 적어주세요");
				return false;
			}
			
			if(!gettel.test($("input:text[name=tel]").val() )){
				$("input:text[name=tel]").focus();
				alert("휴대폰번호가 정확하지 않습니다");
				return false;
			}

		
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//check
	
	function idcheck() {
		
		var _id=$("input:text[name=id]").val();
		var getCheck = RegExp(/^[a-z0-9_-]{2,12}$/);//아이디 영문자 소문자 숫자로만 구성된 길이 2~12자리 사이 문자열
	
		
		if(_id==""){
			
			alert("아아디를 입력해주세요");
			return;
		}
		if(!getCheck.test(_id)){//아이디체크
			alert("아이디를 양식에 맞게 적어주세요");
			return false;
		}
		
		
		$("#message").empty();
		
		$.ajax({
			type:"post",
			async:true,
			url:"<%=request.getContextPath()%>/member/IDcheck.jsp",
			data:{id:_id},
			success:function(data,textStatus){
				
				if(data==1){//중복이 없을떄	
					
					$("#message").append("<h5>중복입니다 사용하실수 없습니다</h5>").css("color","red");
				}else if(data ==0){					
					
					$("#message").append("<h5>중복이 아닙니다 사용 할 수 있습니다</h5>").css("color","green");
					$("input:text[name=id]").attr("readonly",true);
					result=true;
				}
				
				
				
				
			},error:function(){
				alert("오류가 발생했습니다")
			}
			
			
			
		
		});//ajax
		
		
	}//idcheck
	
	
	
 	function sample4_execDaumPostcode() {
		
		 window.open("address.jsp","","width=400,height=200");
	}//주소 띄우기
	
	
	
	
	
	function subcheck() {
		
		var _subname=$("input:text[name=subname]").val();
		
		if(_subname==""){
			
			alert("닉네임을 입력해주세요");
			return;
		}
		
		
		$("#subcheck").empty();
		
		$.ajax({
			type:"post",
			async:true,
			url:"<%=request.getContextPath()%>/member/SUBcheck.jsp",
			data:{subname:_subname},
			success:function(data,textStatus){
				
				if(data == 1 ){//중복이 없을떄	
					
					$("#subcheck").append("<h5>중복입니다 사용하실수 없습니다</h5>").css("color","red");
				}else if(data == 0){					
					
					$("#subcheck").append("<h5>중복이 아닙니다 사용 할 수 있습니다</h5>").css("color","green");
					subsult=true;
				}
				
				
				
				
			},error:function(){
				alert("오류가 발생했습니다")
			}
		});//ajax	
	}
	
	
	function emailCheck() {
		
		var _email=$(".email").val();	
		if(_email == ""){
			
			alert("이메일을 입력해주세요");
		
			return false;
		}
		
		
		$.ajax({
			type:"get",
			async:true,
			url:"<%=request.getContextPath()%>/EmailSend",
			data:{email:_email},
			success:function(data,textStatus){
			
						
				if(data==1){
		
					alert("중복된 이메일입니다 다른 이메일을 입력해주세요");
				}else{
					var d=eval("("+data+")");
					_number=d.mail[0].number;		
					alert("인증메일이 보내졌습니다 확인해주세요");
					
				}	
			},error:function(){
				alert("오류가 발생했습니다")
			}
			
		});
		
			
	}
	
		function emailCheck1() {
			
			
			
			if(_number==null){
				$(".email").focus();
				alert("주어진 인증번호가 없습니다 인증번호전송부터 해주세요");
				return false;
			}
			
			$("#emailcheck2").empty();
			if($("#email1").val()== _number ){//중복이 없을떄	
			
				$("#emailcheck2").append("인증확인 되었습니다").css("color","green");
				$("#email").attr("readonly",true);
				mailsult=true;
				
			}else{					
				
				$("#emailcheck2").append("인증확인에 실패했습니다 다시 입력해주세요").css("color","red");
				
			}
			
		}
		
	

</script>




</head>
<body>

<jsp:include page="../hefo/header.jsp"/>

<jsp:include page="../hefo/aside.jsp"/>

<article class=" bak">
	<h1 class="subtitle">회원가입</h1>
	<form action="<%=request.getContextPath()%>/member/joinpro.jsp" id="join" method="post" name="fr" onsubmit="return formcheck()">
				<label>아이디</label>
					<input type="text" name="id" class="inputcss id" >
					<input type="button" value="아이디중복체크"  class="dup" id="btn" onclick="idcheck();"><br>
					<div id="message"><b style="font-size:8px">아이디 영문자 소문자 숫자로만 구성된 길이 2~12자리 이내</b></div><br>
				<label>비밀번호</label>
					<input type="password" name="passwd"class="inputcss passwd" id="passwd" ><br>
					<div><b style="font-size:8px">최소 8자 이상으로 영문자 대문자, 영문자 소문자, 숫자, 특수문자가 각각 최소 1개 이상</b></div><br>
				<label>비밀번호확인</label>
					<input type="password" name="passwd2"class="inputcss passwd2"id="passwd2"><br>
				<label>이름</label>
					<input type="text" name="name"class="inputcss name"><br>
				<label>별명</label>
					<input type="text" name="subname"class="inputcss name">
					<input type="button" value="닉네임중복체크"  class="dup" onclick="subcheck();"><br>
					<div id="subcheck"></div><br>
				<label>나이</label>
					<input type="number" name="age" class="age" min="0">세<br>
				<label>성별</label>
					<input type="radio" name="gender" class="gender" value="남자">남자
					<input type="radio" name="gender" class="gender" value="여자">여자<br>
				<label>이메일 </label>
					<input type="email" name="email" class="inputcss email" id="email">
					<input type="button" onclick="emailCheck()" value="인증번호 전송" id="checkbtn"><br>
				<label>확인</label>
					<input type="text" name="email1" class="inputcss email1" id="email1">
					<input type="button" onclick="emailCheck1()" value="인증번호 확인" ><br>
					<div id="emailcheck2"></div><br>
				<label>주소</label><br>
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="address1"class="inputcss address">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address2"class="inputcss address">
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address3"class="inputcss address"><br>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4"class="inputcss address"><br>
			<label>휴대폰</label>
				<input type="text" name="tel"class="inputcss tel" placeholder="01012345678 (- 를  뺴주세요 )" maxlength="11"><br>
		<div class=""></div>
		<div id="buttons">
			<input type="submit" value="회원가입" class="submit">
			<input type="reset" value="초기화" class="cancel">
		</div>
	</form>
</article>


<jsp:include page="../hefo/footer.jsp"/>


	

</body>
</html>