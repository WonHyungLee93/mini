<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#currentPaging{
	color:red;
	text-decoration:underline;
	cursor: pointer;
}
#paging{
	color:black;
	text-decoration:non;
	cursor: pointer;
}
</style>
</head>
<body>
<form id="imageboardListForm" method="" action="/SpringProject/imageboard/imageboardDelete">
	<input type="text" id="pg" value="${requestScope.pg }">
	<table id="imageboardListTable" 
	border ="1" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<th width="100px">
				<input type="checkbox" id= "all">
				번호
			</th>
			<th width="100px">이미지</th>
			<th width="100px">사품명</th>
			<th width="100px">단가</th>
			<th width="100px">개수</th>
			<th width="100px">합계</th>
		</tr>
	</table>
	<input type="button" value="선택삭제" id="imageboardDeleteBtn" style="margin: 5px 10px; float:left;" >
	
	<div id= "imageboardPagingDiv" style="border: 1px solid red; width:550px; float:left; text-align: center;" >
	<!-- 동적처리 -->
	
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function imageboardPaging(pg2){
	location.href="/SpringProject/imageboard/imageboardList?pg="+pg2;
}
</script>



<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'/SpringProject/imageboard/getImageboardList',
		data : 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
					}).prepend($('<input/>',{
						type : 'checkbox',
						name : 'check',
						value : items.seq
					}))
				).append($('<td/>',{
					align: 'center'
					}).append($('<img/>',{
						align: 'center',
						src : '../storage/'+items.image1,
						style : 'width : 70px; height : 70px;'
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.imageName
				})).append($('<td/>',{
					align: 'center',
					text: items.imagePrice.toLocaleString()
				})).append($('<td/>',{
					align: 'center',
					text: items.imageQty.toLocaleString()
				})).append($('<td/>',{
					align: 'center',
					text: (items.imageQty * items.imagePrice).toLocaleString()
				})).appendTo($('#imageboardListTable'));
						
			}); //each
			
			//페이징
			$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML);
		},
		error: function(e){
			console.log(e);
		}
	});//$.ajax
	//전체 선택 또는 전체해제
	$('#all').click(function(){
		//alert($('#all').attr('checked'));// checked라는 속성이 없어서 undefind라고 나온다
		alert($('#all').prop('checked')); //true 또는 false
		if($('#all').prop('checked')){
			$('input[name="check"]').prop('checked',true);
		}else{
			$('input[name="check"]').prop('checked',false);
		}
	});
	//선택 삭제
	$('#imageboardDeleteBtn').click(function(){
		var count = $('input[name="check"]:checked').length;
		if(count == 0){
			alert('삭제할항목을 성택하게요')			
		}else{
			if(confirm('정말로 삭제하시겠습니따')){
				$('#imageboardListForm').submit();
			}
		}//else
	});
});
</script>
</body>
</html>