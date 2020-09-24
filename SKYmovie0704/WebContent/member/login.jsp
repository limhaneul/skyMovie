<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
 
}

* {
  box-sizing: border-box;
}

/* style the container */
.container {
  width:95%;
  border:1px dotted gray;
  margin:0 auto;
  margin-top:5px;
  position: relative;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px 0 30px 0;
} 

/* style inputs and link buttons */
input,.btn {
 
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

/* add appropriate colors to fb, twitter and google buttons */



/* style the submit button */
input[type=button] {
  background-color: #006f84;
  color: white;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #00D8FF;
}

/* Two-column layout */
.col {
  float: left;
  width: 50%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

.btn:hover{
	 color:aqua;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* bottom container */
.bottom-container {
  width:95%;
   margin:0 auto;
  text-align: center;
  background-color: #666;
  border-radius: 0px 0px 4px 4px;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
  .col {
    width: 50%;
    margin-top: 0;
  }
  /* hide the vertical line */
  .vl {
    display: none;
  }
  /* show the hidden text on small screens */
  .hide-md-lg {
    display: block;
    text-align: center;
  }
}
</style>





<script type="text/javascript">

function GOjoin() {
	window.close();
	window.opener.location.href="<%=request.getContextPath()%>/member/join.jsp";
}

function Login() {
	
	var _id=$("input:text[name=username]").val();
	var _passwd=$("input:password[name=password]").val();
	
	
	$.ajax({
		type:"post",
		async:true,
		url:"<%=request.getContextPath()%>/member/loginpro.jsp",
		data:{username:_id , password:_passwd},
		dataType:"text",
		success:function(data ,textStatus){
			var check = data;
			
			if(data == 1){		
				<%-- <%
					session.setAttribute("id",request.getParameter("username"));
				%> --%>
				
				alert("로그인 되셨습니다");
				window.opener.location.href="<%=request.getContextPath()%>/home/index.jsp";
				window.close();
				
				
				
			}else if(data == 0){
				alert("비밀번호가 맞지않습니다");
		
			}else if(data == 2){
				alert("존재하지 않는 아이디 입니다");
			}
			
			
			
		},//success
		error:function(){
			
			alert("에러발생");
		}
			
	});//ajax
	
	
	
}
</script>




<title>로그인</title>
</head>
<body>


<div class="container">
	<h2 align="center">로그인</h2>
  <form action="login.jsp" method="post" >    
        <input type="text" name="username" placeholder="아이디" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <input type="button" value="Login" onclick="Login()" style="font-weight:bold;">   	
  </form>
</div>

<div class="bottom-container">
  <div class="row">
    <div class="col">
    <%--   <a href="<%=request.getContextPath()%>/member/join.jsp" onclick="" style="color:white" class="btn">회원가입</a>--%>
    <a href="#" onclick="GOjoin()" style="color:white" class="btn">회원가입</a>
    </div>
    <div class="col">
      <a href="#" style="color:white" class="btn">비밀번호찾기</a>
    </div>
  </div>
</div>
	 <%-- <a href="<%=request.getContextPath()%>/test01/memberForm.jsp">회원가입</a> --%>
</body>
</html>