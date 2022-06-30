<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3>
${sessionScope.memName } 님이 로그인
</h3>
<input type = "button" value="로그아웃" id ="logoutBtn" >
<input type = "button" value="회원정보수정" onclick="location.href='/SpringProject/member/updataForm'">
<div id = "loginResult"></div>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#logoutBtn').click(function(){
			$.ajax({
				type:'post',
				url:'/SpringProject/member/logout',
				
				success:function(){
					alert("로그아웃");
					location.href="/SpringProject/index";
				},
				error: function(e){
					console.log(e);
				}
			});//ajax
			
		});
		
	});
</script>
</html>






