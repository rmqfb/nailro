<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="${context}/js/erp/jquery-ui.js"></script>
	
	<div id="erpbox">

	</div>

<!--달력  -->
<script type="text/javascript">
/*들어오자마 예매하기 */
$(function(){
	var startStation ='${startStation}';
	if (startStation.length !=0){
		$.getJSON('${root}/erp/trainList/${startDate}/${startStation}/${endStation}',function(data){
			erp.table(data);
		});
	}else{
		erp.reservetable();
	}
	
	 $('#datepicker').datepicker();
});
var popupCalendar = function(url){
	window.open(url,
				"popupCalendar",
				"scrollbars,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=150,height=400,top=200,left=400");
}
/*운행열차 확인 버튼*/
    erp = {}
   
    erp.reservetable=function() {
		
    	$('#erpbox').empty();
        $('#erpbox').append("<form action='${root}/erp/trainList' id='infoFrm' name='infoFrm'>"
        		 +"<div align='center'><table id='tableTag'><tr><td>출발역</td>"
        		 +"<td><select class='startStation' name='startStation' >"
        	+"<option value='st10'>서울</option><option value='st30'>대전</option>"
         +"<option value='st40'>대구</option><option value='st20'>부산</option>"
         +"</select></td><td></td></tr><tr><td>도착역</td><td><select class='endStation' name='endStation' >"
         +"<option value='st10'>서울</option>"
         +"<option value='st30'>대전</option><option value='st40'>대구</option>"
         +"<option selected='selected' value='st20'>부산</option></select></td><td></td></tr>"
         +"<tr><td>출발일</td><td>"
         +"<input type='text' id='datepicker' name='startDate' value='07/19/2015'></td><td></td></tr>"
         +"<tr><td>시 간</td><td><select name='time'>"
         +"<c:forEach begin='0' end='23' var='time' step='1'>"  
         +"<option value='${time}'>${time}시</option></c:forEach>"
         +"</select></td></tr>"
         +"<tr><td colspan='3' id='submit' align='center'>"
         +"<input type='button' id='trainbtn' value='승차권 검색' /></td></tr>"
         +"</table></div>"
         +"</form>");
         erp.train();
	}
	erp.train = function(){
		
		$('#trainbtn').click(function(){
			var startDate = $('#datepicker').val();
			var startStation = $('.startStation option:selected').val();
			var endStation = $('.endStation option:selected').val();
			startDate=startDate.replace("/",""); 
			startDate=startDate.replace("/","");
			
				erp.list(startDate,startStation,endStation);
			});
	}
				erp.list = function(startDate,startStation,endStation) {
					$.ajax({
						url : '${root}/erp/trainList/'+startDate+'/'+startStation+'/'+endStation,
						type : 'GET',
						dataType : 'JSON',
						contentType : "application/json",
						success : function(data){
							erp.table(data);
						},
						error : function() {	
						}
					});
				}
	/*예매확인 버튼 클릭한후 실행될테이블*/			
	
	
	
/*운행열차 확인 테이블*/
erp.table=function(data){	
	
		 $('#erpbox').empty();
	$('#erpbox').append('<form action="${root}/erp/trainList" id="infoFrm" name="infoFrm">'
	    +'<div align="center"><table id="tableTag"><tr><td>출발역</td>'
	    +'<td><select class="startStation" name="startStation">'
	    +'<option value="st10">서울</option><option value="st30">대전</option>'
	    +'<option value="st40">대구</option><option value="st20">부산</option>'
	    +'</select></td><td></td></tr><tr><td>도착역</td><td><select class="endStation" name="endStation" >'
	    +'<option value="st10">서울</option><option value="st30">대전</option>'
	    +'<option value="st40">대구</option><option value="st20" selected="selected">부산</option>'
	    +'</select></td><td></td></tr><tr><td>출발일</td><td>'
	    +'<input type="text" id="datepicker" name="startDate" value="07/19/2015"></td><td></td></tr>'
	    +'<tr><td>시 간</td><td><select name="time">'
	    +'<c:forEach begin="0" end="23" var="time" step="1">'
	    +'<option value="${time}">${time}시</option></c:forEach>'
	    +'</select></td></tr><tr><td colspan="3" id="submit" align="center">'
	    +'<input type="button" id="trainbtn" value="승차권 검색"/></td></tr></table></div>'
	    +'</form></br>'
	    +"<div class='datagrid'><table>"
		+"<thead><tr><th>열차번호</th><th>출발일</th><th>출발역</th><th>출발시간</th><th>도착역</th>"
		+"<th>도착시간</th><th>좌석번호</th><th>운임요금</th><th>결제</th></tr></thead>"
		+"<tbody id='tbd'></tbody>");     

	var table;
	$.each(data,function(index) {
		if (index%2==0) {
			table+="<tr><td><input type='hidden' id='trainCode"+index+"' value='"+this.trainCode+"' >"+this.trainCode+"</td>";
			table+="<td><input type='hidden' id='startDate"+index+"' value='"+this.startDate+"' >"+this.startDate+"</td>";
			table+="<td><input type='hidden' id='startStation"+index+"' value='"+this.startStation+"' >"+this.startStation+"</td>";
			table+="<td><input type='hidden' id='startTime"+index+"' value='"+this.startTime+"' >"+this.startTime+"</td>";
			table+="<td><input type='hidden' id='endStation"+index+"' value='"+this.endStation+"' >"+this.endStation+"</td>";
			table+="<td><input type='hidden' id='endTime"+index+"' value='"+this.endTime+"' >"+this.endTime+"</td>";
			table+='<td><a href="#" onclick="return erp.seatSel(\''+this.trainCode+'\',\''+index+'\')" >';
			table+='<img src="${context}/image/erp/seatSel.jpg" width="80px"/> </a>';
			table+='<input type="text" size="5" readonly="readonly" id="seatNum'+index+'" width:100px; value="" /></td>';
			table+='<td><input type="hidden" id="pay'+index+'" value="'+this.pay+'" >'+this.pay+'</td><td>';
			table+='<a href="#" onclick="return erp.reserveSelect(\''+index+'\')" >';
	    	table+='<img src="${context}/image/erp/reserveBtn.jpg"  alt="" width="80px"/></a></td>';
			table+="</tr>";
		} else {
			table+="<tr class='alt'><td><input type='hidden' id='trainCode"+index+"' value='"+this.trainCode+"' >"+this.trainCode+"</td>";
			table+="<td><input type='hidden' id='startDate"+index+"' value='"+this.startDate+"' >"+this.startDate+"</td>";
			table+="<td><input type='hidden' id='startStation"+index+"' value='"+this.startStation+"' >"+this.startStation+"</td>";
			table+="<td><input type='hidden' id='startTime"+index+"' value='"+this.startTime+"' >"+this.startTime+"</td>";
			table+="<td><input type='hidden' id='endStation"+index+"' value='"+this.endStation+"' >"+this.endStation+"</td>";
			table+="<td><input type='hidden' id='endTime"+index+"' value='"+this.endTime+"' >"+this.endTime+"</td>";
			table+='<td><a href="#" onclick="return erp.seatSel(\''+this.trainCode+'\',\''+index+'\')" >';
			table+='<img src="${context}/image/erp/seatSel.jpg" width="80px"/> </a>';
			table+='<input type="text" size="5" readonly="readonly" id="seatNum'+index+'" width:100px; value="" /></td>';
			table+='<td><input type="hidden" id="pay'+index+'" value="'+this.pay+'" >'+this.pay+'</td><td>';
			table+='<a href="#" onclick="return erp.reserveSelect(\''+index+'\')" >';
	    	table+='<img src="${context}/image/erp/reserveBtn.jpg"  alt="" width="80px"/></a></td>';
			table+="</tr>";
		}
	});
		$('#tbd').html(table);
		erp.train();
		erp.reserveSelect();
	}

	erp.reserveSelect = function(index) {

		
		var trainCode = document.getElementById("trainCode" + index).value;
		var startDate = document.getElementById("startDate" + index).value;
		var startStation = document.getElementById("startStation" + index).value;
		var startTime = document.getElementById("startTime" + index).value;
		var endStation = document.getElementById("endStation" + index).value;
		var endTime = document.getElementById("endTime" + index).value;
		var seatNum = document.getElementById("seatNum" + index).value;
		var pay = document.getElementById("pay" + index).value;
		$('#erpbox').empty();
		var table = "<div id='payDiv'>";
		table += "<table id='tableTag'>";
		table += "<tr><td style='border: solid 1px black; 'colspan='2'>예매승차내역</td></tr>";
		table += "<tr><td style='border: solid 1px black; '>열차번호</td><td style='border: solid 1px black; '>" + trainCode + "<input type='hidden' id='trainCode"+index+"' value='"+trainCode+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>출발일</td><td style='border: solid 1px black; '>"+ startDate + "<input type='hidden' id='startDate"+index+"' value='"+startDate+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>출발역</td><td style='border: solid 1px black; '>"+ startStation + "<input type='hidden' id='startStation"+index+"' value='"+startStation+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>출발시간</td><td style='border: solid 1px black; '>"+ startTime + "<input type='hidden' id='startTime"+index+"' value='"+startTime+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>도착역</td><td style='border: solid 1px black; '>"+ endStation + "<input type='hidden' id='endStation"+index+"' value='"+endStation+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>도착시간</td><td style='border: solid 1px black; '>"+ endTime + "<input type='hidden' id='endTime"+index+"' value='"+endTime+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>좌석번호</td><td style='border: solid 1px black; '>"+ seatNum + "<input type='hidden' id='seatNum"+index+"' value='"+seatNum+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; '>운임요금</td><td style='border: solid 1px black; '>"+ pay + "<input type='hidden' id='pay"+index+"' value='"+pay+"' ></td></tr>";
		table += "<tr><td style='border: solid 1px black; 'colspan='2'><a href='#'>";
		table += "<img id='pay' src='${context}/image/erp/paybtn.jpg' width='100px' alt=''/></a></td></tr></table></div>";
		$('#erpbox').html(table);
		erp.pay(index);
	}
	erp.seatSel = function(trainCode,index) {
		window.open("${root}/erp/seatSelTiles/" + trainCode +'/'+ index, '좌석선택창',
				'width=427,height=280,top=200,left=200');
	}
	/* 예매에 필요한 값 : 1.예매번호 2.열차번호 3.출발역 4.출발시간 5.도착역 6.도착시간 7.좌석번호 8.예매일 9.아이디*/
	erp.pay = function(index) {
		
		$('#pay').click(function() {
			var trainCode = document.getElementById("trainCode" + index).value;
			var startDate = document.getElementById("startDate" + index).value;
			var startStation = document.getElementById("startStation" + index).value;
			var startTime = document.getElementById("startTime" + index).value;
			var endStation = document.getElementById("endStation" + index).value;
			var endTime = document.getElementById("endTime" + index).value;
			var seatNum = document.getElementById("seatNum" + index).value;
			var pay = document.getElementById("pay" + index).value;
			var id = /* $('#userid').val(); 종합후엔 주석 풀어주어야함*/ "m01";
			var train = {
				"trainCode" : trainCode,
				"startDate" : startDate,
				"startStation" : startStation,
				"startTime" : startTime,
				"endStation" : endStation,
				"endTime" : endTime,
				"seatNum" : seatNum,
				"pay" : pay,
				"id" : id
			};
			
			$.ajax({
				url : '${root}/erp/insert',
				data : train,
				type : 'get',
				dataType : 'json',
				contentType : 'application/json',
				success : function(data){
					if (data == null) {
						alert('결제 실패');
					} else {
						alert('결제 성공');
						erp.cancelForm2();
					}
				},
				error : function(request, status, error) {
					alert('에러');
				}
			});
		});
	}
	erp.cancelForm2 = function() {
		var url = "${root}/erp/reserveInfo";
		$.ajax({
			url : url,
			type : "GET",
			dataType: "JSON",
			contentType : "application/json",
			success : function(data) {
				if(data==null){
					erp.nocancel();
				}else{
					erp.cancelForm(data);
				}
				
			},
			error : function() {}
		});
	}
	erp.cancelForm= function(data) {
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
				table +='<a href="#" onclick="return erp.cancel(\''+this.reserveNo+'\',\''+this.trainNo+'\')" >';
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
				table +='<a href="#" onclick="return erp.cancel(\''+this.reserveNo+'\',\''+this.trainNo+'\')" >';
		    	table +='<img src="${context}/image/erp/cancel.jpg"  alt="" width="60px"/></a></td>';
				table+="</tr>"
			}
		});
			$('#tbd').html(table);
	}
	erp.cancel=function(reserveNo,trainNo){
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
				
				erp.cancelForm(data);
			},
			error : function(xhr, status, msg) {
				alert('예매반환실패');
			}
		});
	}
	
</script>
	