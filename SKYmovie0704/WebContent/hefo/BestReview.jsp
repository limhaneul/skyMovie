<%@page import="Board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="Board.BoaredDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>
<link rel="stylesheet" href="../css/maincenter.css">


<%

		BoaredDAO dao=new BoaredDAO();
		
		int up = dao.getCountUpdown("up");
		int down = dao.getCountUpdown("down"); 
		
		
		
		List<BoardBean> best;
		List<BoardBean> worst; 
		
	
			best =dao.getbestworstBoard("up"); 
						

			worst = dao.getbestworstBoard("down");
			

%>


<div class="maincenter">


<section class="bestReview1">

<h3 class="bestReview">최고의 영화 리뷰</h3>
<ul class="mainceterBW">

	<%
	if(up>0){
	for(int i=0; i<best.size(); i++){
	
	%>
		<li>
			<span class="ranking_wrap   bestnum<%=i+1%>"><span class="ranking"><%=i+1%></span></span>
			<a href="<%=request.getContextPath()%>/center/content.jsp?num=<%=best.get(i).getNum()%>&type=<%=best.get(i).getType()%>&pageNum=1">
			<%=best.get(i).getSubject()%>[<%=best.get(i).getRea()%>]
			</a>
			</li>

	<%//for문
		}	
	}//if문
	
		else{%>
			<li>
			<a href="#">
					베스트 글 이 없습니다 
			</a>
			</li>
	 

<%}%>
</ul>

</section>

<section class="worstReview1">
<h3 class="worstReview">최악의 영화 리뷰</h3>
<ul class="mainceterBW">
<%
	if(down>0){
	for(int i=0; i<worst.size(); i++){
	
	%>
		<li>
			<span class="ranking_wrap   bestnum<%=i+1%>"><span class="ranking"><%=i+1%></span></span>
			<a href="<%=request.getContextPath()%>/center/content.jsp?num=<%=worst.get(i).getNum()%>&type=<%=worst.get(i).getType()%>">
			<%=worst.get(i).getSubject()%>[<%=worst.get(i).getRea()%>]
			</a>
			</li>

	<%//for문
		}	
	}//if문
	
		else{%>
			<li>
			<a href="#">
					최악의 글 이 없습니다 
			</a>
			</li>
	 

<%}%>
</ul>


<div class="movieScreen">

<img src="../img/h3_movie_selection.gif" alt="MOVIE SELECTION" class="selection"/>
<iframe class="obyoutube" src="https://www.youtube.com/embed/fcueArgm800" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscree 
>
</iframe>
<img src="../img/0716_240x388.jpg" alt="반도"  class="bando">


</div>





</section>

<jsp:include page="../hefo/box.jsp"/>


</div>


