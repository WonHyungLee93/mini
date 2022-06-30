<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style type="text/css">
#updateForm Div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>

<body >
<h3>회원정보수정</h3>
<hr>
<form name="updateForm" id="updateForm" >
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="75" align="center">이름</td>
			<td><input type="text" name="name" id="name" >
			<div id="nameDiv"> </div>

			</td>
		</tr>
		<tr>
			<td align="center">아이디</td>
			<td><input type="text" name="id" id="id" readonly> 
			</td>
		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td>
			<input type="password" name="pwd" id="pwd">
			<div id="pwdDiv"></div></td>
		</tr>
		<tr>
			<td align="center">재확인</td>
			<td>
			<input type="password" name="repwd" id="repwd">
			</td>
		</tr>
		<tr>
			<td align="center">성별</td>
			<td>
				<input type="radio" name="gender"  id="gender0" value="0" >남 <%-- radio는 배열로 넘어온다 --%>
				<input type="radio" name="gender"  id="gender1" value="1" >여
			</td>
		</tr>

		<tr>
			<td width="75" align="center">이메일</td>
			<td>
				<input type="text" name="email1" id="email1" >
				@
				<input type="text" list="email2"  name="email2" placeholder="직접입력" value="">
				<datalist id="email2">
					<option value="g.mail.com">
					<option value="hanmail.com">
					<option value="naver.com">
				</datalist></td>
		</tr>

		<tr>
			<td width="75" align="center">핸드폰</td>
			<td>
			<select name="tel1" id = "tel1" style="width: 70px">
				<option value = "011">011</option>
				<option value = "010">010</option>
				<option value = "019">019</option>
				</select>
				 - 
				<input type="text" name="tel2" size="5" id="tel2" >
				- 
				<input type="text" name="tel3" size="5" id="tel3" >
			</td>
		</tr>
		<tr>
			<td width="75" align="center">주소</td>
			
			<td><input type="text" name="zipcode" id="zipcode" readonly>
			<input type = "button"  value="우편번호검색" onclick="checkPost()"><br>
			<input type="text" name = "addr1" id="addr1"  size="50" readonly ><br>
			<input type="text" name = "addr2" id="addr2"  size = "50" >
			
			</td>	
		</tr>
		<tr>
			<td colspan="2" align ="center">
			<input type = "button"  value="회원정보수정" id="updataBtn">
			<input type = "reset" value="다시 작성" onclick="location.reload()">
			<input type = "button" value="돌아가기" onclick="location.href='/SpringProject/index'">
			</td>
		</tr>
	</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/SpringProject/js/member_jQuery.js"></script>

<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url:'/SpringProject/member/getMember',
		dataType: 'json',
		success: function(data){
			$('input[name="name"]').val(data.name);
			$('input[name="id"]').val(data.id);
			$('input[name="email1"]').val(data.email1);
			$('input[name="email2"]').val(data.email2);
			$('input[name="tel2"]').val(data.tel2);
			$('input[name="tel3"]').val(data.tel3);
			$('input[name="zipcode"]').val(data.zipcode);
			$('input[name="addr1"]').val(data.addr1);
			$('input[name="addr2"]').val(data.addr2);
			$('select[name="tel1"]').val(data.tel1);
			$('input[name="gender"]:eq('+data.gender+')').prop("checked",true);
		},
		error: function(e){
			console.log(e);
		}
	});
});

//회원정보 수정
$('#updataBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv_write').empty();
	
	if($('#name').val()==''){
		$('#nameDiv').html('이름을 입력하세요');
		$('#nameDiv').css('color','red');
		$('#nameDiv').css('font-size','8pt');
		$('#nameDiv').css('font-weight','bold');
	}else if($('#pwd').val() == ''){
		$('#pwdDiv').html('비밀번호를 입력하세요');
		$('#pwdDiv').css('color','red');
		$('#pwdDiv').css('font-size','8pt');
		$('#pwdDiv').css('font-weight','bold');
	}else if($('#pwd').val() != $('#repwd').val()){
		$('#pwdDiv').html('비밀번호를 확인하세요');
		$('#pwdDiv').css('color','red');
		$('#pwdDiv').css('font-size','8pt');
		$('#pwdDiv').css('font-weight','bold');
	}else{
		//$('#updateForm').submit();
		$.ajax({
			type: 'post',
			url: '/SpringProject/member/updata',
			data: $('#updateForm').serialize(),
			success:function(){
				alert('회원정보를 수정하였습니다')
				location.href = '/SpringProject/index';	
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
</script>
</body>
</html>