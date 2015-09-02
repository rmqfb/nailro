<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="${context}/css/common.css" />
<div id="seatbox">
	<input type="hidden" id="trainCode" value="${trainCode}" />
	<input type="hidden" id="index" value="${index}"/>
</div>
<script type="text/javascript">
	$(function(){
			var trainCode = $('#trainCode').val();
			var index = $('#index').val();
			$.ajax({
				url : '${root}/erp/seatSel/'+trainCode+'/'+index,
				type : 'GET',
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					
					erp.checkbox(data);
					
				},
				error : function() {
				}
			}); 
	});
	erp = {};
	
	erp.checkbox = function(data) {
		
		
		 $('#seatbox').empty();
		 var table ='<table id="seat-table">';
		 table+='<tr><td id="seat-Select" colspan="8">창측</td></tr>'
		 var num = data.index;
		
		 var indexNum =0;
		 $.each(data.list,function(){
			
			 indexNum+=1;
			var seatNum = this.seatNum;
			if (indexNum<=32) {
			
			if (((indexNum-1)%8)==0) 	{table+='</tr>';} 
			
			if ((indexNum-1)%8==0)	{table+='<tr>';	}
			
			for (var i = 1; i < 33; i++) {
				var T = seatNum==i ? true : false;	
				if (T) {
					break;
				}
			}
			for (indexNum; indexNum < seatNum; indexNum++) {
				if (((indexNum-1)%8)==0) {
					table+='</tr>';
				}
				if ((indexNum-1)%8==0) {
					table+='<tr>';
				}
				if (indexNum%17==0) {table+='<tr><td id="seat-Select" colspan="8">복도측</td></tr>';}
				if (indexNum<10) {
					table +='<td><input type="radio" id="radio'+indexNum+'" value="0'+indexNum+'" name="seatNum"><label for="radio'+indexNum+'">&nbsp&nbsp'+indexNum+'&nbsp&nbsp</label></td>'; 
				} else {
					table +='<td><input type="radio" id="radio'+indexNum+'" value="'+indexNum+'" name="seatNum"><label for="radio'+indexNum+'">&nbsp'+indexNum+'&nbsp</label></td>'; 
				}
				
				
			}
			if (seatNum==null) {
				for (indexNum; indexNum < 33; indexNum++) {
					if (((indexNum-1)%8)==0) {table+='</tr>';
					}
					if ((indexNum-1)%8==0) {
						table+='<tr>';
					}
					if (indexNum%17==0) {table+='<tr><td id="seat-Select" colspan="8">복도측</td></tr>';}
					if (indexNum<10) {
						table +='<td><input type="radio" id="radio'+indexNum+'" value="0'+indexNum+'" name="seatNum"><label for="radio'+indexNum+'">&nbsp&nbsp'+indexNum+'&nbsp&nbsp</label></td>'; 
					} else {
						table +='<td><input type="radio" id="radio'+indexNum+'" value="'+indexNum+'" name="seatNum"><label for="radio'+indexNum+'">&nbsp'+indexNum+'&nbsp</label></td>'; 
					}					
				}
			}
			
		    if (T) {
		    	if (((indexNum-1)%8)==0) {
					table+='</tr>';
				}
				if ((indexNum-1)%8==0) {
					table+='<tr>';
				}
				if (indexNum%17==0) {table+='<tr><td id="seat-Select" colspan="8">복도측</td></tr>';}
				if (indexNum<10) {
			    	table +='<td><input type="radio" disabled="disabled" id="radio'+indexNum+'" value="0'+indexNum+'" name="seatNum"><label for="radio'+indexNum+'">&nbsp&nbsp'+indexNum+'&nbsp&nbsp</label></td>';
				} else {
			    	table +='<td><input type="radio" disabled="disabled" id="radio'+indexNum+'" value="'+indexNum+'" name="seatNum"><label for="radio'+indexNum+'">&nbsp'+indexNum+'&nbsp</label></td>';
				}
		    }
		    	
			}
			
			
	     });
		 table+='<tr><td id="seat-Select" colspan="8">창측</td></tr>'
		 table+='</table>';
		 table+='</br><div id="seat"><a href="#" onclick="return erp.value(\''+num+'\')">좌석선택</a></div>';
		 $('#seatbox').html(table);
		$("#seatbox").buttonset();
	}
erp.value = function(data) {
	 var num = data;
		var ckd;
		
		$('input[name="seatNum"]:checked').each(function() {
			if ($(this).val()!="null") {
				ckd = ($(this).val());
			}
		});
		 window.opener.document.getElementById("seatNum"+num).value=ckd; 
		
		self.close();
}

</script>







