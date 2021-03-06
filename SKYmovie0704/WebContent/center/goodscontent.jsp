
<%@page import="Board.GoodsBean"%>
<%@page import="Board.BoaredDAO"%>
<%@page import="java.util.List"%>
<%@page import="Board.ReplyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link  href="../css/review.css" rel="stylesheet">
<link  href="../css/reply.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Piedra&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String newid=(String)session.getAttribute("id");
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	int type=Integer.parseInt(request.getParameter("type"));
	

	BoaredDAO dao =new BoaredDAO();

	dao.updateReadCount(num,type);
	
	
	 GoodsBean gb=dao.getgoodscontent(num, type);
	
	ReplyBean r =new ReplyBean();
	
	r.setNum(num);
	r.setType(type);
	
	int count=dao.Replycount(r);
	
	
	
	
	
	
%>


<script type="text/javascript">
	
		function deletePro() {
			
		
			if(confirm("글을 삭제하시겠습니까?"))
			{
			
				location.href="<%=request.getContextPath()%>/center/deletePro.jsp?num=<%=gb.getNum()%>&type=<%=gb.getType()%>&newid=<%=gb.getId()%>";
			
			}
		}
		
		
		
		
		
		
		
		
		
		
		function replyPro(){
			
			var _reply=$("#reply").val();
			
			if(_reply==""){

				alert("내용을 입력해주세요");
				return false;
			}
			<%
			if(newid==null){%>
				alert("댓글을 쓸 권한이 없습니다 로그인 후 이용해주세요");
			
				return false;
		  <%}%>
		  
		  
			$.ajax({
				type:"get",
				async:true,
				url:"<%=request.getContextPath()%>/center/replyPro.jsp?id=<%=newid%>&num=<%=num%>&type=<%=type%>",
				data:{reply:_reply},
				dataType:"text",
				success:function(data,textStatus){
				
					location.reload();
					alert("댓글이 성공적으로 달렸습니다");
			
				},
				error:function(){
					alert("에러가 발생했습니다");
					
				}
				
			});
		}
		

		function rereplyPro(m){
			
			var _reply=$("."+m).val();
			
			if(_reply==""){

				alert("내용을 입력해주세요");
				return false;
			}
			<%
			if(newid==null){%>	
				alert("댓글을 쓸 권한이 없습니다 로그인 후 이용해주세요");
			
				return false;
		  <%}%>
		  
		  
			$.ajax({
				type:"get",
				async:true,
				url:"<%=request.getContextPath()%>/center/rereplyPro.jsp?id=<%=newid%>&num=<%=num%>&type=<%=type%>",
				data:{reply:_reply,re_ref:m},
				dataType:"text",
				success:function(data,textStatus){
				
					location.reload();
					alert("댓글이 성공적으로 달렸습니다");
			
				},
				error:function(){
					alert("에러가 발생했습니다");
					
				}
				
			});
		}
		
		

		function deleteReply(m) {
			
			<%
			if(newid==null){%>				
			alert("로그인 후 이용해주세요");
			
				return false;
		  <%}%>
		  
		  if(confirm("삭제하시겠습니까?")){
		  
		  $.ajax({
			  type:"post",
			  url:"<%=request.getContextPath()%>/center/replydelete.jsp?type=<%=type%>",
			  data:{renum:m},
			  dataType:"text",
				success:function(data,textStatus){
				
					console.log(data);
					if(data==0){
						
						alert("삭제할 권한이 없습니다");
					}else{					
						location.reload();
						alert("삭제 되었습니다");
					}
					
					
					
					
			
				},
				error:function(){
					alert("에러가 발생했습니다");
					
				}
				
			});
		  }
		}
		function deleteRereply(m) {
			
			<%
			if(newid==null){%>				
			alert("로그인 후 이용해주세요");
			
				return false;
		  <%}%>
		  
		  if(confirm("삭제하시겠습니까?")){
		  
		  $.ajax({
			  type:"post",
			  url:"<%=request.getContextPath()%>/center/rereplydelete.jsp?type=<%=type%>",
			  data:{renum:m},
			  dataType:"text",
				success:function(data,textStatus){
				
					console.log(data);
					if(data==0){
						
						alert("삭제할 권한이 없습니다");
					}else{					
						location.reload();
						alert("삭제 되었습니다");
					}
					
					
					
					
			
				},
				error:function(){
					alert("에러가 발생했습니다");
					
				}
				
			});
		  }
		
		}
		
		
		
		
		
		
		
		$(function() {
			getReply();
			
		});
		
		function rereply(m) {
			$("#"+m).toggle();
		}

	
		
		function getReply() {
			
			
			
			$.getJSON("getreply.jsp?num=<%=num%>&type=<%=type%>" ,  
					function(data){
				
				
				console.log(data.reply);
				
				
				var replys="";
				$.each(data.reply, function (index,item) {
					
					var renum=item.renum;
					var re_lev = item.re_lev;
					var id = item.id;
					
					if(re_lev>0){
						replys+="<tr class='reply'>";
						replys+="<td ><img src='../img/icon (5).png' width=20>"+id+"</td>";
						replys+="<td colspan='1'><p>"+item.subcontent+"</p></td>";
						replys+="<td>"+item.joindate+"<img src='../img/icon (7).png' width='15px' onclick='deleteRereply(" + renum +");'></td>";
						replys+="</tr>";
					
					}
					else{
					replys+="<tr class='reply' >";
					replys+="<td  width='100px'>"+id+"</td>";
					replys+="<td colspan='1' onclick='rereply("+renum+")'><p>"+item.subcontent+"</p></td>";
					replys+="<td>"+item.joindate+"<img src='../img/icon (7).png' width='15px' onclick='deleteReply(" + renum +");'>  </td>";
					replys+="</tr>";
					replys+="<tr class='re_reply' id='"+renum+"'>"+
						"<td colspan='2'><img src='../img/icon (6).png' width='100' height='100'>"+
					"<textarea cols='80%' rows='10' class='"+renum+"'></textarea> </td>"+
					"<td><button class='btn' onclick='rereplyPro("+renum+")'colspan='2'>댓글 달기</button></td></tr>";
					}
				
				});
					$("#board2").append(replys);
					$(".re_reply").hide();
				
			});
		
		}
	
	
</script>




<jsp:include page="../hefo/header.jsp"/>



<jsp:include page="../hefo/aside.jsp"/>


</head>
<body>
<!-- 게시판 -->

<article id="movier">
<h1 class="subre">굿즈나눔</h1>
<table id="board2">
	<tr>
		<td class="sub1"><%=gb.getNum()%></td>
		<td colspan="3" class="sub">
		<%=gb.getSubject()%>
		</td>
	</tr>	
	<tr class="sub2">
		<td><%=gb.getId()%></td>
		<td>조회수 <%=gb.getReadcount()%></td>
		<td colspan="2"><%=gb.getJoindate()%></td>
	</tr>
	<tr class="con">
		<td colspan="4"class="con">
		
		<%=gb.getContent()%>
		
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<textarea cols="100%" rows="10" id="reply"></textarea>
	</td>
	<td><button class="btn" onclick="replyPro()"colspan="2">댓글 달기</button></td>
	</tr>
	
	<tr>
		<td colspan='4'>댓글(<%=count%>)</td>
	</tr>
	
	
	
	
				
	
</table>

<div id="table_search">

<%
	// 각각페이지에서 로그인후 현재페이지로 이동해 올떄 session내장객체 메모리에서 값이 존재하는지
	// 존재하지 않는다 판단하여 아래의 search버튼만 보이게 하거나 search버튼과 글쓰기 버튼을 모두 보이게 
	// 처리 하기
	String id=(String)session.getAttribute("id");

//session영역에 값이 저장되어 있으면 글수정,글삭제,답글쓰기 버튼을 보이게 설정
if(id!=null){
	
%>
<input  type="button" 
		value="글수정" 
		class="btn" 
		onclick="location.href='<%=request.getContextPath()%>/center/goodsUpdate.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>&type=<%=gb.getType()%>&newid=<%=gb.getId()%>'">
<input  type="button" 
	    value="글삭제" 
	    class="btn" 
	    onclick="deletePro()">
<%}%>

<input type="button" 
		value="목록보기" 
		class="btn"
		onclick="location.href='<%=request.getContextPath()%>/center/gallery.jsp?pageNum=<%=pageNum%>'">
</div>



<div class="clear"></div>
<div id="page_control">


</div>
</article>




<jsp:include page="../hefo/footer.jsp"/>


</body>
</html>