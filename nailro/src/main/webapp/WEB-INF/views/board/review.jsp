<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="ml-20 reHeadImg"><br><img class="ml-80" src="${context}/image/board/review.gif" alt=""></div>
<div id="review"></div>
<script type="text/javascript">

$('#btnBbs').click(function() {review.list();});
review = {}
$(function() {
	 $.getJSON('${root}/board/list/2/1', function(data) {
		 $('#review').empty();
			var id = $('#userid').val();
			var table = '<ul class="w-max ">';		
			table += '<li class="txt-r  pt-10 pb-10 mr-50">';
			table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '<option value="id"> 아 이 디 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</li>';
			table += '<li class="w-1000"><ul class="boHead boBottom">';	
			$.each(data.list,function(){				
			table +='<li class="boBody over-hidden pt-10"><a href="#" onclick="return review.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
			table += '<img src="${context}/image/board/'+this.path+'" class="listImg" alt=""><strong>'+this.title+'</strong></a></br>';
			table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
			});
			table +='</li></ul>';
			table += '<li><ul class="txt-c">';
			table += '<nav><ul  class="pagination">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></ul></li>';
			table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';		
			$('#review').html(table);
			var pageSize = 5; /*페이지 블록이 5*/
			var rowPerPage = 10; /* 한 페이지당 로우 갯수 */
			var rowCount = data.size;
			var pageCount = Math.floor(rowCount / rowPerPage) + (rowCount % pageSize == 0 ? 0 : 1); 
			/* Math.floor 는 소수점 이하는 무조건 생략*/
			/* Math.ceil  는 소수점 이하는 무조건 올림*/
			var currentPage = data.currentPage;
			var nmg = currentPage % pageSize;
			var startPage = 0;
			if(nmg != 0){
				startPage = currentPage - nmg + 1;	
			}else{
				startPage = currentPage - (pageSize-1);
			}
			
			var endPage = startPage + pageSize - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			console.log('시작페이지 :' + startPage + ' 현재페이지 :' + currentPage + ' 끝페이지 :' + endPage + ' 페이지카운트 : '+ pageCount);
			if(startPage > pageSize){
				$('.pagination').append('<li ><a href="#" onclick="return review.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
			} 
			for(var i=startPage;i<=endPage;i++){
				$('.pagination').append('<li><a href="#" onclick="return review.listOn('+i+')">'+i+'</a></li>');
			}
			if(endPage < pageCount){
				$('.pagination').append('<li ><a href="#" onclick="return review.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
			}
			review.writeForm(data);
			review.search();
	});		
});

review.list = function() {
	$.getJSON('${root}/board/list/2/1', function(data) {
		 $('#review').empty();
			var id = $('#userid').val();
			var table = '<ul class="w-max ">';		
			table += '<li class="txt-r  pt-10 pb-10 mr-50">';
			table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '<option value="id"> 아 이 디 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</li>';
			table += '<li class="w-1000"><ul class="boHead boBottom">';	
			$.each(data.list,function(){				
			table +='<li class="boBody over-hidden pt-10"><a href="#" onclick="return review.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
			table += '<img src="${context}/image/board/'+this.path+'" class="listImg" alt=""><strong>'+this.title+'</strong></a></br>';
			table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
			});
			table +='</li></ul>';
			table += '<li><ul class="txt-c">';
			table += '<nav><ul  class="pagination">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></ul></li>';
			table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';			
			$('#review').html(table);
			var pageSize = 5; /*페이지 블록이 5*/
			var rowPerPage = 10; /* 한 페이지당 로우 갯수 */
			var rowCount = data.size;
			var pageCount = Math.floor(rowCount / rowPerPage) + (rowCount % pageSize == 0 ? 0 : 1); 
			/* Math.floor 는 소수점 이하는 무조건 생략*/
			/* Math.ceil  는 소수점 이하는 무조건 올림*/
			var currentPage = data.currentPage;
			var nmg = currentPage % pageSize;
			var startPage = 0;
			if(nmg != 0){
				startPage = currentPage - nmg + 1;	
			}else{
				startPage = currentPage - (pageSize-1);
			}
			
			var endPage = startPage + pageSize - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			console.log('시작페이지 :' + startPage + ' 현재페이지 :' + currentPage + ' 끝페이지 :' + endPage + ' 페이지카운트 : '+ pageCount);
			if(startPage > pageSize){
				$('.pagination').append('<li ><a href="#" onclick="return review.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
			} 
			for(var i=startPage;i<=endPage;i++){
				$('.pagination').append('<li><a href="#" onclick="return review.listOn('+i+')">'+i+'</a></li>');
			}
			if(endPage < pageCount){
				$('.pagination').append('<li ><a href="#" onclick="return review.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
			}
			review.writeForm(data);
			review.search();
	});		
}
review.listOn = function(pageNo) {
	$.getJSON('${root}/board/list/2/'+pageNo, function(data) {
		 $('#review').empty();
			var id = $('#userid').val();
			var table = '<ul class="w-max ">';		
			table += '<li class="txt-r  pt-10 pb-10 mr-50">';
			table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '<option value="id"> 아 이 디 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</li>';
			table += '<li class="w-1000"><ul class="boHead boBottom">';	
			$.each(data.list,function(){				
			table +='<li class="boBody over-hidden pt-10"><a href="#" onclick="return review.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
			table += '<img src="${context}/image/board/'+this.path+'" class="listImg" alt=""><strong>'+this.title+'</strong></a></br>';
			table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
			});
			table +='</li></ul>';
			table += '<li><ul class="txt-c">';
			table += '<div class="w-600 auto">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></ul></li>';
			table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';		
			$('#review').html(table);
			var pageSize = 5; /*페이지 블록이 5*/
			var rowPerPage = 10; /* 한 페이지당 로우 갯수 */
			var rowCount = data.size;
			var pageCount = Math.floor(rowCount / rowPerPage) + (rowCount % pageSize == 0 ? 0 : 1); 
			/* Math.floor 는 소수점 이하는 무조건 생략*/
			/* Math.ceil  는 소수점 이하는 무조건 올림*/
			var currentPage = data.currentPage;
			var nmg = currentPage % pageSize;
			var startPage = 0;
			if(nmg != 0){
				startPage = currentPage - nmg + 1;	
			}else{
				startPage = currentPage - (pageSize-1);
			}
			
			var endPage = startPage + pageSize - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			console.log('시작페이지 :' + startPage + ' 현재페이지 :' + currentPage + ' 끝페이지 :' + endPage + ' 페이지카운트 : '+ pageCount);
			if(startPage > pageSize){
				$('.pagination').append('<li ><a href="#" onclick="return review.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
			} 
			for(var i=startPage;i<=endPage;i++){
				$('.pagination').append('<li><a href="#" onclick="return review.listOn('+i+')">'+i+'</a></li>');
			}
			if(endPage < pageCount){
				$('.pagination').append('<li ><a href="#" onclick="return review.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
			}
			review.writeForm(data);
			review.search();
	});		
}
review.searchForm = function(data) {
	$('#review').empty();
	 $('#review').empty();
		var id = $('#userid').val();
		var table = '<ul class="w-max ">';		
		table += '<li class="txt-r  pt-10 pb-10 mr-50">';
		table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
		table += '<option  selected="selected">-----선택----</option>';
		table += '<option value="all"> 전체보기 </option>';
		table += '<option value="title"> 제 목 </option>';
		table += '<option value="content"> 내 용 </option>';
		table += '<option value="id"> 아 이 디 </option>';
		table += '</select>';
		table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
		table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
		table += '</li>';
		table += '<li class="w-1000"><ul class="boHead boBottom">';	
		$.each(data.list,function(){				
		table +='<li class="boBody over-hidden pt-10"><a href="#" onclick="return review.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
		table += '<img src="${context}/image/board/'+this.path+'" class="listImg" alt=""><strong>'+this.title+'</strong></a></br>';
		table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
		});
		table +='</li></ul>';
		table += '<li><ul class="txt-c">';
		table += '<nav><ul  class="pagination">';
		/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
		
		/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
		table += '</ul></nav></ul></li>';
		table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';	
		$('#review').html(table);
	var pageSize = 5; /*페이지 블록이 5*/
	var rowPerPage = 10; /* 한 페이지당 로우 갯수 */
	var rowCount = data.size;
	var pageCount = Math.floor(rowCount / rowPerPage) + (rowCount % pageSize == 0 ? 0 : 1); 
	/* Math.floor 는 소수점 이하는 무조건 생략*/
	/* Math.ceil  는 소수점 이하는 무조건 올림*/
	var currentPage = data.currentPage;
	var nmg = currentPage % pageSize;
	var startPage = 0;
	if(nmg != 0){
		startPage = currentPage - nmg + 1;	
	}else{
		startPage = currentPage - (pageSize-1);
	}
	
	var endPage = startPage + pageSize - 1;
	if(endPage > pageCount){
		endPage = pageCount;
	}
	console.log('시작페이지 :' + startPage + ' 현재페이지 :' + currentPage + ' 끝페이지 :' + endPage + ' 페이지카운트 : '+ pageCount);
	if(startPage > pageSize){
		$('.pagination').append('<li ><a href="#" onclick="return review.searchOn('+(startPage-pageSize)+',\''+data.searchKey+'\',\''+data.searchVal+'\')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
	} 
	for(var i=startPage;i<=endPage;i++){
		$('.pagination').append('<li><a href="#" onclick="return review.searchOn('+i+',\''+data.searchKey+'\',\''+data.searchVal+'\')">'+i+'</a></li>');
	}
	if(endPage < pageCount){
		$('.pagination').append('<li ><a href="#" onclick="return review.searchOn('+(startPage+pageSize)+',\''+data.searchKey+'\',\''+data.searchVal+'\')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
	}
	review.writeForm(data);
	review.search();
}


review.search = function(data) {
	$('#searchKey').on("change",function(data) {
		var searchKey = $(this).val();
		$('#searchBtn').click(function() {
			var searchVal = $('#searchVal').val();
			var allData = {"searchKey": searchKey, "searchVal": searchVal};
			$.ajax({
				url : '${root}/board/search/2/1',
				type : 'GET',
				data : allData,
				dataType : "json",
				contentType : 'application/json',
				success :function(data){
					if(data==null){
						notice.noData();
					}else{
						review.searchForm(data);
					}
				},
				error :function(xhr,status,msg){
					alert('수정 에러 발생 상태'+ status +',메세지' + msg);
				}
			
			});
		});			
	});
}
review.searchOn = function(pageNo,searchKey,searchVal) {
	
	switch (searchKey) {
	
	case "BBS_TITLE":	searchKey="title";	break;
	
	case "BBS_CONTENT": searchKey="content";	break;
	
	case "ID": searchKey="id";	break;
	
	case "all" : searchKey="all"; break;
	
	default: break;		
	}
	
	var allData = {"searchKey": searchKey, "searchVal": searchVal};
			$.ajax({
				url : '${root}/board/search/2/'+pageNo ,
				type : 'GET',
				data : allData,
				dataType : "json",
				contentType : 'application/json',
				success :function(data){
					if(data==null){
						notice.noData();
					}else{
						review.searchForm(data);
					}
				},
				error :function(xhr,status,msg){
					alert('수정 에러 발생 상태'+ status +',메세지' + msg);
				}
			
			});
}
review.writeForm = function(data) {
	$('#btnWrite').click(function() {
		var id = $('#userid').val();
		if(id == ""){
			alert('로그인 해주시기 바랍니다.');
			return false;
		}else{
		$('#review').empty();
		$('#review').append('<form action="${root}/board/write" id="frmWrite" method="post" enctype="multipart/form-data">');
		var table = '<input type="hidden" name="theme" value="2"/>';
			table += '<input type="hidden" name="pageNo" value="1"/>';
			table += '<table class="w-max txt-c bac-head" >';
			table += '<tr>';
			table += '<td  class="boHead pl-100 pt-10 pb-10 txt-l">사용자 아이디 :';
			table += '<input type="text" name="id" readonly value="'+id+'">';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td class=" pl-100 boBody pt-10 pb-10 txt-l" COLSPAN="2">';
			table += '<input type="text" required autofocus class="w-600" name="title" placeholder="제 목"/>';
			table += '</td>';
			table += '<tr>';
			table += '<td class="pl-100 boBody pt-10 pb-10" COLSPAN="2">';
			table +='<input type="file" id="file" name="file" class="w-200" value="이미지 첨부"/></td>';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td COLSPAN="2" class="boHead pt-10 pb-10">';
			table += '<textarea class="w-800 pb-20 h-300 res-verti" required autofocus name="content"></textarea>';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td COLSPAN="2" class="w-300 pl-100 pt-10 pb-10 txt-l auto">';
			table += '<div>';
			table += '<input  type="submit" class="btn_blue_ang w-60 ml-20" value=" 전 송 "/>';	
			table += '<input id="btnCancl" type="button" class="ml-20 btn_blue_ang w-60" value=" 취 소 "/>';
			table += '</div>';	
			table += '</td>';
			table += '</tr>';
			table += '</table>';
		$('#frmWrite').html(table);
			$('#frmWrite').submit(function(event) {
				event.preventDefault();
				var postData = new FormData($('#frmWrite')[0]);				
				$.ajax({
					url :'${root}/board/write',
					type : 'POST',
					data : postData,
					async : true, /* 비동기를 활성화 */ 
					dataType : 'json',					
					mimeType : 'multipart/form-data',
					processData : false,
					contentType:false,
					success :function(data){
						if(data==null){
							notice.noData();
						}else{
							review.list(data);
						}
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}
				});
			});
		review.cancl();
		}
	});	
}
review.cancl = function() {		
	$('#btnCancl').click(function() {
	    var pageNo = 1 ;
		review.list(pageNo);
	});
}
review.detail = function(brdNo,readCnt,replePageNo) {
	$.getJSON('${root}/board/detail/2/'+brdNo+'/'+readCnt+'/'+replePageNo, function(data) {
			review.detailForm(data);
	});
}
review.detailForm = function(data) {
	$('#review').empty();
	var id = $('#userid').val();
	var table = '<div class="w-max boHead bac-head boBottom ">';
	table += '<input type="hidden" name="theme" value="2"/>';
	table += '<div class="ml-80">';
	table += '<table class="mt-10">';
	table += '<tr class="txt-c bod"><td class="pb-10">글 번호</td><td class="pb-10">'+data.brdNo+'</td><td class="pb-10">작성자</td><td class="pb-10">'+data.id+'</td>';
	table += '<td class="pb-10">조회수</td><td class="pb-10">'+data.readCnt+'</td><td class="pb-10">작성일</td><td class="pb-10">'+data.boardDate+'</td></tr>';
	table += '<tr class="txt-l boBody"><td class=" pl-20 pb-10 pt-10"> 제 목 : </td><td class="w-800 pt-10 pb-10" COLSPAN="7">';
	table += '<input type="text" name="title" class="w-600" readonly value="'+data.title+'"/></td>';
	table += '</tr>';
	table += '<tr class="txt-l boBody">';
	table += '<td class="pl-20 pb-10 pt-10 pr-20"> 첨 부 파 일 : </td>';
	table += '<td COLSPAN="7" class="pb-10 pt-10">';
	table += '<input type="text" name="path" calss="w-200" readonly value="'+data.path+'"/></td>';
	table += '</td>';
	table += '</tr>';
	table += '<tr class="boHead txt-c">';
	table += '<td class="pt-30 pb-30" COLSPAN="8">';
	table += '<textarea class="w-900  h-300 res-verti" readonly name="content">'+data.content+'</textarea>';
	table += '</td>';
	table += '</tr>';
	table += '</table>';
	table += '<div style="margin: 0 auto ;">';
	table += '<form action="${root}/board/repleInsert" id="frmReple">';
	table += '<table class="txt-c w-900">';
	table += '<tr>';
	table += '<input type="hidden" name="theme" value="2"/>';
	table += '<input type="hidden" name = "brdNo" value="'+data.brdNo+'" />';
	table += '<input type="hidden" name = "replePageNo" value="1" />';
	table += '<td class="pb-20"><input type="text" class="w-100 h-30 mr-20" readonly name="id" value="'+id+'"/>';		
	table += '<textarea name = "repleContent" class=" w-500 auto h-30  mr-20  ver-m res-verti"></textarea>';
	table += '<input type="submit"  class="btn_blue_ang" id = "repleInBtn" value=" 등 록 " /></td>';
	table +='</tr>';
	table += '</table>';
	table += '</form>';
	table += '</div>';
	table += '<table class="w-900 boHead">';
	$.each(data.list,function(){
	table += '<tr><td class="pt-10 pb-10 pl-20 whiteBac boBody"> 작성자 | '+this.id+' | '+this.repleDate+' | ';
	if(id == this.id){
		table += '<a href="#" class="ml-100 h-20 deleteImg" onclick="return review.repleDelete('+data.brdNo+','+this.repleNo+',1)">';
		table += '<img src="${context}/image/board/img_close.gif" alt="삭제"/></a>';
		}
	table +='</br>';
	table += '<input type="hidden" id="dtRepleNo" calsss="mr-20 ml-20 " value="'+this.repleNo+'"/>';
	table += this.repleContent;
	
	table += '</td></tr>';
	});
	table += '<tr class="boTop"><td colspan="5">';
	table += '<div style="width:600px;margin:0 auto">';
	table += '<nav><ul  class="pagination">';
	/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
	
	/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
	table += '</ul></nav></div></td></tr>';
	table += '<tr>';
	table += '<td  class="pb-20">';
	if(id == data.id){
	table += '<input id="btnUpdate" type="button" class="btn_blue_ang mr-20 w-60" value="수정"/>';
	}
	table += '<input id="btnCancl" type="button" class="btn_blue_ang w-60" value="취 소"/></td>';	
	table += '</tr>';
	table += '</table>';
	table += '</div>';
	table += '</div>';
	$('#review').html(table);
	review.updateForm(data);
	review.repleInsert();
	review.cancl();
	
	var pageSize = 5; /*페이지 블록이 5*/
	var rowPerPage = 5; /* 한 페이지당 로우 갯수 */
	var rowCount = data.size;
	var pageCount = Math.floor(rowCount / rowPerPage) + (rowCount % pageSize == 0 ? 0 : 1); 
	var currentPage = data.currentPage;
	var nmg = currentPage % pageSize;
	var startPage = 0;
	if(nmg != 0){
		startPage = currentPage - nmg + 1;
	}else{
		startPage = currentPage - (pageSize-1);
	}
	
	var endPage = startPage + pageSize - 1;
	if(endPage > pageCount){
		endPage = pageCount;
	}
	console.log('나머지'+nmg);
	console.log('시작페이지 :' + startPage + ' 현재페이지 :' + currentPage + ' 끝페이지 :' + endPage + ' 페이지카운트 : '+ pageCount);
	if(startPage > pageSize){
		$('.pagination').append('<li ><a href="#" onclick="return review.detail('+data.brdNo+','+data.readCnt+','+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
	} 
	for(var i=startPage;i<=endPage;i++){
		$('.pagination').append('<li><a href="#" onclick="return review.detail('+data.brdNo+','+data.readCnt+','+i+')">'+i+'</a></li>');
	}
	if(endPage < pageCount){
		$('.pagination').append('<li ><a href="#" onclick="return review.detail('+data.brdNo+','+data.readCnt+','+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
	}	
}
review.repleDelete = function(brdNo,repleNo,replePageNo) {
	if(!confirm('삭제 하시겠습니까?')){
		return false;
	}else{
		var replePageNo = 1;
		var allData = {"brdNo" : brdNo, "repleNo" : repleNo,"replePageNo" : replePageNo};
		$.ajax({
			url : '${root}/board/repleDelete/2',
			type : 'GET',
			data : allData,
			dataType : "json",
			contentType : 'application/json',
			success :function(data){
				review.detailForm(data);
			},
			error :function(xhr,status,msg){
				alert('수정 에러 발생 상태'+ status +',메세지' + msg);
			}
		});
	}
}
review.repleInsert  = function() {
	var id = $('#userid').val();
	$('#repleInBtn').click(function() {
		if(id == ""){
			alert('로그인 해주시기 바랍니다.');
			return false;
		}else{
			$('#frmReple').submit(function(e) {
				e.preventDefault();
				var $form = $('#frmReple');
				var $data = $form.serialize();
				var $url = $form.attr('action');
				$.ajax({
					url : $url,
					type : 'GET',
					data : $data,
					dataType : "json",
					contentType : 'application/json',
					success :function(data){
						review.detailForm(data);
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}
				});
			});
		}
	});			
}
review.updateForm = function(data) {
	$('#btnUpdate').click(function() {
		$.getJSON('${root}/board/detail/2/'+data.brdNo+'/'+data.readCnt+'/1', function(data) {
			$('#review').empty();		
			$('#review').append('<div class="w-max boHead bac-head boBottom"><form action="${root}/board/update/2" name = "reviewUpdate" id = "reviewUpdate"  method="post" enctype="multipart/form-data">');			
			var table = '<input type="hidden" name="brdNo" value="'+data.brdNo+'"/>';
				table += '<input type="hidden" name="theme" value="2"/>';
				table += '<input type="hidden" name="replePageNo" value="1"/>';
				table += '<input type="hidden" name="readCnt" value="'+data.readCnt+'"/>';
				table += '<input type="hidden" name="id" value="'+data.id+'"/>';
				table += '<div class="ml-80">';
				table += '<table class="w-900 mt-10">';
				table += '<tr class="txt-c bod"><td class="pb-10">글 번호</td><td class="pb-10">'+data.brdNo+'</td><td class="pb-10">작성자</td><td class="pb-10">'+data.id+'</td>';
				table += '<td class="pb-10">조회수</td><td class="pb-10">'+data.readCnt+'</td><td class="pb-10">작성일</td><td class="pb-10">'+data.boardDate+'</td></tr>';
				table += '<tr class="txt-l boBody"><td class=" pl-20 pb-10 pt-10"> 제 목 : </td><td class="w-800 pt-10 pb-10" COLSPAN="7">';
				table += '<input type="text" name="title" class="w-600" value="'+data.title+'"/></td>';
				table += '</tr>';
				table += '<tr class="txt-l boBody">';
				table += '<td class="pl-100 pt-10 pb-10" COLSPAN="2">';
				table +='<input type="file" id="file" name="file" class="w-200" value="이미지 첨부"/></td>';
				table += '</td>';
				table += '</tr>';
				table += '<tr class="boHead txt-c">';
				table += '<td class="pt-30 pb-30" COLSPAN="8">';
				table += '<textarea class="w-900  h-300 res-verti" name="content">'+data.content+'</textarea>';
				table += '</td>';
				table += '</tr>';
				table += '<tr>';
				table += '<td class="pb-40 txt-l" COLSPAN="8"><input type="submit" class="btn_blue_ang mr-20 w-80" value="수정확인">';			
				table += '<input id="btnRemove" type="button" onclick="return review.remove('+data.brdNo+')" class="btn_blue_ang mr-20 w-60" value="삭제"/>';
				table += '<input id="btnCancl" type="button" class="btn_blue_ang w-60" value="취 소"/></td>';			
				table += '</tr>';
				table += '</table></div></form></div>';
				$('#reviewUpdate').html(table);
				$('#reviewUpdate').submit(function(event) {
					if(!confirm('수정 하시겠습니까?')){
						return false;
					}else{
						event.preventDefault();
						var Data = new FormData($('#reviewUpdate')[0]);
						$.ajax({
							url :'${root}/board/update',
							type : 'POST',
							data : Data,
							async : true, /* 비동기를 활성화 */ 
							dataType : 'json',
							mimeType : 'multipart/form-data',
							processData : false,
							contentType : false,
							success :function(data){
								if(data==null){
									notice.noData();
								}else{
									review.detailForm(data);
								}
							},
							error :function(xhr,status,msg){
								alert('수정 에러 발생 상태'+ status +',메세지' + msg);
							}
						});
					}
				});
				review.cancl();
		});
	});	
}
review.remove = function(brdNo) {
	if(!confirm('삭제 하시겠습니까?')){
		return false;
	}else{
		$.getJSON('${root}/board/delete/2/'+brdNo, function(data) {
			review.list(data);
		});		
	}
}

</script>