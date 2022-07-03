$(function(){
	$.ajax({
		type : 'post',
		url : '/SpringProject/board/getBoardView',
		data : 'seq=' + $('input[name=seq]').val(),
		dataType:'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$('#subjectSpan').html(data.boardDTO.subject);
			$('#seqSpan').html(data.boardDTO.seq);
			$('#idSpan').html(data.boardDTO.id);
			$('#hitSpan').html(data.boardDTO.hit);
			$('#content').html(data.boardDTO.content);
			
			if(data.memId == data.boardDTO.id){
				$('#boardViewSpan').show();
			}
			else{
				$('#boardViewSpan').hide();
			}
		},
		
		error:function(e){
			console.log(e);
		}
	});//ajax
	
	$('#boardUpdateBtn').click(function(){
		location.href='/miniProject/board/boardUpdateForm.do?seq='
		+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
	});//click
	
	$('#boardDeleteBtn').click(function(){
		if(confirm('선택하신 항목 삭제하시겠습니까')){
			$.ajax({
				type:'post',
				url : '/miniProject/board/boardDelete.do',
				data : 'seq='+$('input[name=seq]').val(),
					
				success : function(){
						alert('삭제 되었습니다.');
						location.href='/miniProject/board/boardList.do?pg=1';
				},
				
				error:function(e){
					console.log(e);
				}
			});
		}
	});
	
	
	$('#boardReplyBtn').click(function(){
		location.href='/SpringProject/board/boardReplyForm?pg='
				+$('input[name=pg]').val()+'&seq='
				+$('input[name=seq]').val();
		
	});
	
	$('#commentBtn').click(function(){
		$.ajax({
			url : '/SpringProject/board/commentWrite',
			type : 'post',
			data : {'commentContent' : $('#commentContent').val(),
					'seq' : $('input[name=seq]').val()},
			success : function(){
				location.href='/SpringProject/board/boardView?seq='
					+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
			},
			error:function(e){
				console.log(e);
			}
				
		});
	});
	
	$.ajax({
		url : '/SpringProject/board/commentView',
		type : 'post',
		data : 'seq='+$('input[name=seq]').val(),
		dataType : 'json',
		success:function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<div/>')
				.append($('<div/>',{
					align :'lefr',
					text :items.seq
				}))
				.append($('<div/>',{
				}).append($('<a/>',{
						href:'#',
						text:items.nickName,
						class: 'ninkNameA ninkNameA_'+items.seq
					}))
				).append($('<div/>',{
					align:'left',
					text: items.commentContent
				})).append($('<div/>',{
					align:'left',
					text: items.logtime.toLocaleString()
				}).append($('<input/>',{
					type : 'button',
					value : '답글쓰기'
					}
					).addClass('commentReplyBtn')
				)).append($('<hr/>')).appendTo($('#commentInside'));
				
				for(i=0; i<items.step; i++){
					$('.ninkNameA_'+items.seq).before('&emsp;');
				}
				
				if(items.step != 0){
					$('.ninkNameA_'+items.seq)
						.before(
							$('<img/>',{
								src:'/SpringProject/image/reply.gif'
								}
							)
						)
				}//if
			});
		},
		error:function(e){
			console.log(e);
		}
	});
	
	$(document).on( "click", ".commentReplyBtn", function() {
		$('#commentReply').remove();
		$('#commentReplyWriteBtn').remove();
		
		$('<div/>').append($('<input/>',{
			type:'text',
			id:'commentReply'
		})).append($('<input/>',{
			type:'button',
			id:'commentReplyWriteBtn',
			value:'답글작성'
		}))
		.appendTo($(this).parent());
		
		$('#commentReplyWriteBtn').click(function(){
			$.ajax({
				type:'post',
				url:'/SpringProject/board/commentReplyWrite',
				data:{
					'seq' : $(this).parent().parent().prev().prev().prev().html(),
					'commentContent' : $('#commentReply').val(),
					'boardSeq' : $('input[name=seq]').val()
				},
				
				success:function(){
					location.href='/SpringProject/board/boardView?seq='
						+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
				},
				error:function(e){
					console.log(e);
				}
			});//ajax
		});//댓글 와이트 버튼
	});
});













