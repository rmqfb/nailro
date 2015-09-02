<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="ml-20 notiHeadImg"><br><h1 class="pl-90"> 공 지 사 항 </h1></div>
<div id="notice"></div>

 <script type="text/javascript">
 $('#btnNotice').click(function() {
	 var data = 1;
	 notice.listOn(data);
	 });

	$(function() {
		$.getJSON('${root}/board/list/1/1', function(data) {
			$('#notice').empty();
			var id = $('#userid').val();
		var table = '<ul class="w-max ">';	
			table += '<li class="txt-r  pt-10 pb-10 mr-50">';
			table +=  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
			table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</li>';
			table += '<li class="w-1000"><ul class="boHead boBottom">';	
			$.each(data.list,function(){				
			table +='<li class="boBody over-hidden pt-10 pb-10"><a href="#" onclick="return notice.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
			table += '<strong>'+this.title+'</strong>	</a></br>';
			table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
			});
			table +='</li></ul>';
			table += '<li><ul class="txt-c">';
			table += '<nav><ul  class="pagination">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></ul></li>';
			if(id == "admin"){
				table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';
			}
			$('#notice').html(table);
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
				$('.pagination').append('<li ><a href="#" onclick="return notice.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
			} 
			for(var i=startPage;i<=endPage;i++){
				$('.pagination').append('<li><a href="#" onclick="return notice.listOn('+i+')">'+i+'</a></li>');
			}
			if(endPage < pageCount){
				$('.pagination').append('<li ><a href="#" onclick="return notice.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
			}
					
			notice.writeForm();
			notice.search();
		});
			
	});
	notice={}
	notice.noData = function() {
		var table = '<table class="tab">';
		table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';		
		table +='<tr>';
		table +='<td colspan="5"><p>등록된 데이터가 없습니다.</p></td>';
		table +='</tr>';
	table +='</table>';
	$('#notice').empty();
	$('#notice').html(table);
	}
	notice.list = function() {
		$.getJSON('${root}/board/list/1/1', function(data) {
			$('#notice').empty();
			var id = $('#userid').val();
		var table = '<ul class="w-max ">';	
			table += '<li class="txt-r  pt-10 pb-10 mr-50">';
			table +=  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
			table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</li>';
			table += '<li class="w-1000"><ul class="boHead boBottom">';	
			$.each(data.list,function(){				
			table +='<li class="boBody over-hidden pt-10 pb-10"><a href="#" onclick="return notice.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
			table += '<strong>'+this.title+'</strong>	</a></br>';
			table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
			});
			table +='</li></ul>';
			table += '<li><ul class="txt-c">';
			table += '<nav><ul  class="pagination">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></ul></li>';
			if(id == "admin"){
				table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';
			}
			$('#notice').html(table);
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
				$('.pagination').append('<li ><a href="#" onclick="return notice.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
			} 
			for(var i=startPage;i<=endPage;i++){
				$('.pagination').append('<li><a href="#" onclick="return notice.listOn('+i+')">'+i+'</a></li>');
			}
			if(endPage < pageCount){
				$('.pagination').append('<li ><a href="#" onclick="return notice.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
			}
					
			notice.writeForm();
			notice.search();
		});
	}
	notice.listOn = function(data) {
		$.getJSON('${root}/board/list/1/'+data, function(data) {
			$('#notice').empty();
			var id = $('#userid').val();
		var table = '<ul class="w-max ">';	
			table += '<li class="txt-r  pt-10 pb-10 mr-50">';
			table +=  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
			table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</li>';
			table += '<li class="w-1000"><ul class="boHead boBottom">';	
			$.each(data.list,function(){				
			table +='<li class="boBody over-hidden pt-10 pb-10"><a href="#" onclick="return notice.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
			table += '<strong>'+this.title+'</strong>	</a></br>';
			table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
			});
			table +='</li></ul>';
			table += '<li><ul class="txt-c">';
			table += '<nav><ul  class="pagination">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></ul></li>';
			if(id == "admin"){
				table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';
			}
			$('#notice').html(table);
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
				$('.pagination').append('<li ><a href="#" onclick="return notice.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
			} 
			for(var i=startPage;i<=endPage;i++){
				$('.pagination').append('<li><a href="#" onclick="return notice.listOn('+i+')">'+i+'</a></li>');
			}
			if(endPage < pageCount){
				$('.pagination').append('<li ><a href="#" onclick="return notice.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
			}
					
			notice.writeForm();
			notice.search();
		});
	}
	notice.searchForm = function(data) {
		$('#notice').empty();
		var id = $('#userid').val();
		var table = '<ul class="w-max ">';	
		table += '<li class="txt-r  pt-10 pb-10 mr-50">';
		table +=  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
		table += '<select name="searchKey" id="searchKey" class="mr-10 w-100 auto">';
		table += '<option  selected="selected">-----선택----</option>';
		table += '<option value="all"> 전체보기 </option>';
		table += '<option value="title"> 제 목 </option>';
		table += '<option value="content"> 내 용 </option>';
		table += '</select>';
		table += '<input type="text" name="searchVal" id="searchVal" class="w-300 auto mr-10" placeholder="검 색"/>';
		table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
		table += '</li>';
		table += '<li class="w-1000"><ul class="boHead boBottom">';	
		$.each(data.list,function(){				
		table +='<li class="boBody over-hidden pt-10 pb-10"><a href="#" onclick="return notice.detail('+this.brdNo+','+(this.readCnt+1)+',1)">';
		table += '<strong>'+this.title+'</strong>	</a></br>';
		table +=(this.content).substr(0,200)+'</br>| 작 성 자 | '+this.id+' | 조 회 수 | '+this.readCnt+' | 등 록 일 | '+this.boardDate+'</li>';
		});
		table +='</li></ul>';
		table += '<li><ul class="txt-c">';
		table += '<nav><ul  class="pagination">';
		/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
		
		/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
		table += '</ul></nav></ul></li>';
		if(id == "admin"){
			table +='<li><input id="btnWrite" type="button" class="btn_blue_ang w-60 mb-30" value="글쓰기"/></li>';
		}
		$('#notice').html(table);
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
			$('.pagination').append('<li ><a href="#" onclick="return notice.searchOn('+(startPage-pageSize)+',\''+data.searchKey+'\',\''+data.searchVal+'\')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
		} 
		for(var i=startPage;i<=endPage;i++){
			$('.pagination').append('<li><a href="#" onclick="return notice.searchOn('+i+',\''+data.searchKey+'\',\''+data.searchVal+'\')">'+i+'</a></li>');
		}
		if(endPage < pageCount){
			$('.pagination').append('<li ><a href="#" onclick="return notice.searchOn('+(startPage+pageSize)+',\''+data.searchKey+'\',\''+data.searchVal+'\')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
		}
				
		notice.writeForm();
		notice.search();
	}
	notice.search = function() {		
		$('#searchKey').on("change",function() {
			var searchKey = $(this).val();
			$('#searchBtn').click(function() {
				var searchVal = $('#searchVal').val();
				var allData = {"searchKey": searchKey, "searchVal": searchVal};
				$.ajax({
					url : '${root}/board/search/1/1',
					type : 'GET',
					data : allData,
					dataType : "json",
					contentType : 'application/json',
					success :function(data){
						if(data==null){
							notice.noData();
						}else{
							notice.searchForm(data);						
						}
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}				
				});
			});			
		});
	}
	notice.searchOn = function(pageNo,searchKey,searchVal) {
		
		switch (searchKey) {
		
		case "BBS_TITLE":	searchKey="title";	break;
		
		case "BBS_CONTENT": searchKey="content";	break;
		
		case "all" : searchKey="all"; break;
		default: break;		
		}
		
		var allData = {"searchKey": searchKey, "searchVal": searchVal};
				$.ajax({
					url : '${root}/board/search/1/'+pageNo ,
					type : 'GET',
					data : allData,
					dataType : "json",
					contentType : 'application/json',
					success :function(data){
						if(data == null){
							notice.noData();
						}else{
							notice.searchForm(data);
						}
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}
				
				});
	}	
	notice.writeForm = function(data) {
		$('#btnWrite').click(function(){
			var id = $('#userid').val();
			$('#notice').empty();
			$('#notice').append('<form action="${root}/board/write" id="frmWrite" method="post" enctype="multipart/form-data">');
			var table = '<input type="hidden" name="theme" value="1"/>';
			table += '<input type="hidden" name="pageNo" value="1"/>';
			table += '<table class="w-max txt-c bac-head" >';
			table += '<tr>';
			table += '<td  class="boHead pl-100 pt-10 pb-10 txt-l">관리자 아이디 :';
			table += '<input type="text" name="id" readonly value="'+id+'">';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td class=" pl-100 boBody pt-10 pb-10 txt-l" COLSPAN="2">';
			table += '<input type="text" required autofocus class="w-600" id="title" name="title" placeholder="제 목"/>';
			table += '</td>';
			table += '<tr>';
			table += '<td COLSPAN="2" class="boHead pt-10 pb-10">';
			table += '<textarea class="w-800 pb-20 h-300 res-verti" required autofocus name="content"></textarea>';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td COLSPAN="2" class="w-300 pl-100 pt-10 pb-10 txt-l auto">';
			table += '<div>';
			table += '<input type="submit" class="btn_blue_ang w-60 ml-20" value=" 전 송 "/>';	
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
							notice.list(data);
						}
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}
				});			
			});
			notice.cancl();
		});
	}
	
	notice.cancl = function() {
		$('#btnCancl').click(function() {notice.list()});
	}
	notice.detail = function(brdNo,readCnt) {	
		$.getJSON('${root}/board/detail/1/'+brdNo+'/'+readCnt+'/1', function(data) {
			notice.detailForm(data);	
		});
	}
	notice.detailForm = function(data) {
		$('#notice').empty();
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
		table += '<tr class="boHead txt-c">';
		table += '<td class="pt-30 pb-30" COLSPAN="8">';
		table += '<textarea class="w-900  h-300 res-verti" readonly name="content">'+data.content+'</textarea>';
		table += '</td>';
		table += '</tr>';		
		table += '<tr>';
		table += '<td  class="pb-20">';
		if(id == "admin"){
		table += '<input id="btnUpdate" class="btn_blue_ang mr-20 w-60" type="button" value="수정">';
		}
		table += '<input id="btnCancl" class="btn_blue_ang mr-20 w-60" type="button" value=" 목 록 "/>';
		table += '</td>';
		table += '</tr>';
		table += '</div>';
		table += '</div>';
		table += '</table>';
		$('#notice').html(table);
		notice.updateForm(data);
		notice.cancl();
	}
	notice.updateForm = function(data) {
		$('#btnUpdate').click(function() {
			$.getJSON('${root}/board/detail/1/'+data.brdNo+'/'+data.readCnt+'/1', function(data) {
			$('#notice').empty();
			$('#notice').append('<div class="w-max boHead bac-head boBottom"><form action="${root}/board/update" id="frmUpdate" >');
			var table = '<input type="hidden" name="brdNo" value="'+data.brdNo+'"/>';
			table += '<input type="hidden" name="theme" value="1"/>';
			table += '<input type="hidden" name="readCnt" value="'+data.readCnt+'"/>';
			table += '<input type="hidden" name="id" value="'+data.id+'"/>';
			table += '<div class="ml-80">';
			table += '<table class="w-900 mt-10">';
			table += '<tr class="txt-c bod"><td class="pb-10">글 번호</td><td class="pb-10">'+data.brdNo+'</td><td class="pb-10">작성자</td><td class="pb-10">관리자</td>';
			table += '<td class="pb-10">조회수</td><td class="pb-10">'+data.readCnt+'</td><td class="pb-10">작성일</td><td class="pb-10">'+data.boardDate+'</td></tr>';
			table += '<tr class="txt-l boBody"><td class=" pl-20 pb-10 pt-10"> 제 목 : </td><td class="w-800 pt-10 pb-10" COLSPAN="7">';
			table += '<input type="text" name="title" class="w-600" value="'+data.title+'"/></td>';
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
			$('#frmUpdate').html(table);			
			$('#frmUpdate').submit(function(event) {
				if(!confirm('수정 하시겠습니까?')){
					return false;
				}else{
					event.preventDefault();
					var Data = new FormData($('#frmUpdate')[0]);
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
								notice.detailForm(data);
							}
						},
						error :function(xhr,status,msg){
							alert('수정 에러 발생 상태'+ status +',메세지' + msg);
						}
					});
				}
			});			
			notice.cancl();
			});	
		});		
	}
	notice.remove = function(brdNo) {	
			if(!confirm('삭제 하시겠습니까?')){
				return false;
			}else{
				$.getJSON('${root}/board/delete/1/'+brdNo, function(data) {
					notice.list(data);
				});
		}	
	}
	
	
	
	
</script>