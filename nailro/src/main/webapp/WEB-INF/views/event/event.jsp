<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="pkgBox"></div>
<hr />
<div id="sellerBox"></div>
<script src="${context}/js/event/event.js"></script>
<script type="text/javascript">
$(function() {
	eventPKG.pkgHome();
});
eventPKG={}
eventPKG.pkgHome = function() {
	$(function(){
		$.getJSON("${root}/event/pkgList/1",function(data){
			eventPKG.pkgList(data);
			});
	});
}
eventPKG.pkgList = function(data) {
	$('#pkgBox').empty();
	var table ='<div align="center"><br /><br /><h1> 내일로 패키지 상품 목록 </h1>';
		table +='<div><button id="pkgInsert" class="btn_blue_ang" style="width: 200px; height: 40px">등록하기</button><div>';
		table +='<p>';
		table +='<table class="tableTag txt-c w-1000">';
		table +='<tr><th>번호</th><th>코드번호</th><th>지역코드</th><th>이름</th><th>유효기간</th><th>판매자 연락처</th><th>판매자 코드</th>';
    	table +='<th>숙소 코드</th><th>예약코드</th><th>가격</th><th>세부사항</th><th>평점</th><th>이미지</th><th>수정</th><th>삭제</th></tr>'; 
	    $.each(data.list,function(index){
	    table +='<tr>';
	    table +='<td>'+this.num+'</td><td>'+this.pkgCode+'</td><td>'+this.areaCode+'</td>';	
	    table +='<td>'+this.pkgName+'</td><td>'+this.pkgTermA+' ~ '+this.pkgTermB+'</td>';
	    table +='<td>'+this.pkgTel+'</td><td>'+this.salerCode+'</td><td>'+this.mtCode+'</td>';
	    table +='<td>'+this.pkgKeepCode+'</td><td>'+this.pkgPrice+'</td><td>'+this.pkgAbout+'</td>';
	    table +='<td>'+this.grade+'</td><td><button class="pkgImage" value='+this.path+'>이미지</button></td>';
	    table +='<td><button class="pkgUpdate" value='+this.pkgCode+'>수정</button></td>'
	    table +='<td><button class="pkgDelete" value='+this.pkgCode+'>삭제</button></td></tr>';
	    table +='<input type="hidden" id='+this.pkgCode+' value='+this.mtCode+' />'
	    });
	    table +='<tr><td colspan="15" align="right"><div><nav>';
	    table +='<ul class="pagination">';
	    table +='</ul>&nbsp;&nbsp;&nbsp;';
	    table +='</nav></div></td></tr>';
	    table +='</table></div></div>';
	    $('#pkgBox').html(table);
		eventPKG.pkgInsertForm();
    	eventPKG.pkgUpdate();
   		eventPKG.pkgDelete();
   		eventPKG.pkgImage();
	    //-----------페이징 처리 --------------
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
	         $('.pagination').append('<li ><a href="#" onclick="return eventPKG.listOn('+(startPage-pageSize)+')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>');
	      } 
	      for(var i=startPage;i<=endPage;i++){
	         $('.pagination').append('<li><a href="#" onclick="return eventPKG.listOn('+i+')">'+i+'</a></li>');
	      }
	      if(endPage < pageCount){
	         $('.pagination').append('<li ><a href="#" onclick="return eventPKG.listOn('+(startPage+pageSize)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
	      }
	     //----------------------------//    
}
	eventPKG.pkgImage = function() {
		$('.pkgImage').click(function() {
			var path = $(this).val();
		        popwin=window.open("","",'width=700,height=500');
		        popwin.document.write('<body topmargin=0 leftmargin=0>'
		        									+'<img style=cursor:hand; width =700, height=500, onclick="self.close()" src="${context}/image/event/'+path+'" ></body>');
		        popwin.document.close();		
		});
	}	
	eventPKG.listOn = function(pageNo) {
		$.getJSON('${root}/event/pkgList/'+pageNo,function(data){
			eventPKG.pkgList(data);
		});
	}
	eventPKG.pkgUpdate = function() {
		$('.pkgUpdate').click(function() {
			var pkgKey = $(this).val();
			$.getJSON('${root}/event/pkgDetail/'+pkgKey,function(data){
				eventPKG.pkgUpdateForm(data);
			});
		});
	}
	
	eventPKG.pkgDelete = function() {
		 $('.pkgDelete').click(function() {
		    	var key = $(this).val();
		    	console.log('key 값'+key);
		    	var msg = confirm('상품을 삭제하시겠습니까?');
					if(msg){		    	
						$.getJSON('${root}/event/pkgDelete/'+key, function() {
							eventPKG.pkgHome();			
		 });
	  }
	});
}

eventPKG.pkgInsertForm = function() {
    $('#pkgInsert').click(function() {
		$('#pkgBox').empty();
		$('#sellerBox').empty();	
	    var table ='<div align="center"><h2><b>패키지 정보입력</b></h2>';
			table +='<form action="${root}/event/pkgInsert" id="pkgForm" name="pkgForm" method="POST" enctype="multipart/form-data"><table class="tableTag"><tr><th><label for="pkgCode">패키지 코드번호</label>';
			table +='</th><td><input type="text" id="pkgCode" name="pkgCode" size="35" required autofocus /></td></tr>';
			table +='<tr><th><label for="salerCode">판매자 코드</label> </th><td><input type="text" id="pkgSaler" name="salerCode" size="35" /></td></tr><tr><th>';
			table +='<label for="pkgKeepCode">상품 예약 코드</label></th><td><input type="text" id="pkgKeepCode" name="pkgKeepCode" size="35" /></td></tr><tr><th>';
			table +='<label for="grade">패키지 평점</label></th><td><input type="number" id="pkgScore" name="grade" min="0" max="10" placeholder="0" value="0" />점</td>';
			table +='</tr><tr><th><label for="pkgName">패키지 이름</label> </th><td><input type="text" id="pkgName" name="pkgName" size="35" /></td></tr><tr><th>';
			table +='<label for="pkgTel">패키지 문의번호</label></th><td><input type="tel" id="pkgTel" name="pkgTel" /></td></tr><tr><th><label for="pkgTermA">패키지 유효기간</label>';
			table +='</th><td><input type="date" id="pkgTermA" name="pkgTermA" size="35" />  ~ <input type="date" id="pkgTermB" name="pkgTermB" size="35" /></td></tr>';
			table +='<tr><th><label for="area"> 패키지 분류지역</label></th><td><select id="area" name="areaCode" required><option value="ac02">서울</option><option value="ac031">경기</option><option value="ac055">경남</option>';
			table +='<option value="ac051">부산</option><option value="ac053">대구</option><option value="ac032">인천</option><option value="ac062">광주</option><option value="ac052">울산</option><option value="ac044">세종</option></select></td></tr>';
			table +='<tr><th><label for="pkgAbout">패키지 세부사항</label></th><td><textarea name="pkgAbout" id="pkgAbout" name="pkgAbout" rows="7" cols="40"></textarea></td>';
			table +='</tr><tr><td colspan="2"><button id="mtInfo">숙소목록</button><br /></td></tr><tr><th><label for="pkgMTName"> 숙소 이름</label></th>';
			table +='<td><input type="text" id="pkgMTName" name="pkgMTName" size="35" /></td></tr><tr><th><label for="pkgMTAddress"> 숙소 주소</label>';
			table +='</th><td><input type="text" id="pkgMTAddress" name="pkgMTAddress" size="35" /></td></tr><tr><th><label for="pkgMTTel"> 숙소 연락처</label> </th>';
			table +='<td><input type="tel" id="pkgMTTel" name="pkgMTTel" size="35" /></td></tr><tr><th><label for="pkgMTInfo"> 숙소 객실정보</label> </th>';
			table +='<td><input type="text" id="pkgMTInfo" name="pkgMTInfo" size="35" placeholder=" * 평, * 인실" /></td></tr><tr><th><label for="pkgMTAbout"> 숙소 세부사항</label></th>';
			table +='<td><textarea name="pkgMTAbout" id="pkgMTAbout" name="pkgMTAbout" rows="7" cols="40"></textarea></td></tr><tr><th><label for="pkgImg">상품 이미지</label>';
			table +='</th><td><input type="file" id="file" name="file" value="상품이미지" /></td></tr><tr><td colspan="2"><hr/></td></tr><tr><td colspan="2" align="right"><label for="trainPrice">기차통행료</label>';
			table +='<input type="text" id="trainPrice" name="trainPrice" size="5" placeholder="0"/>원&nbsp;</td></tr><tr><td colspan="2" align="right"><b>+&nbsp; &nbsp; &nbsp;&nbsp;';
			table +='&nbsp;</b></td></tr><tr><td colspan="2" align="right"><label for="mtPrice">숙박료</label><input type="text" id="mtPrice" name="mtPrice" size="5" placeholder="0"/>원';
			table +='&nbsp;</td></tr><tr><td colspan="2" align="right"><input type="button" id="add" value="총금액" value=0 >';
			table +='<input type="text" id="result" name="pkgPrice" size="10"/>원</td></tr><td colspan="2" align="center" class="h-100">';
			table +='<input type="submit" value="등    록" id="insert"/> <input type="button" value="취    소" id="cancel"/><input type="hidden" name="mtCode"><br/><br/></td></tr></table></form></div>';
			$('#pkgBox').html(table);
			$('#add').click(function(e) {
				e.preventDefault();
				pkgInsertForm.add();
			});
			eventPKG.mtInfo();
			eventPKG.pkgInsert();
			eventPKG.pkgcancel();
    });
}
	eventPKG.mtInfo = function() {
		$('#mtInfo').click(function(e) {
			e.preventDefault();
			pkgInsertForm.mtInfo('${root}/event/mtInfo');
		});
	}
	eventPKG.pkgInsert = function() {
		$('#insert').click(function() {
			$('#pkgForm').submit(function(e) {
				e.preventDefault();
				var postData = new FormData($('#pkgForm')[0]);
				$.ajax({
					url : '${root}/event/pkgInsert',
					type : 'POST',
					data : postData,
					async : true, // 비동기를 활성화
					dataType : 'json',
					mimeType : 'multipart/form-data',
					processData : false,
					contentType : false,
					success : function(data){
						alert("패키지 등록 성공");
						eventPKG.pkgHome();
						eventPKG.sellerHome();
					},
					error : function() {
						alert("패키지 등록 실패");	
					}
				});
			});
		});
	}
	eventPKG.pkgcancel = function() {
		$('#cancel').on('click',function(e) {
			e.preventDefault();
			eventPKG.pkgHome();
			eventPKG.sellerHome();
		});
	}
	eventPKG.pkgUpdateForm = function(data) {
		$('#pkgBox').empty();
		$('#sellerBox').empty();
		var table ='<div align="center"><h2><b>패키지 정보입력</b></h2>';
		table += '<form action="${root}/event/pkgUpdate" id="pkgForm" name="pkgForm">';
		table += '<table class="tableTag"><tr><th><label for="pkgCode">패키지 코드번호</label>';
		table +='</th><td><input type="text" id="pkgCode" name="pkgCode" size="35" required autofocus readonly value='+data.pkgCode+' /></td></tr>';
		table +='<tr><th><label for="salerCode">판매자 코드</label> </th><td><input type="text" id="pkgSaler" name="salerCode" size="35" value='+data.salerCode+' /></td></tr><tr><th>';
		table +='<label for="pkgKeepCode">상품 예약 코드</label></th><td><input type="text" id="pkgKeepCode" name="pkgKeepCode" size="35" value='+data.pkgKeepCode+' /></td></tr><tr><th>';
		table +='<label for="grade">패키지 평점</label></th><td><input type="number" id="pkgScore" name="grade" min="0" max="10" placeholder="0" value="0" />점</td>';
		table +='</tr><tr><th><label for="pkgName">패키지 이름</label> </th><td><input type="text" id="pkgName" name="pkgName" size="35" value='+data.pkgName+' /></td></tr><tr><th>';
		table +='<label for="pkgTel">패키지 문의번호</label></th><td><input type="tel" id="pkgTel" name="pkgTel" value='+data.pkgTel+' /></td></tr><tr><th><label for="pkgTermA">패키지 유효기간</label></th><td>';
		table +='<input type="date" id="pkgTermA" name="pkgTermA" size="35" value='+data.pkgTermA+' />  ~ <input type="date" id="pkgTermB" name="pkgTermB" size="35" value='+data.pkgTermB+' />';
		table +='</td></tr><tr><th><label for="area"> 패키지 분류지역</label></th><td><select id="area" name="areaCode" required ><option value="ac01">수도권</option>';
		table +='<option value="ac02">영동권</option><option value="ac03">충청권</option><option value="ac04">호남권</option><option value="ac05">영남권</option></select></td></tr>';
		table +='<tr><th><label for="pkgAbout">패키지 세부사항</label></th><td><textarea name="pkgAbout" id="pkgAbout" name="pkgAbout" rows="7" cols="40">'+data.pkgAbout+'</textarea></td>';
		table +='</tr><tr><td colspan="2"><button id="mtInfo">숙소목록</button><br /></td></tr><tr><th><label for="pkgMTName"> 숙소 이름</label></th>';
		table +='<td><input type="text" id="pkgMTName" name="pkgMTName" size="35" value='+data.mtName+' /></td></tr><tr><th><label for="pkgMTAddress"> 숙소 주소</label>';
		table +='</th><td><input type="text" id="pkgMTAddress" name="pkgMTAddress" size="35" value='+data.mtAddress+' /></td></tr><tr><th><label for="pkgMTTel"> 숙소 연락처</label> </th>';
		table +='<td><input type="tel" id="pkgMTTel" name="pkgMTTel" size="35" value='+data.mtPhone+' /></td></tr><tr><th><label for="pkgMTInfo"> 숙소 객실정보</label> </th>';
		table +='<td><input type="text" id="pkgMTInfo" name="pkgMTInfo" size="35" placeholder=" * 평, * 인실" value='+data.mtInfo+' /></td></tr><tr><th><label for="pkgMTAbout"> 숙소 세부사항</label></th>';
		table +='<td><textarea name="pkgMTAbout" id="pkgMTAbout" name="pkgMTAbout" rows="7" cols="40">'+data.mtAbout+'</textarea></td></tr><tr><th><label for="pkgImg">상품 이미지</label>';
		table +='</th><td><input type="file" id="pkgImg"/></td></tr><tr><td colspan="2"><hr/></td></tr><tr><td colspan="2" align="right"><label for="trainPrice">기차통행료</label>';
		table +='<input type="text" id="trainPrice" name="trainPrice" size="5" placeholder="0"/>원&nbsp;</td></tr><tr><td colspan="2" align="right"><b>+&nbsp; &nbsp; &nbsp;&nbsp;';
		table +='&nbsp;</b></td></tr><tr><td colspan="2" align="right"><label for="mtPrice">숙박료</label><input type="text" id="mtPrice" name="mtPrice" size="5" placeholder="0" value='+data.mtPrice+' />원';
		table +='&nbsp;</td></tr><tr><td><hr /></td><td><hr/></td></tr><tr><td colspan="2" align="right"><input type="button" id="add" value="총금액">';
		table +='<input type="text" id="result" name="pkgPrice" size="10" value='+data.pkgPrice+' />원</td></tr><tr><td colspan="2"><hr/></td></tr><tr><td colspan="2" align="center">';
		table +='<input type="submit" value="수    정" id="pkgUpdate"/> <input type="button" value="취    소" id="cancel"/><input type="hidden" name="mtCode" value='+data.mtCode+' ><br/><br/></td></tr></table></form></div>';
		$('#pkgBox').html(table);
		eventPKG.update();
		eventPKG.pkgcancel();
		eventPKG.mtInfo();
	}
	
	eventPKG.update = function() {
		$('#pkgUpdate').click(function() {
				console.log("1");
			$('#pkgForm').submit(function(e) {
				e.preventDefault();
				console.log("2");
				var $form = $('#pkgForm ');
				var $data = $form.serialize();
				var $url = $form.attr('action');
				console.log("3");
				$.ajax({
					url: $url,
					type : 'GET',
					data : $data,
					dataType : 'json',
					contentType : 'application/json',
					success : function(data) {
						alert("수정성공");
						eventPKG.pkgHome();
						eventPKG.sellerHome();
					},
					error : function() {
						alert("수정실패");
					}
				});
				
			});

		});
	}
	//*******************************seller************************//
	
$(function() {
		$.getJSON('${root}/event/salerList',function(data){
			eventPKG.sellerList(data);
		});
});
eventPKG.sellerHome = function() {
	$.getJSON('${root}/event/salerList',function(data){
		eventPKG.sellerList(data);
	});
}	

eventPKG.sellerList = function(data) {
	$('#sellerBox').empty();
	var table ='<div align="center"><h1> 판매자 목록 </h1>';
		table +='<div><input type ="button" id="sellerInsertForm" style="width: 200px; height: 40px" value="등록하기 ▼"><div><p>';
	    table +='<div align="center" id="plus" style="display: none;">';
	    table +='<form action="${root}/event/salerInsert" id="sellerForm">';
    	table += '<table class="tableTag">';
		table +='<tr><th>판매자 코드</th><th>판매자 이름</th><th>판매자 연락처</th></tr>';
		table +='<tr><td><input Type="Text" id="salerCode" name="salerCode" /></td>';	
		table +='<td><input Type="Text" id="salerName" name="salerName" /></td>';
		table +='<td><input Type="Text" id="salerPhone" name="salerPhone" /></td></tr>';
		table +='<tr><td colspan="3" align="center"><input type="submit" value="등 록" id="sellerInsert" />';
		table +=' <input type="button" id="sellercancel" value="취 소" /></td></tr>';
	    table +='</table></form></div><p>';	    
		table +='<table class="tableTag txt-c w-1000">';
		table +='<tr><th>번호</th><th>판매자 코드</th><th>판매자 이름</th><th>판매자 연락처</th>';
    	table +='<th>수정</th><th>삭제</th></tr>'; 
	    $.each(data,function(index){
	    table +='<tr>';
	    table +='<td>'+(index+1)+'</td><td class="'+(index+1)+'1" >'+this.salerCode+'</td>';	
	    table +='<td class="'+(index+1)+'2">'+this.salerName+'</td><td class="'+(index+1)+'3" >'+this.salerPhone +'</td>';
	    table +='<td class="'+(index+1)+'4"><button class="sellerUpdate" id ="'+this.salerCode+'" value="'+(index+1)+'">수정</button></td>';
	    table +='<td><button class="sellerDelete" value='+this.salerCode+'>삭제</button></td></tr>';
	    });
		table +='</table></div>';
	    $('#sellerBox').html(table);
	    eventPKG.sellerInsertForm();
	    eventPKG.sellerUpdateForm();
	    eventPKG.sellerDelete();
}
	eventPKG.sellerUpdateForm = function() {
		$('.sellerUpdate').click(function() {
			var key = $(this).attr('id');
			var index = $(this).val();
	 		$.getJSON('${root}/event/salerDetail/'+key,function(data) {
				var table1='<input type = hidden id="salerCode" value='+data.salerCode+' >'+data.salerCode+'';
				var table2='<input type = text id="salerName" name="salerName" value='+data.salerName+' >';
				var table3='<input type = text id="salerPhone" name="salerPhone" value='+data.salerPhone+' ></form>';
				var table4='<input type ="submit" id="update" value="확인" > <input type ="button" id="sellerCancel" value="취소" >';
				$("."+index+"1").empty();
				$("."+index+"2").empty();
				$("."+index+"3").empty();
				$("."+index+"4").empty();
				$("."+index+"1").append(table1);
				$("."+index+"2").append(table2);
				$("."+index+"3").append(table3);
				$("."+index+"4").append(table4);
				eventPKG.sellerUpdate();
				eventPKG.sellercancel();
			}); 
		});	
	}
	eventPKG.sellercancel = function() {
		$('#sellerCancel').click(function() {
			eventPKG.sellerHome();
		});
	}
 	eventPKG.sellerUpdate = function() {
		$('#update').click(function() {
				var salerCode = $('#salerCode').val();
				var salerName = $('#salerName').val();
				var salerPhone = $('#salerPhone').val();
				var data = {"salerCode":salerCode,"salerName":salerName, "salerPhone":salerPhone};
				$.ajax({
					url: '${root}/event/salerUpdate',
					type : 'GET',
					data : data,
					dataType : 'json',
					contentType : 'application/json',
					success : function(data) {
						eventPKG.sellerList(data);
					},
					error : function() {
						alert("수정 실패");
					}
				});				
		});
	} 
	eventPKG.sellerInsertForm = function() {
		$('#sellerInsertForm').click(function() {
			$('#plus').toggle(100,function() {
					eventPKG.sellerInsert();
					if($('#sellerInsertForm').val() == "등록하기 ▼"){
						$('#sellerInsertForm').val("등록하기 ▲");
					}else{
						$('#sellerInsertForm').val("등록하기 ▼");
					}
					$('#sellercancel').click(function() {
						$('#plus').css('display','none');
					});
			});


			});
			
	}
	
	eventPKG.sellerInsert = function() {
		$('#sellerInsert').click(function() {
			$('#sellerForm').submit(function(e) {
				e.preventDefault();
				var $form = $('#sellerForm');
				var $data = $form.serialize();
				var $url = $form.attr('action');
					$.ajax({ 
						url: $url,
						type : 'GET',
						data : $data,
						dataType : 'json',
						contentType : 'application/json',
						success : function(data) {	
							eventPKG.sellerList(data);
						},
						error : function() {
							alert("실패");
						}
					});				
			});
		});
	}
	
	eventPKG.sellerDelete = function() {
		$('.sellerDelete').click(function() {
			var key = $(this).val();
			var msg = confirm('상품을 삭제하시겠습니까?');
			if(msg){
				$.getJSON('${root}/event/salerDelete/'+key,function(data){
					eventPKG.sellerList(data);
		});
	}
		});
	}
</script>