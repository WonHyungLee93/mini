<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
<style>
#boardReplyForm div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

</style>
</head>
<body>

<h2>답글쓰기</h2>
<form name="boardReplyForm" id="boardReplyForm">
<input type = "hidden" name="pseq" id= "pseq" value="${pseq}">
<input type = "hidden" name="pg" id= "pg" value="${pg}">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">
			제목
			</td>
			<td><input type = "text" name="subject" id = "subject" placeholder="제목 입력">
			<div id="subjectDiv"></div></td>
		</tr>
		<tr>
			<td align="center">
			내용
			</td>
			<td>
			  <textarea rows="15" cols="50" id="content" name="content" placeholder="내용 입력"></textarea>
			  <div id="contentDiv"></div>
			</td>

		</tr>
		<tr>
			<td colspan="2" align ="center">
			<input type ="button" value="답글쓰기" id="boardReplyBtn1">
			<input type ="reset" value="다시작성">
			<input type= "button" value = "목록" onclick ="location.href='/SpringProject/board/boardList?pg=${pg}'">
			</td>
			
		</tr>
	</table>
</form>
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript">
$('#boardReplyBtn1').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val()==''){
		$('#subjectDiv').html('제목을 입력하세요');
		
	}else if($('#content').val()==''){
		$('#contentDiv').html('내용을 입력하세요');
		
	}else{
		$.ajax({
			url:'/SpringProject/board/boardReply',
			type:'post',
			data: {
				'subject' : $('#subject').val(),
				'pseq' : $('#pseq').val(),
				'content' : $('#content').val()
			},
			success:function(){
				alert('답글을 등록하였습니다.');
				location.href='/SpringProject/board/boardList?pg='+$('#pg').val();
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
});
</script>


