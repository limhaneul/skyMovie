<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-latest.min.js">	</script>
<link rel="stylesheet" href="../css/box.css" >


<script type="text/javascript">

// 조회할 날짜를 계산
	var dt = new Date();

	var m = dt.getMonth() + 1;
	if (m < 10) {
		var month = "0" + m;
	} else {
		var month = m + "";
	}

	var d = dt.getDate() - 1;
	if (d < 10) {
		var day = "0" + d;
	} else {
		var day = d + "";
	}

	var y = dt.getFullYear();
	var year = y + "";

	var result = year + month + day;
	$(function() {
		$.ajax({
			//"키입력" 부분에 발급받은 키를 입력
			//&itemPerPage: 1-10위 까지의 데이터가 출력되도록 설정
					url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=fb4248c730263ba4efdbb1a376ff3e83&targetDt="
							+ result + "&itemPerPage=11",
					dataType : "xml",
					success : function(data) {
						var $data = $(data)
								.find("boxOfficeResult>dailyBoxOfficeList>dailyBoxOffice");
						//데이터를 테이블 구조에 저장. html의 table태그, class는 table로 하여 부트스트랩 적용
						if ($data.length > 0) {
							var table = $("<table/>").attr("class", "table");
							//<table>안에 테이블의 컬럼 타이틀 부분인 thead 태그
							var thead = $("<thead/>").append($("<tr/>"))
									.append(
											//추출하고자 하는 컬럼들의 타이틀 정의
											$("<th/>").html("&nbsp;순위"),
											$("<th/>").html("&nbsp;&nbsp;영화제목"),
											$("<th/>").html("&nbsp;&nbsp;개봉날짜"),
											$("<th/>").html("&nbsp;&nbsp;당일 관객수"),
											$("<th/>").html("&nbsp;&nbsp;누적 관객수"),
											$("<th/>").html("&nbsp;&nbsp;누적 매출액"),
							
											$("<th/>").html("&nbsp;&nbsp;스크린수")
										
											
											
									
									
									);
							var tbody = $("<tbody/>");
							$.each($data, function(i, o) {

								//오픈 API에 정의된 변수와 내가 정의한 변수 데이터 파싱
								var $rank = $(o).find("rank").text(); // 순위
								var $movieNm = $(o).find("movieNm").text(); //영화명
								var $openDt = $(o).find("openDt").text();// 영화 개봉일
								var $audiCnt = $(o).find("audiCnt").text();// 당일관객수
								var $audiAcc = $(o).find("audiAcc").text(); //누적 관객수
								var $salesAcc = $(o).find("salesAcc").text();// 누적매출액
					
								var $scrnCnt = $(o).find("scrnCnt").text(); //스크린수
								
								
								//<tbody><tr><td>태그안에 파싱하여 추출된 데이터 넣기
								var row = $("<tr class='boxtr'/>").append(
										
										$("<td/>").text($rank),
										$("<td/>").text($movieNm),
										$("<td/>").text($openDt),
										$("<td/>").text($audiCnt+"명"),
										$("<td/>").text($audiAcc+"명"),
										$("<td/>").text($salesAcc+"원"),
										$("<td/>").text($scrnCnt+"개")
								
								);
								tbody.append(row);

							});// end of each 

							table.append(thead);
							table.append(tbody);
							$(".wrap").append(table);
						}
					},
					//에러 발생시 "실시간 박스오피스 로딩중"메시지가 뜨도록 한다.
					error : function() {
						alert("실시간 박스오피스 로딩중...");
					}
				});
	});
</script>

<!-- 박스오피스 테이블에 마우스를 올렸을때 hover효과 -->


<div class="container">
<h2 class="api">실시간 박스오피스</h2>
	<div class="wrap contaner"></div>
	
</div>	