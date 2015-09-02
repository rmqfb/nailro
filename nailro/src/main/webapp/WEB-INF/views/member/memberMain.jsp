<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="width: 100%;">  <!-- 멤버의   body전체  -->

<!-- 멤버의 메인콘텐츠  -->
<div id="memberbox" >
    <form id ="agreePol" name="agreePol" >
        <table class = "tableClass1">
            <tr><td width="100%" height="63px"><b>회원가입</b></td></tr>
            <tr><td width="100%" height="50%" align="center"><hr>
             <br><p align="left">
            <span style="padding-left: 160px"> <b>네일로 이용약관 </b></span>
             </p> <br>                  
<textarea rows="20" cols="150">                      
<!--  도시철고공사 이용약관  참고    -->                   
 이용약관
<!--  도시철고공사 이용약관  참고    -->    
</textarea> <br> 

<input type="checkbox" name="checkbox" id="checkbox" size="40px;"> 
  개인정보 수집 및 이용 약관에 동의합니다.
 </td>
 </tr>
            
<tr>
  <td align="center" valign="top"> <br /> 
  <input type="button" id="nextBtn" value="다음단계" style="size: 40%"/>
  <input type="button"  id="nochk" value="아니요, 동의하지 않습니다." style="size: 40%" />
  </td>
  </tr>
            
	</table>        
  </form>
  
 </div>  <!-- memberbox div 종료 -->
</div>  <!-- 멤버의   body전체 end  -->

<script type="text/javascript">

 $(function() {
	$('#nextBtn').click(function(){meajax4.nextBtn();});
	$('#nochk').click(function(){meajax4.nochk();}); 
	
	});
	
 meajax4 = {}
 
 meajax4.nochk =  function() {
		alert('이용약관에 동의해야만 회원가입하실 수 있습니다.'); 
		return false;
}
 
meajax4.nextBtn = function(){
    if(($('#checkbox').is(':checked'))){	
			  meajax4.moveToJoinForm();	
	}else{
			alert('이용약관에 동의하지 않으셨습니다. 이용약관에 체크해야 합니다.'); 
			$('#checkbox').focus();	
			return false;
		  }		
  } 


meajax4.moveToJoinForm = function() {
    $('#memberbox').empty();
    $('#memberbox').append('<form id ="joinSubmit" name="joinSubmit" action ="${root}/member/meJoin"><br /><br /> ');	
    var table ='<table class="tableClass2"><tr class="trClass">';
    table +='<td class="tdClassRow" colspan="2">회원가입(*는 필수값)</tr>	';
    table +='<tr class="trClass"><td class="tdClassTitle">필드</td>';
    table +='<td class="tdClassTitle">입력값</td></tr>	';
    table +='<tr class="trClass"><td class="tdClassRow">회원 아이디(*)</td>';
    table +='<td class="tdClassRow"><input type="text" id="id" name="id" ';
    table +='style="width: 350px" placeholder="자동 생성예정(비입력),숫자와 문자만" autofocus required="required">';
    table +='<input type="button" id="idchk" name="idchk" value="중복확인" autofocus required="required"><br></td></tr>'
    table +='<tr class="trClass"><td class="tdClassRow">회원 이름(*)</td><td class="tdClassRow">';
    table +='<input type="text" id="name" name="name" style="width: 350px" placeholder="이름입력" autofocus ';
    table +='required="required"></td></tr>';
    table +='<tr class="trClass"><td class="tdClassRow">회원패스워드(*)</td><td class="tdClassRow">';
    table +='<input type="password" id="pass"';
    table +='name="pass" style="width: 350px" placeholder="패스워드 입력" autofocus required="required"></td></tr>';
    table +='<tr class="trClass">';
    table +='<td class="tdClassRow">회원패스워드 확인(*)</td>';
    table +='<td class="tdClassRow">';
    table +='<input type="password" id="repass"';
    table +='name="repass" style="width: 350px" placeholder="패스워드 재입력" autofocus required="required" ></td></tr>				';
    table +='<tr class="trClass"><td class="tdClassRow">회원 나이(*)</td><td class="tdClassRow">';
    table +='<input type="number" numberonly="true" min="1" max="999" id="age" name="age"';
    table +='style="width: 350px" placeholder="숫자만 입력하세요" autofocus required="required"></td></tr>';
    table +='<tr class="trClass"><td class="tdClassRow">회원 핸드폰번호(*)</td>';
    table +='<td class="tdClassRow"><input type="text" id="cellPhone"';
    table +='name="cellPhone" style="width: 350px" placeholder="전화번호" autofocus required="required"></td></tr>';
    table +='<tr class="trClass"><td class="tdClassRow">회원 일반 전화번호</td>';
    table +='<td class="tdClassRow"><input type="text" id="telNo"name="telNo" style="width: 350px"></td></tr>';
    table +='<tr class="trClass"><td class="tdClassRow">회원 성별(*)</td><td class="tdClassRow">';
    table +='<input type="radio" id="male" name="gender" value="1" autofocus required="required"/>남';
    table +='<input type="radio" id="female" name="gender" value="2" autofocus required="required"/>여</tr>';
    table +='<tr class="trClass"><td class="tdClassRow">회원 이메일</td><td class="tdClassRow">';
    table +='<input type="text" id="email1" name="email1" placeholder="email" /><select id="email2" name="email2" >';
    table +='<option value="@hanmail.net">@daum.net</option>';
    table +='<option value="@gmail.com">@gmail.com</option>';
    table +='<option value="@hanmail.net">@hanmail.net</option>';
    table +='<option value="@hotmail.com">@hotmail.com</option>';
    table +='<option value="@hanmail.net">@msn.com</option>';
    table +='<option value="@nate.com">@nate.com</option>';
    table +='<option value="@naver.com">@naver.com</option>';
    table +='<option value="@yahoo.co.kr">@yahoo.co.kr</option>';
    table +='<option value="" >직접입력</option></select ></td></tr>	';
    table +='<tr class="trClass"><td class="tdClassRow">회원 Merit(장애우,노약자 등))</td>';
    table +='<td class="tdClassRow"><input type="text" id="merit" name="merit" style="width: 350px"></td></tr>	';
    table +='<tr class="trClass"><td class="tdClassRow">회원 주소</td>';
    table +='<td class="tdClassRow"><input type="text" id="address" name="address" style="width: 350px" placeholder="전화번호" `x';
    table +='autofocus></td></tr><tr class="trClass"><td class="tdClassRow" colspan="2">';
    table +='<span><input type ="submit" id="meJoinBtn" value="회원 가입하기"/></span>&nbsp;&nbsp;';
    table +='<span><input type="reset" value ="재입력" size="25%;"/></span> </td></tr>';
    table +='</table>';
    $('#joinSubmit').html(table);
    $('#meJoinBtn').click(function(){meajax4.meJoin();});
    $('#idchk').click(function(){meajax4.idchk($('#id').val());});

 }
 
  
  
meajax4.meJoin = function() {
	  $('#joinSubmit').submit(function() { 
			 	event.preventDefault();  
				var $form =$('#joinSubmit');
				var $data = $form.serialize();
				var $url =  $form.attr('action');
				  $.ajax({
						url: $url, 
						type : 'GET', 
						data : $data, 
						dataType : 'json',
						contentType : 'application/json', 
						success: function(data) {
							if (data =="joinOkId") {
								 alert("회원가입을 축하합니다. 다시 로그인 해주세요");	
								 meajax4.joinDone(data); 
							}else if(data.id =="joinFailId") {
								 alert("이미 있는 아이디입니다. 다시 가입해주세요");
								 location.href="${root}/home" ;
							}else{
								alert("내부 서부문제 발생.! 관리자 문의 바랍니다.");
								location.href="${root}/home" ;
							}					 
						},
						error : function(xhr, status, msg) {
							alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
						}		
				  });
				}); 

	}
meajax4.joinDone = function() {
	location.href="${root}/home" ;
}
meajax4.idchk = function() {
	var inputId = $('#id').val();
	 $.getJSON('${root}/member/idChek/'+inputId ,function(data){
		 if (data == 1) {
				alert("사용불가능한 아이디 입니다.");
				$('#id').val("");
			}else if(data == 0 ){
			  alert("사용가능합니다.");
			}else{
				alert("내부 시스템 오류입니다. 관리자에게 문의하세요.");
			}
	
	   }); 
}
</script> 


	

