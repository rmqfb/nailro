<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="runTrain-main" style="height: 800px;" align="center">
<table border="1">
<tr>
	<td  style="width: 200px; height: 50px; font-size: 30px;" >운행열차번호</td>
	<td><input type="text" id="runTrainCode" name="runTrainCode" value=""/></td>
</tr>
<tr>
	<td  style="width: 200px; height: 50px; font-size: 30px;" >노선시간번호</td>
	<td>
	<select name="runTimeCode-select" id="runTimeCode-select">
	<option value="10:00">10:00</option>
	<option value="11:00">11:00</option>
	<option value="12:00">12:00</option>
	<option value="13:00">13:00</option>
	</select></td>
</tr>
<tr>
	<td  style="width: 200px; height: 50px; font-size: 30px;" >노선번호</td>
	<td>
	<select name="railLineCode-select" id="railLineCode-select">
	</select></td>
</tr>
<tr>
	<td  style="width: 200px; height: 50px; font-size: 30px;" >열차번호</td>
	<td><select name="trainCode-select" id="trainCode-select">
	
	</select></td>
</tr>
<tr>
	<td  style="width: 200px; height: 50px; font-size: 30px;" >운행날짜</td>
	<td><input type="date" id="runTrainDate" name="runTrainDate" value=""/></td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="button" id="trainbtn-insert" value="생성"/></td>
</tr>
</table>
<div id="runTrain-list">
</div>
</div>

<script type="text/javascript">
$(function() {
	runtrain.insertForm();
	runtrain.list();
	runtrain.trainbtn_insert();
});
runtrain={}
runtrain.trainbtn_insert= function() {
	$('#trainbtn-insert').click(function(){
		  var runTrainCode = $('#runTrainCode').val();
		  var runTimeCode = $('#runTimeCode-select option:selected').val();
		  var railLineCode = $('#railLineCode-select option:selected').val();
		  var trainCode = $('#trainCode-select option:selected').val();
		  var runTrainDate = $('#runTrainDate').val();
		  $.getJSON('${root}/erp/runTrainWirte/'+runTrainCode+'/'+ runTimeCode+'/'+railLineCode +'/'+trainCode +'/'+runTrainDate,
				  function(){
			  runtrain.insertForm();
			  runtrain.list();
		  });
		});
	
}
/*insert 폼*/
runtrain.insertForm = function() {
	$.getJSON("${root}/erp/runTrainSelectList",function(data){
		var table = "";
		$.each(data.railLine,function(){
			table +='<option value='+this.lineCode+'>'+this.lineCode+','+this.lineName+'</option>';
		});
		$('#railLineCode-select').html(table);
		table = "";
		$.each(data.train,function(){
			table +='<option value='+this.trainCode+'>'+this.trainCode+','+this.trainName+'</option>';
		});
		$('#trainCode-select').html(table);
	});
}
/*리스트 폼*/
runtrain.list = function() {
	$.getJSON("${root}/erp/admintrainList",function(data){	
		runtrain.listForm(data); 
	});
}
runtrain.listForm = function(data) {
	$('#runTrain-list').empty();
	var table ='<table border="1"><tr><td width="100px;">운행열차번호</td>';
	table +='<td width="100px;">노선시간번호</td>';
	table +='<td width="100px;">노선번호</td>';
	table +='<td width="100px;">열차번호</td><td width="100px;">운행날짜</td><td width="100px;">삭제</td></tr>';
	$.each(data,function(){
		table +='<tr><td>'+ this.runTrainCode+'</td><td>'+ this.runTimeCode+'</td><td>'+ this.railLineCode+'</td>';
		table +='<td>'+ this.trainCode+'</td><td>'+ this.runTrainDate+'</td><td><a href="#" id="removeBtn" onclick="return runtrain.remove('+'/'+this.runTrainCode+'/'+')">삭제</a></td></tr>';	
	});
	table +='</table>';
	$('#runTrain-list').html(table);
	$('#removeBtn').click(function() {
		runtrain.remove();	
	});
	
}

/*운행열차 삭제*/
runtrain.remove = function(runTrainCode) {
	$.getJSON('${root}/erp/runtrainRemove/'+runTrainCode,function(data){
		runtrain.list();
	});
}
</script>