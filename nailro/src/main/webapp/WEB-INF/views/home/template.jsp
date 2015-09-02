<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${context}/jquery-ui/jquery.bxslider.css" />
<link rel="stylesheet" href="${context}/css/home/magnific-popup.css" />

<div class="templateMain">
<div id="tmpl-tab" class="w-max">
	<div class="w-max h-400 mb-50">
		<ul class="bxslider w-100p h-400 mb-10" id="bestpkg">
			<li><a href="${root}/event/pkgHome"><img src="${context}/image/event/travel.jpg" class="w-100p h-100p"
					alt="" /> </a></li>
			<li><a href="${root}/event/pkgHome"><img src="${context}/image/event/travel4.jpg" class="w-100p h-100p"
					alt="" /> </a></li>
			<li><a href="${root}/event/pkgHome"><img src="${context}/image/event/travel3.jpg" class="w-100p h-100p"
					alt="" /></a></li>
		</ul>
	</div>
</div>
<div class="flo-l mr-20 w-300">
	<h2 class="txt-l">내일로소식</h2>
	<!-- <hr class="w-90p flo-l line" /> -->
	<!--게시판   -->
	<div id="boardDiv">
		
	</div>
</div>
	<div class="flo-l mr-20 w-400" >
		<h2 class="txt-l">베스트 여행상품</h2>
		<hr class="w-90p flo-l line" />
		<div id="tabs" class="h-200 mt-10">
			<ul>
				<li><a href="#tab-1">수도권여행</a></li>
				<li><a href="#tab-2">강원도여행</a></li>
				<li><a href="#tab-3">제주도여행</a></li>
			</ul>
			<div id="tab-1">
			 이미지가 없습니다.
			</div>
				<div id="tab-2">
			 이미지가 없습니다.
			</div>
				<div id="tab-3">
			 이미지가 없습니다.
			</div>
		</div>
	</div>
	<div class="flo-l w-300 ml-20 ">
	<h2 class="txt-l">승차권 간편예매</h2>
	<div id="resverseDiv1" class="bg-darkwhite t-board">
			<form action="${root}/erp/homereserve" name="infoFrom" method="post">
                <div>
                    <table style="font-size: 15px;">
                        <tr>
                            <td>출발역</td>
                            <td><select name="startStation">
                                    <option value="st10">서울</option>
                                    <option value="st20">부산</option>
                                    <option value="st40">대구</option>
                                    <option value="st30">대전</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>도착역</td>
                            <td><select name="endStation">
                                    <option value="선택" selected="selected">선택</option>
                                    <option value="st10">서울</option>
                                    <option value="st20">부산</option>
                                    <option value="st30">대전</option>
                                    <option value="st40">대구</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>출발일</td>
                            <td><input type="text" id="datepicker" name="startDate"></td>
                        </tr>
                        <tr>
                            <td>시 간</td>
                            <td><select name="time">
 
                                    <c:forEach begin="0" end="23" var="time" step="1">
                                        <option value="${time}">${time}시</option>
                                    </c:forEach>
                            </select></td>
                        </tr>                    
                        <tr>
                            <td  class="h-100" colspan="3" id="submit" align="center"><input
                                type="submit" value="승차권 검색" /></td>
                        </tr>
                    </table>
                </div>
            </form> 
		</div>
	</div>
<div id="google-map" class="white-popup-block mfp-hide w-600 h-400 auto">
	<h1 class="txt-r bg-darkblue">
		<a href="#" id="address" class="popupClose"> 
		<img src="${context}/image/home/close-button.jpg" class="popupClose flo-r" alt="" />
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6428.361809488327!2d127.43446234999999!3d36.33216520000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356548e78bd5b4f5%3A0x2fc0b4592c57a021!2z64yA7KCE6rSR7Jet7IucIOuPmeq1rCDspJHslZnroZw!5e0!3m2!1sko!2skr!4v1440689479331" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
		</a> 
	</h1>
</div>
<!-- 예매하기 단  -->		
<!--  전체 메인 div 끝 -->
</div>
<script src="${context}/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">
 var popupCalendar = function(url){
window.open(url,
			"popupCalendar",
			"scrollbars,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=150,height=400,top=200,left=400");
} 
$(function(){
	/*  $.getJSON('${root}/event/pkgRank',function(data){
		$('.bxslider').empty();
		var table ="";
		$.each(data,function(){
			table +='<li><a href="userForm.nr"><img src="${context}/image/event/'+this.path+'"class="w-100p h-100p" alt="" /></a></li>';
		});
		$('.bxslider').append(table);		
	}); */
	$('.bxslider').bxSlider({
		auto : true,
		autoControls : true,
		pause: 3000
	});
	$('#tabs').tabs();
	$('#datepicker').datepicker(); 
	$.getJSON("${root}/board/list/1/1",function(data){
	meajax.listForm(data);
	});
	
	 $('#loginBtn').click(function(){meajax.loginBtn();}); 
	 $('#moveAgreeBtn').click(function(){meajax.moveAgreeBtn();});
	 $('#searchIdBtn').click(function(){meajax.searchIdBtn();});
	 $('#searchPassBtn').click(function(){meajax.searchPassBtn();});
});
loginForm = function() {
	$('.templateMain').empty();	   
	var table ='<div class ="login-box w-1000 h-1000">';
	    table += '<form id="loginform1" name="loginform1" action="${root}/member/login" >';
	    table += '<img src="${context}/image/member/loginForm.jpg" class="loginImage"/>';
	    table += '<table><tr>';
		table += '<td colspan="6"><span> ';
		table += '<strong class="loginTitle"> 로그인 창</strong>';
		table += '</span></td></tr><br />';
		table += '<br />';
		table += '<tr><td>아이디</td>';
		table += '<td>';
		table += '<input type="text" id="id" name="id" required autofocus></td></tr><br />';
		table += '<br />';
		table += '<td>패스워드</td>';
		table += '<td>';
		table += '<input type="password" id="pass" name="pass" required autofocus></td>';
		table += '<td><input type="submit" value="" class="loginBtn" onclick="return meajax.loginBtn()"></td>';
		table += '<tr>';
		table += '<td colspan="6"><span>';
 	    table += '<br />';
		table += '<br />';
		table += '<br />';
		table += '<input type="button" value="회원가입" class="moveAgreeBtn" onclick="return meajax.moveAgreeBtn()" >';
		table += '<input type="button" value="아이디찾기" class="searchIdBtn" onclick="return meajax.searchIdBtn()" > ';
		table += '<input type="button" class="searchPassBtn" value="비밀번호찾기" onclick="return meajax.searchPassBtn()" >';
		table += '</span></td></tr></table><div>';
	$('.templateMain').html(table);
}
meajax = {}
meajax.listForm = function(data) {
	$('#boardDiv').empty();
	var table =  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
		table += '<table style="font-size: 15px;"><tr style="background-color: #00ffff;"></tr>';
		$.each(data.list,function(){
		table += '<tr><td>▶</td>';
		table += '<td><a href="#" id="detail" onclick="return meajax.detail('+this.brdNo+','+(this.readCnt+1)+')">'+this.title+'</a></td>';
		table += '<td>'+this.readCnt+'</td></tr>';
		});
		table += '<tr><td colspan="5">';
		table += '<div>';
		table += '<nav><ul  class="pagination">';
		table += '</ul></nav></div></td></tr>';
		table +='</table>';
		$('#boardDiv').html(table);
		/* $('#detail').click(function() {
			meajax.detail();
		}); */
}
meajax.detail =function(){
 alert('자세한 사항은 게시판 공지사항을 통해서 확인하시기 바랍니다.');	
}
meajax.loginBtn = function() {
	$('#loginform1').submit(function() {
		event.preventDefault();   
		var $form =$('#loginform1');
		var $data = $form.serialize();
		var $url =  $form.attr('action');
		  $.ajax({
				url: $url, 
				type : 'GET', 
				data : $data, 
				dataType : 'json',
				contentType : 'application/json', 
				success : function(data) {
					if (data.id == "idNull") {
						meajax.nullId();
					}else if(data.pass == "passFail"){
						meajax.loginFailPass();
					}else{
						meajax.loginDone(data);
					}
				},
				error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
			    }
		  });
		});	
}
	
 meajax.loginDone = function(data) {
	 alert(data.id +"님! 환영합니다.");
	 location.href="${root}/memberhome"	;

    
} 
 
 meajax.nullId = function() {
		alert("없는 아이디입니다. 홈페이지로 이동합니다.");
		location.href="${root}/home" ;
		
}
 
meajax.loginFailPass = function() {
		alert ("비밀번화가 틀렸습니다.재입력하세요");
		location.href="${root}/home" ;
}


meajax.moveAgreeBtn = function() {
			location.href="${root}/member/moveAgree";		
	}
 
 
meajax.searchIdBtn= function() {
	 $('#mainbox').empty(); 
	    var table ='<form id="searchIdByName" name="searchIdByName" action="${root}/member/searchByName" >';	
	    table +='<table class="tableClass"><tr class="trClass">';
	    table +='<td class="tdClassRow" colspan="2"><span>';
	    table +='<strong style="text-align: center; font-size: 20px;">';
	    table +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	    table +='아이디찾기 창</strong></span></td></tr>';
	    table +='<tr class="trClass"><td class="tdClassTitle">필드</td>';
	    table +='<td class="tdClassTitle">입력값</td></tr><tr class="trClass">';
	    table +='<td class="tdClassRow" >회원님의 이름 ?</td><td class="tdClassRow">';
	    table +='<input type="text" id="inputNname" name="inputName" style="width: 400px;" required="required" autofocus ></td>';
	    table +='</tr><tr class="trClass"><td class="tdClassRow" >회원님의 휴대폰번호 ?</td><td class="tdClassRow">';
	    table +='<input type="text" id="inputCellPhone" name="inputCellPhone" style="width: 400px;" required="required" autofocus></td>';
	    table +='</tr><tr class="trClass" ><td class="tdClassRow" colspan="2"><span> ';
	    table +='<input type="submit" value="아이디찾기" id="searchByNameBtn" style="width: 40%;"> ';
	    table +='<input type="reset" value="초기화" style="width: 40%;"> <br />';
	    table +='</span></td></tr></table>';   
	    $('#mainbox').html(table);
	    meajax.searchByNameBtn();
}

meajax.searchByNameBtn = function() {
	 $('#searchByNameBtn').click(function() {
		 if(($('#inputNname').val().trim() == "")){
				alert('해당칸을 작성하세요');
				$('#inputNname').focus();	
				return false ;
			}else if($('#inputCellPhone').val().trim() == ""){
				alert('해당칸을 작성하세요');
				$('#inputCellPhone').focus();	
				return false ;
			}else{
				 $('#searchIdByName').submit(function() {
					event.preventDefault(); 
					var $form = $('#searchIdByName');
					var $data = $form.serialize();
					var $url = $form.attr('action');
					$.ajax({
						url : $url,
						type : 'GET',
						data : $data, 
						dataType : 'json',
						contentType : 'application/json', 
						success: function(data) {
						meajax.searchByNameDone(data); 
						},
						error : function(xhr, status, msg) {
						alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
						}
				     });	  
		 	});  				
		}
	});
				
}


meajax.searchByNameDone = function(data) {
	alert("찾기 결과가 완료됨");
	$('.templateMain').empty();
   var table ='<form id="searchIdView" name="searchIdView" >';	
   table +='<table class="trClass"><tr class="trClass">';
   table +='<td class="tdClassRow" colspan="2"><span>';
   table +='<strong style="text-align: center; font-size: 20px">';
   table +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
   table +='아이디찾기 결과</strong></span></td></tr>';
   table +='<tr class="trClass"><td class="tdClassTitle">필드</td>';
   table +='<td class="tdClassTitle">검색값</td></tr><tr class="trClass">';
   table +='<td class="tdClassRow">회원님의 아이디</td><td class="tdClassRow">';
   table +='<strong>'+ data.id+'</strong></td>';
   table +='<tr class="trClass"><td class="tdClassRow" colspan="2"><span> ';
   table +='<input type="button" value="로그인으로 가기" id="moveToLogin" style="width: 40%"> ';
   table +='</span></td></tr></table>';
   $('.templateMain').html(table);   
   meajax.moveToHome();
   
}
meajax.moveToHome = function() {
	 $('#moveToLogin').click(function() {
		 location.href="${root}/home";
	});			 
}

/* 완료 */

meajax.searchPassBtn = function() {
	 $('.templateMain').empty(); 
	    var table ='<form id="searchPassById" name="searchPassById" >';	
	    table +='<table class="tableClass"><tr class="trClass">';
	    table +='<td class="tdClassRow" colspan="2"><span>';
	    table +='<strong style="text-align: center; font-size: 20px;">';
	    table +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	    table +='아이디찾기 창</strong></span></td></tr>';
	    table +='<tr class="trClass"><td class="tdClassTitle">필드</td>';
	    table +='<td class="tdClassTitle">입력값</td></tr><tr class="trClass">';
	    table +='<td class="tdClassRow" >회원님의 Id ?</td><td class="tdClassRow">';
	    table +='<input type="text" id="inputId" name="inputId" style="width: 400px;" required="required" autofocus ></td>';
	    table +='</tr><tr class="trClass"><td class="tdClassRow" >회원님의 휴대폰번호 ?</td><td class="tdClassRow">';
	    table +='<input type="text" id="inputCellPhone" name="inputCellPhone" style="width: 400px;" required="required" autofocus ></td>';
	    table +='</tr><tr class="trClass" ><td class="tdClassRow" colspan="2"><span> ';
	    table +='<input type="button" value="패스워드 찾기" id="searchPassBtn" style="width: 40%;"> ';
	    table +='<input type="reset" value="초기화" style="width: 40%;"> <br />';
	    table +='</span></td></tr></table>';   
	    $('.templateMain').html(table);
	    
	    $(function() { 
	   	 $('#searchPassBtn').click(function(){meajax.searchPass();});	    
	   	});
}

	    meajax.searchPass = function() {
	        if($('#inputId').val().trim() == ""){
	    		alert("이름을 입력해주세요."); 
	    		$('#inputId').focus();	
	    		return false ;
	    	}else if($('#inputCellPhone').val().trim() == ""){
	    	  alert("핸드폰 번호를 입력하세요"); 
	    		$('#inputCellPhone').focus();	
	    		return false ;
	    	}else{
	    		alert("제출전까지 옴");
	    		var $form =$('#searchPassById');
	    		var $data = $form.serialize();
	    		var $url =  $form.attr('action');
	    		   $.ajax({
	    				url: '${root}/member/searchById', 
	    				type : 'GET', 
	    				data : $data, 
	    				dataType : 'json',
	    				contentType : 'application/json', 
	    				success : function(data) {					
	    						alert("찾기 성공");
	    						meajax.searchPassDone(data);
	    				},
	    				error : function(xhr, status, msg) {
	    				alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
	    			    }
	    		  });	
	    	  }	
		}
	    
 meajax.searchPassDone = function(data) {
	  $('.templateMain').empty();
	    var table ='<form id="searchPassView" name="searchPassView" >';	
	    table +='<table class="trClass"><tr class="trClass">';
	    table +='<td class="tdClassRow" colspan="2"><span>';
	    table +='<strong style="text-align: center; font-size: 20px">';
	    table +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	    table +='패스워드찾기 결과</strong></span></td></tr>';
	    table +='<tr class="trClass"><td class="tdClassTitle">필드</td>';
	    table +='<td class="tdClassTitle">검색값</td></tr><tr class="trClass">';
	    table +='<td class="tdClassRow">회원님의 패스워드</td><td class="tdClassRow">';
	    table +='<strong>'+ data.pass+'</strong></td>';
	    table +='<tr class="trClass"><td class="tdClassRow" colspan="2"><span> ';
	    table +='<input type="button" value="로그인으로 가기" id="moveToLogin" style="width: 40%"> ';
	    table +='</span></td></tr></table>';
	    $('.templateMain').html(table); 
	    $('#moveToLogin').click(function(){meajax.moveToHome();});		    		 
}

</script> 
