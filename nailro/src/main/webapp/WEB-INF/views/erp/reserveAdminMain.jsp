<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="reserveAdmin"></div>
<script src="${context}/js/erp/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	var pageNo = 1;
	reserveAdmin.reserveTable(pageNo);
});
reserveAdmin = {}
/*예매확인 클릭*/
reserveAdmin.reserveTable = function(pageNo){
	var url = "${root}/erp/rsrvAdminInfo/"+pageNo;
	$.ajax({
		url : url,
		type : "GET",
		dataType: "JSON",
		contentType : "application/json",
		success : function(data) {
			reserveAdmin.info(data);
		},
		error : function() {}
	});
}
reserveAdmin.info = function(data) {
	
	$('#reserveAdmin').empty();
	$('#reserveAdmin').append("<div class='datagrid'><table>"
			+"<thead><tr><th>예매번호</th><th>열차번호</th><th>출발일</th><th>출발역</th><th>출발시간</th><th>도착역</th>"
			+"<th>도착시간</th><th>좌석번호</th><th>운임요금</th><th>예매반환</th></tr></thead>"
			+"<tfoot><tr><td colspan='10' ><div id='paging'><ul class='page'>"
			+"</ul></div></tr></tfoot>"
			+"<tbody id='tbd'></tbody>");
		var table;
		$.each(data.listDate,function(index) {
			if (index%2==0) {
				if (this.reserveNo==null) {
					table+="<tr><td class='rsrvAdmin'>&nbsp</td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="<td class='rsrvAdmin'></td>";
					table+="</tr>"
				}else{
				table+="<tr><td class='rsrvAdmin'>"+this.reserveNo+"</td>";
				table+="<td class='rsrvAdmin'>"+this.trainNo+"</td>";
				table+="<td class='rsrvAdmin'>"+this.startDate+"</td>";
				table+="<td class='rsrvAdmin'>"+this.startStation+"</td>";
				table+="<td class='rsrvAdmin'>"+this.startTime+"</td>";
				table+="<td class='rsrvAdmin'>"+this.endStation+"</td>";
				table+="<td class='rsrvAdmin'>"+this.endTime+"</td>";
				table+="<td class='rsrvAdmin'>"+this.seatNum+"</td>";
				table+="<td class='rsrvAdmin'>"+this.pay+"</td><td class='rsrvAdmin'>";
				table +='<a href="#" onclick="return reserveAdmin.cancel(\''+this.reserveNo+'\',\''+data.pageNo+'\',\''+this.trainNo+'\')" >';
		    	table +='<img src="${context}/image/erp/cancel.jpg"  alt="" width="50px"/></a></td>';
				table+="</tr>"
				}
			} else {
				if (this.reserveNo==null) {
				table+="<tr class='alt'><td class='rsrvAdmin'>&nbsp</td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="<td class='rsrvAdmin'></td>";
				table+="</tr>"
					}else{
				table+="<tr class='alt'><td class='rsrvAdmin'>"+this.reserveNo+"</td>";
				table+="<td class='rsrvAdmin'>"+this.trainNo+"</td>";
				table+="<td class='rsrvAdmin'>"+this.startDate+"</td>";
				table+="<td class='rsrvAdmin'>"+this.startStation+"</td>";
				table+="<td class='rsrvAdmin'>"+this.startTime+"</td>";
				table+="<td class='rsrvAdmin'>"+this.endStation+"</td>";
				table+="<td class='rsrvAdmin'>"+this.endTime+"</td>";
				table+="<td class='rsrvAdmin'>"+this.seatNum+"</td>";
				table+="<td class='rsrvAdmin'>"+this.pay+"</td><td class='rsrvAdmin'>";
				table +='<a href="#" onclick="return reserveAdmin.cancel(\''+this.reserveNo+'\',\''+data.pageNo+'\',\''+this.trainNo+'\')" >';
		    	table +='<img src="${context}/image/erp/cancel.jpg"  alt="" width="50px"/></a></td>';
				table+="</tr>"
				}
			}
		});
			$('#tbd').html(table);
			var size = data.size;
			var start = Math.floor((data.pageNo-1) / 5);
			var startPage = start*5+1;
			var nextPage = Math.floor((data.pageNo-1) / 5) ;
			var previousPage = Math.floor((data.pageNo-1) / 5);
			var endPage = Math.ceil(size/10);
			
			if (previousPage!=0) {
				$('.page').append("<li><a href='#' onclick='return reserveAdmin.previous("+previousPage+")'><span>◀◀</span></a></li>");
			}
			
			for (var i = startPage; i <=endPage ; i++) {
				if (i <= (nextPage+1)*5) {
					$('.page').append("<li><a href='#' onclick='return reserveAdmin.reserveTable("+i+")'><span>"+i+"</span></a></li>");

				}
			}
			
			if ((nextPage+1)*50<size) {
				$('.page').append("<li><a href='#' onclick='return reserveAdmin.next("+nextPage+","+size+")'><span>▶▶</span></a></li>");
			}
	}
reserveAdmin.next = function(nextPage, size) {
	pageNo = ((nextPage+1)*5)+1;
	reserveAdmin.reserveTable(pageNo);
}
reserveAdmin.previous = function(previousPage) {
	pageNo = ((previousPage-1)*5)+1;	
	reserveAdmin.reserveTable(pageNo);
}
reserveAdmin.cancel=function(reserveNo,pageNo,trainNo){
	
	$.ajax({
		url : '${root}/erp/reserveAdminCancel/'+reserveNo+'/'+pageNo+'/'+trainNo,
		type : 'GET',
		dataType : 'JSON',
		contentType : 'application/json',
		success : function(data){
			if (data!=null) {
				alert('예매반환성공');
				reserveAdmin.info(data);
			}
			
		},
		error : function(xhr, status, msg) {
			alert('예매반환실패');
		}
	}); 
}
</script>











