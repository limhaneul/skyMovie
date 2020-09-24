<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Piedra&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<header>
<div class="wrapper">
  <a href="../home/index.jsp" class="logo">
  <img id="popcon" src="../img/icon (3).png">
  <!-- 
  아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/srip" title="srip">srip</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon"> www.flaticon.com</a> -->
  </a>
  <h1 class="skymovie">
  SKY Movie
  </h1>

  <table id="hmenu">
  <tr>
  <td><a href="<%=request.getContextPath()%>/center/MovieReview.jsp">영화리뷰</a></td>
  <td><a href="#">영화소식</a></td>
  <td><a href="#">토론장</a></td>
  <td><a href="<%=request.getContextPath()%>/center/gallery.jsp">영화굿즈</a></td>
  <td><a href="#">잡담</a></td>  
  </tr>
  </table>
</div>
</header>