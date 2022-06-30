$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/SpringProject/board/getBoardList',
		data : 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				
				$('<tr/>').addClass('a')
					.append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
					}).append($('<a/>',{
						href:'#',
						text: items.subject,
						class: 'subjectA subjectA_'+items.seq
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime.toLocaleString()
				})).append($('<td/>',{
					align: 'center',
					text: items.hit				
				})).appendTo($('#boardListTable'));
				//로그인 여부 비동적
				$('.subjectA_'+items.seq).click(function(){
					if(data.memId == null){
						alert('먼저 로그인하세요')
					}else{
						location.href = '/SpringProject/board/boardView?seq='
										+items.seq+'&pg='+$('#pg').val();
					}
				});
				//답글
				for(i=0; i<items.lev; i++){
					$('.subjectA_'+items.seq).before('&emsp;');
				}
				if(items.pseq != 0){
					$('.subjectA_'+items.seq)
						.before(
							$(
								'<img>'
								,{src:'/SpringProject/image/reply.gif'
								}
							)
						)
				}//if
				
				
			});//each
			/*	
			//로그인 여부 - 동적
			//조상
			$('#boardListTable').on('click','.subjectA',function(){
				//alert($(this).parent().prev().text());
				if(data.memId == null){
					alert('먼저 로그인하세요')
				}else{
					var seq = $(this).parent().prev().text();
					location.href = '/miniProject/board/boardView.do?seq='+seq+'&pg='+$('#pg').val();
				}
			});
			*/
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		},
		error: function(e){
			console.log(e);
		}
		
	});//ajax
	
});


//검색 


	
$('#boardSearchBtn').click(function(){
	if($('#keyword').val()==''){
		 location.href = "boardList"
		alert('검색어를 입력하세요');
	}else{
		//기존의 <tr> 제거
		$(document).on('click','#boardSearchBtn',function(){
			$('.a').remove();
			//alert('리무브 진입');
		});
		//$('#boardListTable tr:gt(0)').remove();
		
		$.ajax({
			type: 'post',
			url:'/SpringProject/board/boardSearch',
			data:{	
				'pg' : $('input[name="pg"]').val(),
				'searchOption': $('#searchOption').val(),
				'keyword' : $('#keyword').val()
			},
			dataType:'json',
			success: function(data){
				
				$.each(data.list, function(index, items){
				
					$('<tr/>').addClass('a')
						.append($('<td/>',{
						align: 'center',
						text: items.seq
					})).append($('<td/>',{
						}).append($('<a/>',{
							href:'#',
							text: items.subject,
							class: 'subjectA subjectA_'+items.seq
						}))
					).append($('<td/>',{
						align: 'center',
						text: items.id
					})).append($('<td/>',{
						align: 'center',
						text: items.logtime.toLocaleString()
					})).append($('<td/>',{
						align: 'center',
						text: items.hit				
					})).appendTo($('#boardListTable'));
					//로그인 여부 비동적
					$('.subjectA_'+items.seq).click(function(){
						if(data.memId == null){
							alert('먼저 로그인하세요')
						}else{
							location.href = '/SpringProject/board/boardView?seq='
											+items.seq+'&pg='+$('#pg').val();
						}
					});
					//답글
					for(i=0; i<items.lev; i++){
						$('.subjectA_'+items.seq).before('&emsp;');
					}
					if(items.pseq != 0){
						$('.subjectA_'+items.seq)
							.before(
								$(
									'<img>'
									,{src:'SpringProject/image/reply.gif'
									}
								)
							)
					}//if
				
				
				});//each
				//페이징 처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			},
			error: function(e){
			console.log(e);
			}
			
			
		});//ajax
	}//else
	
	
});//click

















