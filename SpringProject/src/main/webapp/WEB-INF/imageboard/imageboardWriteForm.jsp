<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#img{
	visibility: hidden;
}

</style>
</head>
<body>
<%-- <form id="imageboardWriteForm" method="post" enctype="multipart/form-data" action="/SpringProject/imageboard/imageboardWrite"> --%>
<form id="imageboardWriteForm" >	
	<table border="1" style="border-collapse : collapse;" cellpadding="5">
		<tr>
			<td>상품코드</td>
			<td>
				<input type="text" id="imageId" name="imageId">
				<div id="imageIdDiv"></div>
			</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>
				<input type="text" id="imageName" name="imageName"/>
				<div id="imageNameDiv"></div>
			</td>
		</tr>
		<tr>
			<td>단가</td>
			<td>
				<input type="text" id="imagePrice" name="imagePrice"/>
				<div id="imagePriceDiv"></div>
			</td>
		</tr>
		<tr>
			<td>개수</td>
			<td>
				<input type="text" id="imageQty" name="imageQty">
				<div id="imageQtyDiv"></div>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="15" cols="50" id="imageContent"  name="imageContent"placeholder="내용 입력"></textarea>
				<div id="imageContent"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img id="showImg" style="border: 1px red solid; width:100px; height:100px;" >
				<img src="../image/camera.svg" id="camera">
				<input type="file" name="img" id="img" src="">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" value="이미지등록" id="uploadBtn">
				<input type="button" value="다시작성">
			</td>
		</tr>
	</table>

</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function(){
	$('#camera').click(function(){
		$('#img').trigger('click');
	});
	
	$('#img').on('change',function(){
		readURL(this);
	});
	function readURL(input){
		if(input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#showImg').attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
			
		}
	}
	
	
	$('#uploadBtn').click(function(){
		//단순 submit
		//$('#imageboardWriteForm').submit();
		
		var formData= new FormData($('#imageboardWriteForm')[0]);
		
		$.ajax({
			type: 'post',
			url : '/SpringProject/imageboard/imageboardWrite',
			enctype:'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			success: function(){
				alert('상품등록 완료');
				location.href="/SpringProject/imageboard/imageboardList"
			},
			error: function(e){
				console.log(e);
			}
			
			
		});
		
	});
});

</script>
</body>
</html>

<!-- 
FileReader?
FileReader는 type이 file인 input 태그 또는 API 요청과 같은 인터페이스를 통해 File 또는 Blob 객체를 편리하게 처리할 수 있는 방법을 제공하는 객체이다.
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며, File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.
 -->
