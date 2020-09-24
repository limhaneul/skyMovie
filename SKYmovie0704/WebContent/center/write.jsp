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


<link href="../css/box.css" rel="stylesheet">
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
        	 
          
		var count = $("#filenumber").val();
		
		if(count>0){
		for(i=0; i<count; i++){
			
			if($("input:file").eq(i).val()==""){
				
				alert(i+1+"번째 파일정보가 누락되었습니다 입력해주세요");	
				$("input:file").eq(i).focus();
				return false;
			}	
			
		}	
          $("#frm").submit();
		return;		
		}  
          $("#frm").submit();
          
      }); 
      
      $("#re").click(function(){
    	  
    	  location.href='<%=request.getContextPath()%>/center/MovieReview.jsp?pageNum=1';
          
      }); 
      
      
      
      
      
      
      
      
      
      
      
});




	





	function addInput() {
	
	var number = $("#filenumber").val();
	
	$("#fileinput").empty();
	if(number>3){
		
		alert("파일은 최대 3개 제한입니다");
		return false;
	}
	
	var msg="";
	
	
	for(i=0; i<number;i++){
		 
			msg  += "<input type='file' name='upfile"+i+"'/><br/>";
		
	}
	
	$("#fileinput").append(msg);
	
	return false;
	
	
	}


</script>

</head>
<body>

<jsp:include page="../hefo/header.jsp"/>



<jsp:include page="../hefo/aside.jsp"/>


<div class="write">
<form id="frm" action="<%=request.getContextPath()%>/center/insert.jsp" method="post" enctype="multipart/form-data" >
<table>														
        <tr>
        	<td>
        	<select name="selected">
        	<option value="클레멘타인">클레멘타인</option>
        	<option vlaue="아 이건 좀;;">아 이건좀;;</option>
        	<option vlaue="한번쯤볼만함">한번쯤볼만함</option>
        	<option vlaue="꽤 잘만들었네">꽤 잘만들었네</option>
        	<option vlaue="캬아 박수쳐">캬아 박수쳐</option>        	
        	</select>
        	</td>
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
            <td colspan="2"class="wbut2" >
         	업로드할 파일수 입력 :<input type="number" name="add" size="2" max="3"min="0" id="filenumber"/>
	 	  	<input type="button" onclick="addInput()" value="파일추가">    
         	<div id="fileinput"></div>
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