<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> --%>
<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<h3>게시판</h3>
		<ul>
			<li><a id="btnNotice" href="#">공 지 사 항 </a></li>
			<li><a id="btnFaq" href="#">F A Q </a></li>
			<li><a id="btnBbs" href="#">후기 게시판</a></li>
		</ul>
<div id="main"></div>

 <script type="text/javascript">
 $('#btnNotice').click(function() {
	 var data = 1;
	 notice.listOn(data);
	 });
 $('#btnBbs').click(function() {review.list();});
	$(function() {
		$.ajax({
			url: '${root}/board/list/1/1',
			Type: 'GET',
			dataType: 'JSON',
			contentType: 'application/json',
			success: function(data) {		
				notice.listForm(data);
			},
			error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
			}
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
	$('#main').empty();
	$('#main').html(table);
	}
	notice.list = function() {
		$.ajax({
			url: '${root}/board/list/1/1',
			Type: 'GET',
			dataType: 'JSON',
			contentType: 'application/json',
			success: function(data) {
				notice.listForm(data);
			},
			error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
			}
		});
	}
	notice.listOn = function(data) {
		$.ajax({
			url: '${root}/board/list/1/'+data,
			Type: 'GET',
			dataType: 'JSON',
			contentType: 'application/json',
			success: function(data) {
				notice.listForm(data);
			},
			error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
			}
		});
	}	
	notice.listForm = function(data) {
		$('#main').empty();
		var idVal = '<input type="hidden" id="id" value="${member.id}"/>';
		$('#main').html(idVal);	
		var id = $('#id').val();
	var table =  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
		table += '<table id="boTable">';
		table += '<td style = "text-align: end">';
		table += '<select name="searchKey" id="searchKey" style = "width: 100px; margin: 0 ;">';
		table += '<option  selected="selected">-----선택----</option>';
		table += '<option value="all"> 전체보기 </option>';
		table += '<option value="title"> 제 목 </option>';
		table += '<option value="content"> 내 용 </option>';	
		table += '</select>';
		table += '<input type="text" name="searchVal" id="searchVal" style = "width: 300px; margin: 0 ;" placeholder="검 색"/>';
		table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
		table += '</table>';
		table += '<table id="boTable"><tr><th width="10px">번 호</th><th width="150px">제 목</th><th width="40px">작 성 자</th><th width="50px">등 록 일</th><th width="25px">조 회 수</th></tr>';
		$.each(data.list,function(){
		table += '<tr><td>'+this.brdNo+'</td>';
		table += '<td><a href="#" onclick="return notice.detail('+this.brdNo+','+(this.readCnt+1)+')">'+this.title+'</a></td><td>관리자</td>';
		table += '<td>'+this.boardDate+'</td><td>'+this.readCnt+'</td></tr>';
		});
		table += '<tr><td colspan="5">';
		table += '<div style="width:600px;margin:0 auto">';
		table += '<nav><ul  class="pagination">';
		/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
		
		/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
		table += '</ul></nav></div></td></tr>';
		if(id == "admin"){
		table +='<tr><td><input id="btnWrite" type="button" value="글쓰기"/></td></tr>';
		}
		table +='</table>';
		$('#main').html(table);
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
	}
	
	
	notice.cancl = function() {
		$('#btnCancl').click(function() {
			notice.list();
			});
	}
	notice.searchForm = function(data) {
		$('#main').empty();
	var table =  '<input type="hidden" id="pageNo" value='+this.pageNo+'/>';
		table += '<table id="boTable">';
		table += '<td style = "text-align: end">';
		table += '<select name="searchKey" id="searchKey" style = "width: 100px; margin: 0 ;">';
		table += '<option  selected="selected">-----선택----</option>';
		table += '<option value="all"> 전체보기 </option>';
		table += '<option value="title"> 제 목 </option>';
		table += '<option value="content"> 내 용 </option>';	
		table += '</select>';
		table += '<input type="text" name="searchVal" id="searchVal" style = "width: 300px; margin: 0 ;" placeholder="검 색"/>';
		table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
		table += '</table>';
		table += '<table id="boTable"><tr><th width="10px">번 호</th><th width="150px">제 목</th><th width="40px">작 성 자</th><th width="50px">등 록 일</th><th width="25px">조 회 수</th></tr>';
		$.each(data.list,function(){
		table += '<tr><td>'+this.brdNo+'</td>';
		table += '<td><a href="#" onclick="return notice.detail('+this.brdNo+','+(this.readCnt+1)+')">'+this.title+'</a></td><td>관리자</td>';
		table += '<td>'+this.boardDate+'</td><td>'+this.readCnt+'</td></tr>';
		});
		table += '<tr><td colspan="5">';
		table += '<div style="width:600px;margin:0 auto">';
		table += '<nav><ul  class="pagination">';
		/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
		
		/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
		table += '</ul></nav></div></td></tr>';
		table +='<tr><td><input id="btnWrite" type="button" value="글쓰기"/></td></tr>';
		table +='</table>';
		$('#main').html(table);
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
	}	
	notice.writeForm = function(data) {
		$('#btnWrite').click(function(){
		$('#main').empty();
		$('#main').append('<form action="${root}/board/write/관리자" id="frmWrite">');
		var table = '<input type="hidden" name="theme" value="1"/>';
			table += '<input type="hidden" name="pageNo" value="1"/>';
			table += '<table class="tab" style="width: 700px; margin: 0 auto;">';
			table += '<tr>';
			table += '<td style="width: 100%; height: 50px">';
			table += '<input type="text" name="title" required autofocus style="width: 90%" placeholder="제 목"/>';
			table += '</td>';
			table += '<tr>';
			table += '<td style="width: 100%;">';
			table += '<input type="hidden" name="path" style="width: 90%" placeholder="첨부파일"/>';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td>';
			table += '<textarea rows="10" cols="100" required autofocus name="content" placeholder=" 글쓰기 란 "></textarea>';
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td>';
			table += '<div style="width: 300px; margin: 0 auto;">';
			table += '<input id="btnConfirm" type="submit" style="width: 100px;" value=" 전 송 "/>';	
			table += '<input id="btnCancl" type="button" style="width: 100px;" value=" 취 소 "/>';	
			table += '</div>';	
			table += '</td>';
			table += '</tr>';
			table += '</table>';		
		$('#frmWrite').html(table);
		notice.writeConfirm();
		notice.cancl();
		});
	}
	notice.writeConfirm = function() {
		$('#btnConfirm').click(function() {
			$('#frmWrite').submit(function() {
				event.preventDefault();
				var $form = $('#frmWrite');
				var $data = $form.serialize();
				var $url = $form.attr('action');
				$.ajax({
					url : $url,
					type : 'GET',
					data : $data,
					dataType : "json",
					contentType : 'application/json',
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
		});
	}
	notice.detail = function(brdNo,readCnt) {
		$.ajax({
			url : '${root}/board/detail/1/'+brdNo+'/'+readCnt,
			type : 'GET',
			dataType : 'JSON',
			
			contentType : 'application/json',
			success : function(data){
				notice.detailForm(data);
			},
			error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
			}
		});
	}
	notice.detailForm = function(data) {
		$('#main').empty();
		var idVal = '<input type="hidden" id="id" value="${member.id}"/>';
		$('#main').html(idVal);	
		var id = $('#id').val();
		var table = '<input type="hidden" name="theme" value="1"/>';
		table += '<table id="boTable" style="width: 700px; margin: 0 auto;">';
		table += '<tr><td>글 번호</td><td>'+data.brdNo+'</td><td>작성자</td><td>관리자</td>';
		table += '<td>조회수</td><td>'+data.readCnt+'</td><td>작성일</td><td>'+data.boardDate+'</td></tr>';
		table += '<tr><td style=" height: 50px"COLSPAN="8">';
		table += '<input type="text" name="title" style="width: 90%" readonly value="'+data.title+'"/></td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td COLSPAN="8">';
		table += '<textarea rows="10" cols="100" readonly name="content">'+data.content+'</textarea>'
		table += '</td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td>';
		table += '<div style="margin: 0 auto;"></td>';
		if(id == "admin"){
		table += '<td><input id="btnUpdate" type="button" style="width: 50px;" value="수정"></td>';
		}
		table += '<td><input id="btnCancl" type="button" style="width: 50px;" value=" 목 록 "/></td>';
		table += '</div>';
		table += '</tr>';
		table += '</table>';		
		$('#main').html(table);
		notice.updateForm(data);
		notice.cancl();
	}
	notice.updateForm = function(data) {
		$('#btnUpdate').click(function() {			
			$('#main').empty();
			$('#main').append('<form action="${root}/board/update/1" id="frmUpdate">');
			var table = '<input type="hidden" name="brdNo" value="'+data.brdNo+'"/>';
			table += '<table id="boTable" style="width: 700px; margin: 0 auto;">';		
			table += '<tr><td>작성자</td><td>관리자</td>';
			table += '<td>조회수</td><td>'+data.readCnt+'</td><td>작성일</td><td>'+data.boardDate+'</td></tr>';
			table += '<tr><td style=" height: 50px"COLSPAN="8">';
			table += '<input type="text" name="title" required autofocus style="width: 90%" value="'+data.title+'"/></td>';
			table += '</tr>';
			table += '<tr><td COLSPAN="8">';
			table += '<input type="hidden" name="path" style="width: 90%" value="'+data.path+'"/></td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td COLSPAN="8">';
			table += '<textarea rows="10" cols="100" required autofocus name="content">'+data.content+'</textarea>'
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td>';
			table += '<div style="margin: 0 auto;"></td>';
			table += '<td><input id="btnConfirm" type="submit" value="수정확인">';			
			table += '<input id="btnRemove" type="button" onclick="return notice.remove('+data.brdNo+')" style="width: 50px;" value="삭제"/>';
			table += '<input id="btnCancl" type="button" style="width: 50px;" value="취 소"/></td>';
			table += '</div>';
			table += '</tr>';
			table += '</table>';
			$('#frmUpdate').html(table);
			notice.updateConfirm();
			notice.cancl();
		});		
	}
	notice.updateConfirm = function() {		
		$('#btnConfirm').click(function() {
			if(!confirm('수정 하시겠습니까?')){
				return false;
			}else{
				$('#frmUpdate').submit(function() {
					event.preventDefault();
					var $form = $('#frmUpdate');
					var $data = $form.serialize();
					var $url = $form.attr('action');
					$.ajax({
						url : $url,
						type : 'GET',
						data : $data,
						dataType : "json",
						contentType : 'application/json',
						success :function(data){						
								notice.detailForm(data);
						},
						error :function(xhr,status,msg){
							alert('수정 에러 발생 상태'+ status +',메세지' + msg);
						}
					});
				});	
			}						
		});
	}	
	notice.remove = function(brdNo) {
	
			if(!confirm('삭제 하시겠습니까?')){
				return false;
			}else{
				$.ajax({
					url : '${root}/board/delete/1/'+brdNo,
					type : 'GET',
					dataType : "json",
					contentType : 'application/json',
					success :function(data){
							notice.list(data);
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}
				});
			}				
	
	}	
	$('#btnFaq').click(function() {			
			var table = '<div class="tab line "><ul><li><a href="#"><span>예매 방법</span></a><ul><li class="active">';
				table +='<table>';
				table +='<caption>홈티켓 예매</caption><tbody><tr ><th>Q. 홈티켓 구입시 왜 열차출발 20분 이전으로 제한 했습니까?</th></tr>';
				table +='<tr><td>홈티켓은 가정 또는 직장에서 승차권을 발권하므로 열차를 이용하기 위하여 역까지 이동하는 시간을 고려하여 미리 구입하도록 하였습니다.</td></tr>';
				table +='<tr ><th>Q. 홈티켓 발권은 모든 승차권에 대하여 가능합니까?</th></tr>';
				table +='<tr><td>예약 후 결제된 승차권에 대하여 가능합니다. 그러나 예약 후 결제된 승차권의 경우에도 단체승차권의 발권은 불가능합니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓 승차권을 구입하였으나 해당열차에 탑승하지 못 할 경우 사후 처리가	궁금합니다.</th></tr>';
				table +='<tr><td >승차권면의 도착역 도착 전까지 창구에 홈티켓을 제출하면 여객운송약관에 따라 운임 ·<br/> 요금을 결제수단에 따라 신용 또는 계좌이체로 반환하여 드리며 소정의 반환 수수료를 별도로 청구합니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓을 모두 4장 구입하였으나 3장만 필요할 경우, 함께 여행 예정이던 1명의 승차권을 반환처리 할 수 있습니까?</th></tr>';
				table +='<tr><td >홈티켓 구입 후에는 기존 일반승차권과 동일하게 반환이 가능하며, 출발시간 이전 전까지는 인터넷으로도 반환이 가능합니다.</td></tr>';
				table +='<tr><th>Q. 여행인원이 10명이 넘는데 단체승차권을 홈티켓으로 발권하여 이용할 수 있습니까?</th></tr>';
				table +='<tr><td >단체승차권의 경우 홈티켓 기능이 지원되지 않습니다. 1인단위 및 동반석의 경우 4인단위로 이용	가능합니다.</td></tr>';
				table +='</tbody></table></li></ul></li>';
				table +='<li><a href="#"><span> 반환 및 예매취소 방법 </span></a><ul style="display: none"><li>';
				table +='<table>';
				table +='<caption>반환 및 예매취소</caption>	<colgroup><col width="100%" /></colgroup><tbody>';
				table +='<tr><th>Q. 모든 철도 승차권을 인터넷으로 반환 할 수 있습니까?</th></tr>';
				table +='<tr><td>인터넷을 통하여 발급된 홈티켓에 한하여 반환이 가능합니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓의 인터넷 반환은 언제까지 가능합니까?</th></tr>';
				table +='<tr><td>홈티켓은 발권과 동일하게 열차출발 시간 이전까지는 인터넷으로 가능하며, 역 또는 승차권판매대리점에서는 도착역 도착 전까지 반환이 가능합니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓을 인터넷으로 반환 후 발권된 승차권을 역에 제출하여야 하나요?</th></tr>';
				table +='<tr><td>홈티켓을 인터넷으로 반환하시면 역을 방문하여 승차권을 제출하지 않아도 되며, 반환된 홈티켓의	영수금액은 결제수단에 따라 신용, 계좌이체 또는 포인트로 반환 되며 수수료 발생시 추가 정산하고 있습니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓을 인터넷으로 반환하는 경우에도 반환 수수료가 있나요?</th></tr>';
				table +='<tr><td>홈티켓도 일반승차권과 동일한 기준으로 반환 수수료가 적용됩니다.</td></tr>';
				table +='<tr><th>Q. 열차출발 후 홈티켓 반환이 가능합니까?</th></tr>';
				table +='<tr><td>인터넷을 통한 홈티켓 반환은 열차출발 시간 전까지이므로 이후부터는 인터넷 반환이 불가능합니다. <br/>가까운 역 또는 승차권판매대리점을 방문하여 반환하여 주시기 바랍니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓을 모두 4장 구입하였으나 3장만 필요할 경우, 함께 여행 예정이던 1명의 승차권을	반환처리 할 수 있습니까?</th></tr>';
				table +='<tr><td>열차출발 시간 전까지는 인터넷을 통하여 반환이 가능하고 역 및 승차권판매대리점에서는 도착역 도착 전까지 가능합니다.</td></tr>';
				table +='</tbody></table></li></ul></li><li>';
				table +='<a href="#"><span>기타 문의 사항</span></a><ul style="display: none"><li>';
				table +='<table>';
				table +='<caption> 기타 문의 사항 </caption><tbody><tr><th>Q. 홈티켓으로 이용시 열차가 지연되었습니다. 지연료를 받을 수 있나요?</th></tr>';
				table +='<tr><td>홈티켓도 일반승차권과 동일하게 지연할인증으로 사용이 가능합니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓으로 발권된 승차권의 영수증을 발급 받을 수 있나요?</th></tr>';
				table +='<tr><td>인터넷을 통하여 홈티켓 발권내역을 확인 후 영수증을 인쇄할 수 있습니다.</td></tr>';
				table +='<tr><th>Q. 동일한 좌석의 승차권이 2장 이상 발권 되었어요?</th></tr>';
				table +='<tr><td>발매내역을 조회하여 유효한 승차권을 확인하시기 바랍니다. 유효하지 않은 승차권을 소지하거나 승차자로 등록된 본인이외의 사람이 사용하는 경우에는 철도사업법 제10조 및 여객운송약관 제 17조에 의하여 10배 이내의 부가운임을 받습니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓으로 이용중 도중역에서 하차하였습니다. 어떻게 해야 하나요?</th></tr>';
				table +='<tr><td>일반승차권과 동일하게 처리됩니다. 하차 후 홈티켓 유효기간 내에 하차하신 역에 승차권을 제출하면 이용하지 못한 구간에 대한 승차권금액에서 수수료를 제외하고 환불받을 수 있습니다.</td></tr>';
				table +='<tr><td>스마트폰(코레일톡)에서 조회가 되지 않습니다.<br /> 홈페이지>승차권>발권/취소/변경(반환)에서 확인하시기 바랍니다.</td></tr>';
				table +='<tr><th>Q. 홈티켓은 스마트폰에서 조회가 되나요?</th></tr>';
				table +='</tbody></table></li></ul></li></ul></div>';
			$('#main').empty();
			$('#main').html(table);
			jQuery(function($){
				// Lined Tab Navigation
				var $tab_line = $('.tab.line');
				$tab_line.removeClass('jx').find('ul ul').hide();
				$tab_line.find('li li.active').parents('li').addClass('active');
				$tab_line.find('li.active>ul').show();
				function lineTabMenuToggle(event){
					var $this = $(this);
					$this.next('ul').show().parent('li').addClass('active').siblings('li').removeClass('active').find('>ul').hide();
					if($this.attr('href') === '#'){
						return false;
					}
				}
				function lineTabSubMenuActive(){
					$(this).parent('li').addClass('active').siblings('li').removeClass('active');
					if($this.attr('href') === '#'){
						return false;
					}
				}; 
				$tab_line.find('>ul>li>a').click(lineTabMenuToggle).focus(lineTabMenuToggle);
				$tab_line.find('li li>a').click(lineTabSubMenuActive).focus(lineTabSubMenuActive);
		});			
	});
	review = {}
	review.list = function() {
		 $.ajax({
				url: '${root}/board/list/2/1',
				Type: 'GET',
				dataType: 'JSON',		
				contentType: 'application/json',
				success: function(data) {
					review.listForm(data);
				},
				error : function(xhr, status, msg) {
					alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
				}
		});
	}
	review.listOn = function(pageNo) {
		 $.ajax({
				url: '${root}/board/list/2/'+pageNo,
				Type: 'GET',
				dataType: 'JSON',		
				contentType: 'application/json',
				success: function(data) {
					review.listForm(data);
				},
				error : function(xhr, status, msg) {
					alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
				}
		});
	}
	review.listForm = function(data) {
			$('#main').empty();
			var table = '<table id="boTable">';
			table += '<td style = "text-align: end">';
			table += '<select name="searchKey" id="searchKey" style = "width: 100px; margin: 0 ;">';
			table += '<option  selected="selected">-----선택----</option>';
			table += '<option value="all"> 전체보기 </option>';
			table += '<option value="title"> 제 목 </option>';
			table += '<option value="content"> 내 용 </option>';
			table += '<option value="id"> 아 이 디 </option>';
			table += '</select>';
			table += '<input type="text" name="searchVal" id="searchVal" style = "width: 300px; margin: 0 ;" placeholder="검 색"/>';
			table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
			table += '</table>';
			table += '<table id="boTable"><tr><th width="10px">번 호</th><th width="150px">제 목</th><th width="40px">작 성 자</th><th width="50px">등 록 일</th><th width="25px">조 회 수</th></tr>';		
			$.each(data.list,function(){	
			table +='<tr><td>'+this.brdNo+'</td>';
			table +='<td><a href="#" onclick="return review.detail('+this.brdNo+','+(this.readCnt+1)+')">'+this.title+'</a></td><td>'+this.id+'</td>';
			table +='<td>'+this.boardDate+'</td><td>'+this.readCnt+'</td></tr>';		
			});
			table += '<tr><td colspan="5">';
			table += '<div style="width:600px;margin:0 auto">';
			table += '<nav><ul  class="pagination">';
			/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
			
			/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
			table += '</ul></nav></div></td></tr>';
			table +='<tr><td><input id="btnWrite" type="button" value="글쓰기"/></td></tr>';			
			table +='</table>';
			$('#main').html(table);
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
		}
	review.searchForm = function(data) {
		$('#main').empty();
		var table = '<table id="boTable">';
		table += '<td style = "text-align: end">';
		table += '<select name="searchKey" id="searchKey" style = "width: 100px; margin: 0 ;">';
		table += '<option  selected="selected">-----선택----</option>';
		table += '<option value="all"> 전체보기 </option>';
		table += '<option value="title"> 제 목 </option>';
		table += '<option value="content"> 내 용 </option>';
		table += '<option value="id"> 아 이 디 </option>';
		table += '</select>';
		table += '<input type="text" name="searchVal" id="searchVal" style = "width: 300px; margin: 0 ;" placeholder="검 색"/>';
		table += '<input type="button" style = "width: 50px; margin: 0 ;"  id="searchBtn" value=" 검 색 "/></td>';
		table += '</table>';
		table += '<table id="boTable"><tr><th width="10px">번 호</th><th width="150px">제 목</th><th width="40px">작 성 자</th><th width="50px">등 록 일</th><th width="25px">조 회 수</th></tr>';		
		$.each(data.list,function(){
		table +='<tr><td>'+this.brdNo+'</td>';
		table +='<td><a href="#" onclick="return review.detail('+this.brdNo+','+(this.readCnt+1)+')">'+this.title+'</a></td><td>'+this.id+'</td>';
		table +='<td>'+this.boardDate+'</td><td>'+this.readCnt+'</td></tr>';		
		});
		table += '<tr><td colspan="5">';
		table += '<div style="width:600px;margin:0 auto">';
		table += '<nav><ul  class="pagination">';
		/* table += '<li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>'; */
		
		/* table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'; */
		table += '</ul></nav></div></td></tr>';
		table +='<tr><td><input id="btnWrite" type="button" value="글쓰기"/></td></tr>';			
		table +='</table>';
		$('#main').html(table);
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
			$('#main').empty();	
			$('#main').append('<form action="${root}/board/write/${member.id}" id="frmWrite">');
			var table = '<input type="hidden" name="theme" value="2"/>';
				table += '<input type="hidden" name="pageNo" value="1"/>';
				table += '<table class="tab" style="width: 700px; margin: 0 auto;">';
				table += '<tr>';
				table += '<td style="width: 100%; height: 50px">사용자 아이디 :';
				table += '<input type="text" readonly style="width: 20%; height: 20px" value="${member.id}">';
				table += '</td>';
				table += '<tr>';
				table += '<tr>';
				table += '<td style="width: 100%; height: 50px" COLSPAN="2">';
				table += '<input type="text" required autofocus name="title" style="width: 90%" placeholder="제 목"/>';
				table += '</td>';
				table += '<tr>';
				table += '<td style="width: 100%;" COLSPAN="2">';
				table += '<input type="hidden" name="path" style="width: 90%" placeholder="첨부파일"/>';
				table += '</td>';
				table += '</tr>';
				table += '<tr>';
				table += '<td COLSPAN="2">';
				table += '<textarea rows="10" required autofocus cols="100" name="content"></textarea>';
				table += '</td>';
				table += '</tr>';
				table += '<tr>';
				table += '<td>';
				table += '<div style="width: 300px; margin: 0 auto;">';
				table += '<input id="btnConfirm" type="submit" style="width: 100px;" value=" 전 송 "/>';	
				table += '<input id="btnCancl" type="button" style="width: 100px;" value=" 취 소 "/>';
				table += '</div>';	
				table += '</td>';
				table += '</tr>';
				table += '</table>';		
			$('#frmWrite').html(table);
			review.writeConfirm();
			review.cancl();
		})		
	}
	review.writeConfirm = function() {
		$('#btnConfirm').click(function() {
			$('#frmWrite').submit(function() {
				event.preventDefault();
				var $form = $('#frmWrite');
				var $data = $form.serialize();
				var $url = $form.attr('action');
				$.ajax({
					url : $url,
					type : 'GET',
					data : $data,
					dataType : "json",
					contentType : 'application/json',
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
		});
	}
	review.cancl = function(data) {		
		$('#btnCancl').click(function() {			
			review.list(data);})
	}
	review.detail = function(brdNo,readCnt) {
		$.ajax({
			url : '${root}/board/detail/2/'+brdNo+'/'+readCnt,
			type : 'GET',
			dataType : 'JSON',
			contentType : 'application/json',
			success : function(data){
				review.detailForm(data);
			},
			error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
			}
		});
	}
	review.detailForm = function(data) {
		$('#main').empty();
		var idVal = '<input type="hidden" id="id" value="${member.id}"/>';
		$('#main').html(idVal);	
		var id = $('#id').val();
		var table = '<input type="hidden" name="theme" value="2"/>';		
		table += '<table id="boTable" style="width: 700px; margin: 0 auto;">';
		table += '<tr><td>글 번호</td><td>'+data.brdNo+'</td><td>작성자</td><td>'+data.id+'</td>';
		table += '<td>조회수</td><td>'+data.readCnt+'</td><td>작성일</td><td>'+data.boardDate+'</td></tr>';
		table += '<tr><td style=" height: 50px"COLSPAN="8">';
		table += '<input type="text" name="title" style="width: 90%" readonly value="'+data.title+'"/></td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td COLSPAN="8">';
		table += '<textarea rows="10" cols="100" readonly name="content">'+data.content+'</textarea>'
		table += '</td>';
		table += '</tr>';	
		table += '<div style="margin: 0 auto ;">';
		$.each(data.list,function(){
		table += '<tr><td COLSPAN="7" style = "text-align: start">'+this.id+' : ';
		table += '<input type="hidden" id="dtRepleNo" value="'+this.repleNo+'"/>';
		table += '<input type="text" style="width: 60%" readonly  value="'+this.repleContent+'"/>';
		table += ''+this.repleDate+'</td>';	
		if(id == this.id){
		table += '<td><a href="#" onclick="return review.repleDelete('+data.brdNo+','+this.repleNo+')">삭제</a></td>';
		}
		table += '</tr>';
		});
		table += '<tr><td COLSPAN="8" >';
		table += '<form action="${root}/board/repleInsert" id="frmReple">';
		table += '<input type="hidden" name="theme" value="2"/>';
		table += '<input type="hidden" name = "brdNo" value="'+data.brdNo+'" />';
		table += '<input type="text" readonly style="width: 20%; height: 27px" name="id" value="${member.id}"/>';		
		table += '<input type="text" name = "repleContent"  style="width: 60%" />';
		table += '<input type="submit"  id = "repleInBtn" value=" 등 록 " />';
		table += '</form>';
		table +='</td></tr>';
		table += '<tr>';
		table += '<td>';
		if(id == data.id){
		table += '<td><input id="btnUpdate" type="button" style="width: 50px;" value="수정"/>';
		}
		table += '<input id="btnCancl" type="button" style="width: 50px;" value="취 소"/></td>';		
		table += '</div>';
		table += '</tr>';
		table += '</table>';		
		$('#main').html(table);	
		review.updateForm(data);
		review.repleInsert();
		review.cancl(data);
	}
	review.repleDelete = function(brdNo,repleNo) {
		var allData = {"brdNo" : brdNo, "repleNo" : repleNo};
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
	review.repleInsert  = function() {
		$('#repleInBtn').click(function() {
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
		});			
	}
	review.updateForm = function(data) {
		$('#btnUpdate').click(function() {
			$('#main').empty();
			$('#main').append('<form action="${root}/board/update/2" name = "reviewUpdate" id = "reviewUpdate">');			
		var table = '<input type="hidden" name="brdNo" value="'+data.brdNo+'"/>';	
			table += '<table id="boTable" style="width: 700px; margin: 0 auto;">';		
			table += '<tr><td>작성자</td><td>'+data.id+'</td>';
			table += '<td>조회수</td><td>'+data.readCnt+'</td><td>작성일</td><td>'+data.boardDate+'</td></tr>';
			table += '<tr><td style=" height: 50px"COLSPAN="8">';
			table += '<input type="text" required autofocus name="title" style="width: 90%" value="'+data.title+'"/></td>';
			table += '</tr>';
			table += '<tr><td COLSPAN="8">';
			table += '<input type="hidden" name="path" style="width: 90%" value="'+data.path+'"/></td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td COLSPAN="8">';
			table += '<textarea rows="10" required autofocus cols="100" name="content">'+data.content+'</textarea>'
			table += '</td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td>';
			table += '<div style="margin: 0 auto;"></td>';
			table += '<td><input id="btnReview" type="submit" value="수정확인">';			
			table += '<input id="btnRemove" type="button" onclick="return review.remove('+data.brdNo+')" style="width: 50px;" value="삭제"/>';
			table += '<input id="btnCancl" type="button" style="width: 50px;" value="취 소"/></td>';
			table += '</div>';
			table += '</tr>';
			table += '</table>';
			$('#reviewUpdate').html(table);
			review.updateConfirm();
			review.cancl();
		});		
	}
	
	review.updateConfirm = function() {
		$('#btnReview').click(function() {
			if(!confirm('수정 하시겠습니까?')){
				return false;
			}else{
			$('#reviewUpdate').submit(function() {
					event.preventDefault();
					var $form = $('#reviewUpdate');	
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
	
	review.remove = function(brdNo) {
		if(!confirm('삭제 하시겠습니까?')){
			return false;
		}else{
				$.ajax({
					url : '${root}/board/delete/2/'+brdNo,
					type : 'GET',
					dataType : "json",
					contentType : 'application/json',
					success :function(data){
						review.list(data);
					},
					error :function(xhr,status,msg){
						alert('수정 에러 발생 상태'+ status +',메세지' + msg);
					}
				});
		}
	}
	
	
	
	
</script>