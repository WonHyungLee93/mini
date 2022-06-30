<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>miniProject</title>
<style type="text/css">
body{
	
	margin: 0;
	padding: 0;
	height: 100%;
	width: auto;
}
#header{
	margin-left: 50px;
	margin-right: 50px;
	width: 1400px; 
	height: 10%;
	text-align: center;
	
}
#container{
	
	margin-left: 50px;
	width: 1400px; 
	height: 500px;
	background: #ffffff;
}
#container:after{
	conternt:'';
	display : block;
	clear:both;
}
#nav{
	margin-left: 5%; /* 퍼센트 바꾸면 마진도 바꿔줘야함 */
	width: 30%;
	height: 100%;
	float: left;
}


#section{
	width: 60%;
	height: 100%;
	float: left;
	
}

#footer{
	margin-left: 50px;
	width: 1400px; 
	height: 10%;
	background: yellow;
}

</style>

</head>
<body>

<div id="header">
	<H1>
		<img src = "${pageContext.request.contextPath }/image/메인.png" 
			width="100"
			height="70"
			alt="메인"
			onclick= "location.href='/SpringProject/index'"
			style="cursor: pointer;">
			MVC를 이용한 미니 프로젝트</H1>
	<br>
	<jsp:include page="${menu}"/>
</div>

<div id="container">
	<div id="nav">
		<jsp:include page="${nav}"/>	
	</div>
	<div id="section">
		<c:if test="${empty display}">
			<h1>
			방문해주셔서 감사합니다.<br>
			Have a nice day!!<br>
			<img src="${pageContext.request.contextPath }/image/메인.png" alt="메인">	
			</h1>
			
		</c:if>
	
		<c:if test="${not empty display}">
			<jsp:include page="${display}"/>
		</c:if>
	</div>
	
</div>
<div id="footer">
	<p>whProject</p>
</div>
</body>


</html>