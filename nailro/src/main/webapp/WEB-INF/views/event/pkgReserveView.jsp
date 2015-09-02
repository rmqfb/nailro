<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="wrap">

	<div id=ReserveView></div>
	
<script type="text/javascript">
ReserveView={}
$(function() {
		var userId = 'm3';
		$.getJSON('${root}/event/pkgReserveCount/'+userId,function(data){
			var count = data;
			if (count == 0) {
				ReserveView.nullForm();
			} else {
				ReserveView.ReserveView();
			}
		});
});
ReserveView.ReserveView = function() {
	var userId = 'm3';
	
	$.getJSON('${root}/event/pkgCheck/m3',function(data){
			    var table ='<h2 class="txt-c">나의 패키지 예약 상품</h2><div align="center">';
			$.each(data,function() {
					table +='<table class="tableTag txt-c" border="1px solid black" align="center">';
					table +='<tr><th class ="txt-c">이미지</th><td><img src="${context}/image/event/'+this.path+'" width="150px" height="100px">';
					table +='<tr><th class ="txt-c">패키지이름</th><td>'+this.pkgName+'</td></tr>';
					table +='<tr><th class ="txt-c">패키지 출발일</th><td>'+this.startDate+'</td></tr>';
					table +='<tr><th class ="txt-c">패키지  금액</th><td>'+this.pkgPrice+' 원</td></tr>';
					table +='<tr><th class ="txt-c">패키지 문의전화번호</th><td>'+this.pkgTel+'</td></tr>';
					table +='<tr><td colspan="2"><input type ="button" class="pkgCheckBtn" id='+this.pkgKeepCode+' value="예매취소"></tr>';
					table +='<input type="hidden" id="pkgKeepCode" value='+this.pkgKeepCode+'></table><div><p>';
			});
			
			$('#ReserveView').html(table);
			
			$('.pkgCheckBtn').click(function() {
				 var pkgKeepCode = $(this).attr('id'); 
				/* var pkgKeepCode = $("#pkgKeepCode").val(); */
				alert(pkgKeepCode);
				 var id = 'm3';
				 var msg = confirm("예약하신 상품을 삭제하시겠습니까?");
				 	if (msg) {
						 $.getJSON('${root}/event/pkgCancel/'+pkgKeepCode,function(data){
							 location.href = "${root}/event/pkgReserveView";
					 	}); 
					}
			});
	});
	
}

ReserveView.nullForm = function() {
	var table = '<div class="txt-c"><font size="15" color="#A6A6A6"> 예약하신 상품이 없습니다. </font></div>';
	$('#ReserveView').empty();
	$('#ReserveView').html(table);
}
</script>

</div> <!--end wrap -->