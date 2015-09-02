<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="pkgBest"></div>
<div id="pkgSearch"></div>
<div id="pkgBox"></div>
 <script src="${context}/js/event/event.js"> </script>
 <script type="text/javascript">
eventPkg={}
 	$(function() {
		$.getJSON('${root}/event/pkgRank',function(data){
			eventPkg.pkgBest(data);
		}); 
		$.getJSON('${root}/event/goodsList',function(data){
			eventPkg.pkgList(data);
		});
	});
	eventPkg.pkgBest = function(data) {
		$('#pkgBest').empty();
		var table ='<div id="bestList" class="txt-c w-max h-200 ">';
				table +='<ul>';
				$.each(data,function(index) {
					table +='<li><div style="bottom: 100px; left:-40px; z-index: 10; position: absolute;" >';
					table +='<img src="${context }/image/event/no'+(index+1)+'.png" width="80px" height="130px"/></div>';
					table +='<a href="#" id="mouseover" onclick="return eventPkg.detail(\''+this.pkgCode+'\')">';
					table +='<img src="${context }/image/event/'+this.path+'" width="200px" height="150px" id="img01"/><br />';
					table +='<b>'+this.pkgName+'</b></a> <br />';
					table +='<span id="pay">'+this.pkgPrice+' 원</span></li>';
				});
			table +='</ul></div></p>';
		$('#pkgBest').html(table);
	}
	//${root}/event/userDetail/'+this.pkgCode+'"
	eventPkg.pkgHome = function() {
		$.ajax({
			url: "${root}/event/goodsList",
			Type : 'POST',
			dataType : 'JSON',
			contentType :'application/json',
			success: function(data) {
				eventPKG.pkgList(data);
			},
			error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	
			}
		});
	}
 
	eventPkg.pkgList = function(data) {
		var table ='<div class="txt-c mt-20" ><h2>패키지 상품</h2><table class="tableTag txt-c w-800"  align="center">';	
		table +='<tr><th class="txt-c w-20p"> 패키지 목록</th><th>지역</th><th class="txt-c"> 패키지 이름</th><th class="txt-c w-10p">가격</th><th class="txt-c w-10p">평점</th></tr>';
		$.each(data,function() {
			table +='<tr><th>';
			table +='<img src="${context}/image/event/'+this.path+'" width="150px" height="100px"></a></th><td>'+this.mtAddress+'</td>';
			table +='<td><a href="#" id="pkgDetail" onclick="return eventPkg.detail(\''+this.pkgCode+'\')">'+this.pkgName+'</a></td><td>'+this.pkgPrice+'원</td>';
			table +='<td>'+this.grade+'점</td></tr>';
			}); 
			table +='</table></div><p>';
		$('#pkgBox').html(table);
	}

	eventPkg.detail = function(pkgCode){
		$.getJSON( '${root}/event/userDetail/'+pkgCode,function(data){
			eventPkg.detailForm(data);
		});
	}
	 eventPkg.detailForm = function(data){	
		 $('#pkgBest').empty();
		 $('#pkgBox').empty();
		 var table ='<div align="center" class="mt-50 mb-50"><table class="tableTag txt-c mt-100" border="1px solid black" align="center">';
			table +='<tr><th class="txt-c">이미지</th><td><img src="${context}/image/event/'+data.path+'" width="150px" height="100px">';
			table +='<tr><th class="txt-c">패키지이름</th><td>'+data.pkgName+'</td></tr>';
			table +='<tr><th class="txt-c">패키지기간</th><td>'+data.pkgTermA+' ~ '+data.pkgTermB+'</td></tr>';
			table +='<tr><th class="txt-c">패키지 문의전화번호</th><td>'+data.pkgTel+'</td></tr>';
			table +='<tr><th class="txt-c">패키지 분류지역</th><td>'+data.areaName+'</td></tr>';
			table +='<tr><th class="txt-c">숙소 이름</th><td>'+data.mtName+'</td></tr>';
			table +='<tr><th class="txt-c">숙소 주소</th><td>'+data.mtAddress+'</td></tr>';
			table +='<tr><th class="txt-c">숙소 연락처</th><td>'+data.mtPhone+'</td></tr>';
			table +='<tr><th class="txt-c">패키지 숙소 객실정보(몇평,몇인실)</th><td>'+data.mtInfo+'</td></tr>';
			table +='<tr><th class="txt-c">패키지가격</th><td>'+data.pkgPrice+' 원</td></tr>';
			table +='<tr><th class="txt-c"><input type="button" id="pkgReserBtn" value="예 매 하 기"/></th><td id="reserve"></td></tr></div>';
			table +='<div></div>'
			$('#pkgBox').html(table);
			$('#pkgReserBtn').one('click',function(e) {
				if (($('#userid').val()).length != 0){
					
				
					
				
				e.preventDefault;
				var table1 = '<td><select id="reservList"></select>'	
				$.ajax({
					url : "${root}/event/pkgTrainReList",
					type : "GET",
					dataType : "json",
					contentType : "application/json",
					success : function(data) {
						$.each(data,function() {
							$('#reservList').append('<option value="'+this.reserveNo+'">'+this.reserveNo+'-'+this.startStation+','+this.endStation+'</option>');
						});						
					},
                    error : function() {
						
					}
				});
				table1 +='<input type="button" id="pkgReserbtn" value="결 제"/><input type="date" id="startDate" name="startDate"></td>';
				$('#reserve').append(table1);
				eventPkg.pkgReserve(data);
				} else {
					alert("회원 전용입니다. 로그인 해주세요");
					location.href = "${root}/home";
				}
			});
			
			
	} 
	 
	 eventPkg.pkgReserve = function(data){
		 $('#pkgReserbtn').click(function(){
			 var reservNo=$('#reservList option:selected').val();
			 var userid  = $('#userid').val();
			 userid ='m3';
			 var startDate = $('#startDate').val();
			 $.ajax({
				 url : "${root}/event/pkgReserve/"+reservNo+"/"+ data.pkgCode+"/"+userid+"/"+startDate+"/"+data.mtPrice,
				 type : "get",
				 dataType : "json",
				 contentType : "application/json",
				 success : function(data) {
					 location.href = "${root}/event/pkgReserveView";
				 },
	             error : function() {
					
				}
			 });
		 });
	 }

/************* 검  색 ****************************/
/* 	$(function() {
		eventPkg.detail();
	});

	eventPkg.detail = function() {
	var table ='<div><form action=""><hr /><table>';
	    table +='<tr><th>빠 른 검 색 </th><td>&nbsp;&nbsp;&nbsp;&nbsp;';	
		table +='<label for="area">분류 <select id="area" name="area">';
		table +='<option style="text-align:center">== 지역 ==</option>';
		table +='<option value="수도권" style="font-weight:10px">수도권</option>';
		table +='<option value="영동권">영동권</option>';
		table +='<option value="충청권">충청권</option>';
		table +='<option value="호남권">호남권</option>';
		table +='<option value="영남권">영남권</option>';
		table +='</select></label>&nbsp;';
		table +='</td><td>&nbsp;';
		table +='<label for="pkgDay">출발일<input type="date" id="pkgDay" name="pkgDay"/></label>';
		table +='&nbsp;&nbsp;</td><td>&nbsp;&nbsp;<label for="pkgName" >';
		table +='여행명 <input type="text" id="pkgName" name="pkgName" size="40px" /></label>';
		table +='<input type="button" value="조회하기" /></td></tr>';
		table +='</table><hr /></form></div>';
		
		$('#pkgSearch').html(table);
	} */
	
	
/*********** 상품 순위 **********************************/
	/* $(function() {
		eventPKG.best();
	}); */
 
 </script>