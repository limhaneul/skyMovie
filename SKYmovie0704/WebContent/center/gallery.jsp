<%@page import="Board.GoodsBean"%>
<%@page import="java.util.List"%>
<%@page import="Board.BoaredDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link  href="../css/review.css" rel="stylesheet">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>다양한굿즈를 팔아보세요</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/mobile.css" media="screen and (max-width : 568px)">
</head>
<body>
<%


	BoaredDAO dao = new BoaredDAO();

	int count = dao.getCountBoard(2);

	int pageSize=20;
	
	String pageNum= request.getParameter("pageNum");

	System.out.println(count);
	
	if(pageNum==null){
		pageNum="1";
	}
	
	int currentPage=Integer.parseInt(pageNum);//정수형으로 바꾸기
	
	int startRow = (currentPage-1)*pageSize;
	
	System.out.println(startRow);
	List<GoodsBean> list =null;

	if(count > 0){
		list = dao.getgoodsList(startRow,pageSize);
	}
	













%>

<jsp:include page="../hefo/header.jsp"/>



<jsp:include page="../hefo/aside.jsp"/>

	<article id="good">
		<h1><span class="gh1">굿즈나눔</span></h1>
	<div id="body">
		<ul class="gallery">
		
		<% 
			if( count> 0){
			
			for(int i = 0; i<count ;i++){
		%>
			<li>
				<a href="goodscontent.jsp?num=<%=list.get(i).getNum()%>&type=<%=list.get(i).getType()%>&pageNum=<%=pageNum%>">
					<img src="<%=list.get(i).getPath()%>"
					 alt="예시" title="<%=list.get(i).getSubject()%>" class="movieimg">
				</a>
				<span class="goodspan"><a href="goodscontent.jsp?num=<%=list.get(i).getNum()%>&type=<%=list.get(i).getType()%>&pageNum=<%=pageNum%>">
				<b><%=list.get(i).getSubject()%></b></a></span><br>
				<span>작성자: <%=list.get(i).getId()%></span>
				<span>작성한날짜: <%=list.get(i).getJoindate()%></span>
				<span>조회수: <%=list.get(i).getReadcount()%></span>
			</li>
		<% 
			}
			
		}else{
		%>	
		
				<li>작성한 글이 없습니다</li>
		
		<%}%>
		</ul>
		
		<br>		
	<div id="table_search">
	<input type="button" value="글쓰기" class="btn3" onclick="location.href='<%=request.getContextPath()%>/center/writegoods.jsp'">
	</div>
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
		<a href="gallery.jsp?pageNum=<%=startPage-pageBlock%>">이전</a>
<%	
	}
	
	for(int i=startPage; i<=endPage;i++){
		%>
		<a href="gallery.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%
		}	
	
		if(endPage < pageCount){//마지막페이지가 전체나타내는 페이지보다 클경우
		%>
			<a href="gallery.jsp?pageNum=<%=startPage+pageBlock%>"> 다음 </a>
		<% 
		}	
	
	
		
	}

%>
</div>
	
	</article>
<jsp:include page="../hefo/footer.jsp"/>
</body>
</html>
