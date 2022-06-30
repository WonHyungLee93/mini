
$('#imageboardWriteBtn').click(function(){
	$.ajax({
		type :'post',
		data:$('#imageboardWriteForm').serialize(),
		url:'/SpringProject/imageboard/imageboardWrite',
		
		success : function(){
			alert("이미지 등록완료")
			location.href="/SpringProject/index";
		},
		error:function(e){
			console.log(e);
		}
	});//ajax
	
});