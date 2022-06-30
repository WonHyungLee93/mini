<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.mainnav{
	background-color: #8c917c;
	list-style: none;
	color: #ffffff;
}
.mainnav li{
	padding :2px 5px;
	display: inline-block;
	justify-content: space-between;
}

.mainnav li a{
	display: block;
	padding: 1px 15px; /* 위/아래 좌/우 */
	background: #c6d4ae;
	font: bold 16px/40px 'Nanum Hothic', sans-serif;
	/* 폰트의굵기 글자의크기/lin-height줄간격 글꼴, 앞에글꼴이없으면다음거 	*/
	text-transform: uppercase;
	text-decoration: none;
	color: #ffffff;
	text-shadow: 1px 1px 1px black;
	box-shadow:1px 1px 1px white;
}

.mainnav li a:hover{
	color: #;
	background: #cdf05b;

	transform:scale(1.1);
}

</style>

<hr>
<ul class="mainnav">	
	<c:if test="${sessionScope.memName != null}">
		<li>
			<a href="/SpringProject/board/boardWriteForm" >글쓰기</a>
		</li>
		
		<li>
			<a href="/SpringProject/imageboard/imageboardWriteForm">상품등록</a>
		</li>
	</c:if>
	<li>
		<a href="/SpringProject/board/boardList">목록</a>
	</li>
	<li>
		<a href="/SpringProject/imageboard/imageboardList">상품목록</a>
	</li>
</ul>
<hr>

<%-- decorateExam01 참고 --%>

