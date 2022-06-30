

$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val()==''){
		$('#subjectDiv').html('제목을 입력하세요');
		$('#subjectDiv').css('color','red');
		$('#subjectDiv').css('font-size','8pt');
		$('#subjectDiv').css('font-weight','bold');
	}else if($('#content').val()==''){
		$('#contentDiv').html('내용을 입력하세요');
		$('#contentDiv').css('color','red');
		$('#contentDiv').css('font-size','8pt');
		$('#contentDiv').css('font-weight','bold');
	}else{
		$.ajax({
			url:'/SpringProject/board/boardWrite',
			type:'post',
			//data: $('#boardWriteForm').serialize(),
			//data:'subject = '+$('#subject').val()+'&content ='+$('#content').val(),
			data: {'subject' : $('#subject').val(),
					'content' : $('#content').val()},
			success:function(){
				alert('게시글을 등록하였습니다.');
				location.href='/SpringProject/board/boardList';
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
});



