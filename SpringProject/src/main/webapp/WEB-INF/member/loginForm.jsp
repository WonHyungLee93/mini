<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

.loginForm  div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}


</style>
<form name="loginForm" class = "loginForm" id="loginForm" >

	<table border="1" cellspacing="0" cellpadding="5" >
		<tr>
			<td align="center">아이디</td>
			<td><input type = "text" name = "id" id = "id">
			<div id="idDiv" name="idDiv"></div></td>
		</tr>
		
		<tr>
			<td align="center">비밀번호</td>
			<td><input type = "password" id="pwd" name = "pwd">
			<div id="pwdDiv" name ="idDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				
				<input type = "button" value="로그인" id ="loginBtn" >
				
				<input type = "button" value="회원가입" onclick="location.href = '/SpringProject/member/writeForm'">
			</td>
		</tr>
		
	</table>
</form>
<div id ="loginResultDiv"></div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/member_jQuery.js">
</script>
