<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<!-- 총수익 페이지 -->
<div id=grossprofit-table></div>
<div id="pie" class="container"></div>
<script src="${context}/js/bookStat/bookStat.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url : "${root}/erp/grossprofitAdmin",
		type : "get",
		dataType : "json",
		contentType : "application/json",
		success : function(data) {
			grossprofit.ontable(data);
		},
        error : function() {
			
		}
	});
});
$(function(){
	$('#sel').click(function() {
		var carselect = $("#carselect option:selected").val();
		alert(carselect);
		console.log();
		var localselect = $("#localselect option:selected").val();
		location.href= '${root}/erp/grossprofitAdmin/'+carselect; 
	});
});
grossprofit={}
grossprofit.ontable=function(data){
	$('#grossprofit-table').append("<table id='grossprofit'><tr><td id='td'>차종</td><td id='td'>"+
	"<select name='carselect'id='carselect'><option value='all'selected='selected'>전체</option>"+
	"<option value='mugungwha'>무궁화</option><option value='saemaeul'>"+
	"새마을</option><option value='KTX'>KTX</option></select></td><td id='td'>"+
	"역별</td><td id='td'><select name='localselect'id='localselect'><option value=''>"+
	"전체</option><option value='seoul'>서울</option><option value='youngsan'>"+
	"용산</option><option value='yeongdeungpo'>영등포</option></select></td></tr>");
	
	 var table ='<tr id="tr"><td id="grossprofit-td"  style="width : 200px;">일수익</td><td id="grossprofit-td" style="width : 150px;">'+data.daytotal+'</td>';
		table +='<td id="grossprofit-td" style="width : 300px;">일이용객수</td><td id="grossprofit-td" style="width : 150px;">'+data.dayuseCnt+'</td></tr>';
		table +='<tr id="tr" style="height: 100px;"><td id="grossprofit-td">월수익</td><td id="grossprofit-td">'+ data.monthtotal+'</td>';
		table +='<td id="grossprofit-td">월이용객수</td><td id="grossprofit-td">'+data.monthuseCnt +'</td></tr>';
		table +='<tr id="tr" style="height: 100px;"><td id="grossprofit-td">연수익</td><td id="grossprofit-td">'+data.yeartotal +'</td>';
		table +='<td id="grossprofit-td">연이용객수</td><td id="grossprofit-td">'+data.yearuseCnt +'</td></tr>';
		table +='</table>';
		
		$('#grossprofit-table').html(table);
}
</script>

