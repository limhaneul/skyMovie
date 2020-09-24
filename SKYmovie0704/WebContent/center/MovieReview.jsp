
<%@page import="Board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="Board.BoaredDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link  href="../css/review.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Piedra&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 리뷰해주세요</title>
<%

	BoaredDAO dao=new BoaredDAO();

	int count = dao.getCountBoard(1);//MovieReview게시판글수 갖고오기
	
	int pageSize=15;//한페이지당 보여줄 글 갯수
	
	String pageNum = request.getParameter("pageNum");
	
	
	//클릭한 페이지번호가 없으면
	//첫번째페이지를 보여주자
	if(pageNum==null){
		pageNum="1";
	}
	
	int currentPage=Integer.parseInt(pageNum);//정수형으로 바꾸기
	
	
	int startRow = (currentPage-1)*pageSize;
	
	System.out.println(startRow);
	List<BoardBean> list =null;
	
	if(count>0){
		
		list =dao.getBoardList(startRow,pageSize);
		
	}
	
	



%>
</head>
<body>
<!-- 헤더파일 -->
<jsp:include page="../hefo/header.jsp"/>
<!-- 헤더파일 -->

<!--aside 사이드오른쪽 -->
<jsp:include page="../hefo/aside.jsp"/>
<!--aside 사이드오른쪽 -->



<section>
<h1 class="subre">영화리뷰</h1>
<table id="notice">
<tr class="bot">
    <th class="tno">번호</th>
    <th class="sub">등급</th>
    <th class="ttitle">제목</th>
    <th class="twrite">글쓴이</th>
    <th class="tdate">날짜</th>
    <th class="tread">조회수</th>
 </tr>

<% 
	if(count >0){
	for(int i=0;i <list.size();i++){
%>
<tr class="bot" onclick="location.href='<%=request.getContextPath()%>/center/content.jsp?num=<%=list.get(i).getNum()%>&pageNum=<%=pageNum%>&type=<%=list.get(i).getType() %>'">
<td><%=list.get(i).getNum()%></td>
<td class="left"><%=list.get(i).getGrade()%></td>
<td class="left"><span class="reviewspan"><%=list.get(i).getSubject()%></span><small>[<%=list.get(i).getRea()%>]</small></td>
    <td><%=list.get(i).getId()%></td>
    <td><%=list.get(i).getJoindate() %></td>
    <td><%=list.get(i).getReadcount()%></td>
</tr >

<%}
}else{
%>
	<tr class=bot>
	<td colspan="5">작성글 없음</td>
	</tr>
<%} %>
</table>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" onclick="location.href='<%=request.getContextPath()%>/center/write.jsp'">
</div>
<br>
<br>
<div id="page_control">
<%
	if(count>0){
		

		//전체 페이지 수= 전체 글수 /한페이지당 보여줄 글수 +(전체 글수를 한페이지에 보여줄 글수로 나눈 나머지 값 )
	int pageCount=count/pageSize+(count%pageSize == 0 ? 0:1);
	
	
	int pageBlock=10;
					//  페이지가 십의 몇자리인지 판단                 
					// 30    10  = 3            30  %  10   =  1            2  x 10+1 = 21
					// 25     10   = 2           25  %   10   =   0         2  x 20 +1 == 21   
					// 12        10 = 1        12     %    10=    0         1  x 10 + 1 ==11 startpage      
	int startPage=((currentPage/pageBlock)-(currentPage%pageBlock==0   ?   1 : 0))*pageBlock+1;
	 
					
				//11        10 -1 =19			
	int endPage=startPage + pageBlock-1;
		
	if(endPage>pageCount){
		//끝페이지번호를 전체페이지수로 저장 
		endPage = pageCount;
		}

	if(startPage > pageBlock){//스타트페이지가 전체 나타내는 페이지보다 작을경우
%>			
		<a href="<%=request.getContextPath()%>/center/MovieReview.jsp?pageNum=<%=startPage-pageBlock%>">이전</a>
<%	
	}
	
	for(int i=startPage; i<=endPage;i++){
		%>
		<a href="<%=request.getContextPath()%>/center/MovieReview.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%
		}	
	
		if(endPage < pageCount){//마지막페이지가 전체나타내는 페이지보다 클경우
		%>
			<a href="<%=request.getContextPath()%>/center/MovieReview.jsp?pageNum=<%=startPage+pageBlock%>"> 다음 </a>
		<% 
		}	
	
	
		
	}

%>
</div>
</section>











	<!-- 푸터 들어가는 곳 -->
<jsp:include page="../hefo/footer.jsp"/>
	<!-- 푸터 들어가는 곳 -->


<!-- 하단 -->
</body>
</html>