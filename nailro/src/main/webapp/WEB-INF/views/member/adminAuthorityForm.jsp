<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="adminMemberbox">

<form id="adminLogin" name="adminLogin" action="${root}/member/adminlogin">
    <table class="tableClass" >
	<tr class="trClass">
				<td class="tdClassRow" colspan="2">
                         관리자 로그인 창
				</tr>
     
			<tr class="trClass">
				<td class="tdClassTitle" >필드</td>
				<td class="tdClassTitle" >입력값</td>
			</tr>

			<tr class="trClass">
				<td class="tdClassRow">관리자아이디</td>
				<td class="tdClassRow"><input type="text" id="adminId" name="adminId" style="width: 350px" value=""></td>
			</tr>
			
			<tr class="trClass">
				<td class="tdClassRow">관리자  패스워드</td>
				<td class="tdClassRow"><input type="password" id="adminPass" name="adminPass" style="width: 350px" value=""></td>
			</tr>

			<tr class="trClass">
				<td class="tdClassRow" colspan="2"><span>
				<input type ="submit" id ="adminlogin" onclick="return  adminajax.adminlogin()"  value="관리자 로그인" autofocus="autofocus"  style="width: 40%">
				<input type="reset" value="입력 취소" style="width: 40%"></span></td>
			</tr>
			
	</table>	
</form>	

</div> <!--  amdinmemberBox종료 -->
<script type="text/javascript">
 $(function() {
	$('#adminlogin').click(function(){adminajax.adminlogin();});
}); 
 adminajax = {}
 adminajax.adminlogin = function() {
	  if($('#adminId').val().trim() == ""){
         alert('관리자 아이디를 입력해주세요'); 
         $('#adminId').focus();   
         return false;
      }else if($('#adminPass').val().trim() == ""){
         alert('관리자 패스워드를 입력해주세요'); 
        $('#adminPass').focus(); 
         return false;   
      }else if(!$('#adminId').val().match("admin")){
	    alert('관리자만 로그인 할수 있습니다 ! 홈페이지로 이동합니다!');
	    $('#adminId').focus();
	    return false;   
      }else{
    		    $('#adminLogin').submit(function(event) { 
    			 	event.preventDefault();  
    				var $form =$('#adminLogin');
    				var $data = $form.serialize();
    			 	var $url =  $form.attr('action'); 
    				  $.ajax({
    						url: $url, 
    						type : 'GET', 
    						data : $data, 
    						dataType : 'json',
    						contentType : 'application/json', 
    						success: function(data) {
    							if (data.id == 'adminIdNull'){
    								adminajax.adminNullId();
    							}else if(data.pass == 'adminPassFail'){
    								adminajax.adminFailPass();
    							}else{
    								alert(data.id +"님 , 환영합니다.");
    								location.href='${root}/member/adminMemberMain';
    							}	
    						},
    						error : function(xhr, status, msg) {
    							alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
    						}		
    				  });    				  
    				}); 	
            } 
 }
 
 adminajax.adminNullId = function() {
	alert("없는 아이디입니다. 홈페이지로 이동합니다.");
	location.href="${root}/home"	;
}
 
 adminajax.adminFailPass = function() {
	alert ("비밀번화가 틀렸습니다.홈페이지로 이동합니다.");
	location.href="${root}/home"	;
}
 
 adminajax.logOutAdminBtn = function() {
	 $('#logOutAdminBtn').click(function() {
		 alert("관리자 로그아웃합니다. 홈페이지로 이동합니다.");
		 location.href = "${root}/member/logOutAdmin";
	});	 
}
</script> 

