<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();	//콘텍스트명 얻어오기.

		String id=(String)session.getAttribute("id");

	
		if(id==null){
		%>
		<script>
		alert("로그인 후 작성을 하실 수 있습니다");
		history.back();	
		</script>	
		<% 	
		}
	
		String real=(String)request.getAttribute("real");
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="../css/goods.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartEditor</title>
<script type="text/javascript" src="<%=ctx %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
	console.log(<%=real%>);
	
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1",
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=request.getContextPath()%>/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          
          	var titlecheck= RegExp(/^.{1,40}$/);
          
         	if(!titlecheck.test( $("#title").val() ) ){//아이디체크
        		alert("제목을 40자이내에 입력해주세요");
        		return false;
        	}
        	
          
          
			if($("input:file").val()==""){
				
				alert("대표이미지 파일정보가 누락되었습니다 입력해주세요");	
				$("input:file").focus();
				return false;
			
			}	
			
          $("#frm").submit();
		return;		
		 
          
      }); 
      
      $("#re").click(function(){
    	  
    	  location.href='<%=request.getContextPath()%>/center/gallery.jsp?pageNum=1';
          
      }); 
      
      
});//  $("#save").click(function(){

	
	
	var sel_file;
	
	$(function() {
		$("#upfile1").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		
		
		var files=e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			
			if(!f.type.match("image.*")){
				
					alert("확장자는 이미지 확장자만 가능합니다");
					
					return;
				
			}
			
			sel_file=f;
			
			var reader=new FileReader();
			
			reader.onload = function(e) {
				$("#img").attr("src",e.target.result);
			}
			
			reader.readAsDataURL(f);
			
		});
		
		
		
	}


	


</script>

</head>
<body>

<jsp:include page="../hefo/header.jsp"/>



<jsp:include page="../hefo/aside.jsp"/>

<div class="write">
<form id="frm" action="<%=request.getContextPath()%>/center/insertgoods.jsp" method="post" enctype="multipart/form-data" >
<table>							
		<tr>
            <td colspan="3"class="wbut2" align="center">
         	<div class="img_wrap">
         	<img id="img" src="../img/photo.svg">
         	<label><button type="button"onclick="$('#upfile1').click();" class="fakebtn">대표 이미지 설정</button><input type='file' name="upfile1" class="upfile1" id="upfile1" style="display:none;"/></label>         
         	</div>		
            </td>
        </tr>
        <tr>
        	<td>제목</td>
            <td><input type="text" id="title" name="title" style="width:695px"/></td>
        </tr>
        <tr class="mainwrite">
        <td></td>
            <td>
                <textarea rows="10" cols="30" id="ir1" name="content" style="width:690px; height:500px; ">
                </textarea>
            </td>
        </tr>
				
        <tr>
            <td colspan="2"class="wbut1"  >
            <br>
         <input type="button" id="save" value="저장"/>
         <input type="button" id="re"value="게시판"/> 
            </td>
        </tr>
       
       
       
        
</table>
</form>
</div>



<jsp:include page="../hefo/footer.jsp"/>

</body>
</html>