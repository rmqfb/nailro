<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<div id="erpbox">

</div>
<script type="text/javascript">
/*예매확인*/
$(function() {
	infoMain.table();
});
infoMain = {}
infoMain.table = function(){
	var url = "${root}/erp/reserveInfo";
	$.ajax({
		url : url,
		type : "GET",
		dataType: "JSON",
		contentType : "application/json",
		success : function(data) {
				infoMain.cancelForm(data);
		},
		error : function() {}
	});
};	
/* 예매 확인/취소 */ 

	infoMain.cancelForm= function(data) {
		$('#erpbox').empty();
		$('#erpbox').append("<div class='datagrid'><table>"
		+"<thead><tr><th>예매번호</th><th>열차번호</th><th>출발일</th><th>출발역</th><th>출발시간</th><th>도착역</th>"
			+"<th>도착시간</th><th>좌석번호</th><th>운임요금</th><th>예매반환</th></tr></thead>"
			+"<tbody id='tbd'></tbody>");
		var table;
		$.each(data,function(index) {
			if (index%2==0) {
				table+="<tr><td>"+this.reserveNo+"</td>";
				table+="<td>"+this.trainNo+"</td>";
				table+="<td>"+this.startDate+"</td>";
				table+="<td>"+this.startStation+"</td>";
				table+="<td>"+this.startTime+"</td>";
				table+="<td>"+this.endStation+"</td>";
				table+="<td>"+this.endTime+"</td>";
				table+="<td>"+this.seatNum+"</td>";
				table+="<td>"+this.pay+"</td><td>";
				table +='<a href="#" onclick="return infoMain.cancel(\''+this.reserveNo+'\',\''+this.trainNo+'\')" >';
		    	table +='<img src="${context}/image/erp/cancel.jpg"  alt="" width="60px"/></a></td>';
				table+="</tr>"
			} else {
				table+="<tr class='alt'><td>"+this.reserveNo+"</td>";
				table+="<td>"+this.trainNo+"</td>";
				table+="<td>"+this.startDate+"</td>";
				table+="<td>"+this.startStation+"</td>";
				table+="<td>"+this.startTime+"</td>";
				table+="<td>"+this.endStation+"</td>";
				table+="<td>"+this.endTime+"</td>";
				table+="<td>"+this.seatNum+"</td>";
				table+="<td>"+this.pay+"</td><td>";
				table +='<a href="#" onclick="return infoMain.cancel(\''+this.reserveNo+'\',\''+this.trainNo+'\')" >';
		    	table +='<img src="${context}/image/erp/cancel.jpg"  alt="" width="60px"/></a></td>';
				table+="</tr>"
			}
		});
			$('#tbd').html(table);
	}
infoMain.cancel=function(reserveNo,trainNo){
	$.ajax({
		url : '${root}/erp/reserveCancel/'+reserveNo+'/'+trainNo,
		type : 'GET',
		dataType : 'JSON',
		contentType : 'application/json',
		success : function(data){
			if (reserveNo==null) {
				alert('예매반환실패');
			} else {
				alert('예매반환성공');
			}
			
			infoMain.cancelForm(data);
		},
		error : function(xhr, status, msg) {
			alert('예매반환실패');
		}
	});
}

</script>
