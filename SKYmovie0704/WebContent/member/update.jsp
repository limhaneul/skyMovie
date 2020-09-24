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



<%
String id=(String)session.getAttribute("id");
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

%>

<script type="text/javascript">


	var subsult=false;
	function formcheck() {
		
		
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
		//-------------------------------------------------
		
		
		
		
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getName = RegExp(/^[가-힣]+$/);		
		var gettel =RegExp(/^\d{3}\d{3,4}\d{4}$/);//휴대폰번호
		var getpass =RegExp(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/);//비밀번호체크
		//최소 8자 이상으로 영문자 대문자, 영문자 소문자, 숫자, 특수문자가 각각 최소 1개 이상
		
			
			
			
			if(!gettel.test($("input:text[name=tel]").val() )){
				$("input:text[name=tel]").focus();
				alert("휴대폰번호가 정확하지 않습니다");
				return false;
			}

		
	}//check
	
	
	
	
	
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
				
				if(data == 1 ){//중복이 있을때 이거 수정봐야된다	
					
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
	
	
	

</script>



</head>
<body>

<jsp:include page="../hefo/header.jsp"/>

<jsp:include page="../hefo/aside.jsp"/>

<article class="bak">
	<h1 class="updatetitle">회원수정</h1>
	<br>
	<br>
	<br>	
	<form action="<%=request.getContextPath()%>/member/updatePro.jsp" id="update1" method="post" name="fr" onsubmit="return formcheck()">
				<label>아이디</label>
					<input type="text" name="id" class="inputcss id"readonly="readonly" value="<%=id%>"><br>
				<label>비밀번호</label>
					<input type="password" name="passwd"class="inputcss passwd" id="passwd" readonly="readonly" value="<%=passwd%>"><br>
				<label>이름</label>
					<input type="text" name="name"class="inputcss name" readonly="readonly" value="<%=name%>"><br>
				<label>별명</label>
					<input type="text" name="subname"class="inputcss name"value="<%=subname%>">
					<input type="button" value="닉네임중복체크"  class="dup" onclick="subcheck();" ><br>
					<div id="subcheck"></div><br>
				<label>나이</label>
					<input type="number" name="age" class="age" min="0" value="<%=age%>">세<br>
				<label>이메일 </label>
					<input type="email" name="email" class="inputcss email" readonly="readonly" value="<%=email%>"><br>
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="address1"class="inputcss address"value="<%=address1%>">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address2"class="inputcss address"value="<%=address2%>"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address3"class="inputcss address"value="<%=address3%>"><br>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4"class="inputcss address" value="<%=address4%>"><br>
			<label>휴대폰</label>
				<input type="text" name="tel"class="inputcss tel" placeholder="01012345678 (- 를  뺴주세요 )" maxlength="11"value="<%=tel%>"><br>
		<div id="buttons">
			<input type="submit" value="회원수정" class="submit">
		</div>
	</form>

</article>


<jsp:include page="../hefo/footer.jsp"/>


	

</body>
</html>