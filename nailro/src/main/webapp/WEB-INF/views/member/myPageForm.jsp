<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="myPage" >
	<form id="myPageForm" name="myPageForm" action ="${root}/member/myUpdate" >
		<br /><br /><br /><br /><br /><br />
			<table>
				<tr>
			<td colspan="2" >
			 <span><strong>마의페이지</strong></span></td>	
				</tr>

				<tr>
					<td>필드</td>
					<td>입력값</td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td>${user.id}</td>
				</tr>
				
				<tr >
					<td>이름</td>
					<td>${user.name}</td>
				</tr>
				
					<tr>
					<td>나이</td>
					<td>${user.age}</td>
				</tr>

				<tr>
					<td>성별</td>
					<td>${user.gender}</td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td>${user.cellPhone}</td>
				</tr>

				<tr>
					<td>일반 전화번호</td>
					<td>${user.telNo}</td>
				</tr>
				

				<tr>
					<td>회원 이메일</td>
					<td>${user.email}</td>
				</tr>
				
					<tr>
					<td>회원 Merit(장애우,노약자 등))</td>
					<td>${user.merit}</td>
				</tr>
				
				
				<tr>
					<td >회원 주소</td>
					<td>${user.address}</td>
				</tr>
				
				<tr>
					<td>가입일</td>
					<td>${user.joindate}</td>
				</tr>
				
				<tr >
					<td colspan="2">
					<input type="button" value="회원탈퇴버튼"  id="meLeaveBtn" onclick="return meajax3.meLeaveForm()" />
					<input type="button" value="회원정보수정버튼" id="meUpdateBtn" onclick="return meajax3.meUpdateBtn()" />
					</td>				
				</tr>
      <tr >
	 <td colspan="2">
	  </td>
	</tr>
 </table>
</form>	
</div>  
 <!-- myPage div 종료 -->


<script type="text/javascript">

meajax3 ={} 


meajax3.meLeaveBtn = function() {
	meajax3.meLeaveForm('${user}');
	}

meajax3.meLeaveForm = function() {
		    $('#myPage').empty(); 
		    var table ='<form id="meLeaveForm" name="meLeaveForm" action ="${root}/member/meDelete" > <br /><br />';	
		    table +='<br /><br /><br /><br /><br /><br />'; 
		    table +='<table class="tableClass">';
		    table +='<tr class="trClass"><td class="tdClassRow" colspan="2"><span>';
		    table +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 회원탈퇴하기</span></td></tr>';
		    table +='<tr class="trClass">'; 
		    table +='<td class="tdClassTitle" style="width: 350px">필드</td><td class="tdClassTitle">입력값</td>';
		    table +='</tr><tr class="trClass"><td class="tdClassRow">패스워드</td>';
		    table +='<td class="tdClassRow">';
		    table +='<input type="password" id="pass" name="pass" style="width: 350px" required autofocus></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">탈퇴사유</td>';
		    table +='<td class="tdClassRow">';
		    table +='<input type="text" id="leaveWhy" name="leaveWhy" style="width: 350px" required autofocus ></td></tr>';
		    table +='<tr class="trClass">';
		    table +='<td class="tdClassRow" colspan="2" style="text-decoration:underline;"><span>';
		    table +='<input type="checkbox" name="leavechk" id="leavechk" style="width: 15px; height: 15px" required autofocus>';
		    table +='모든 정보는 삭제됩니다.탈퇴(동의)하십니까 ?';
		    table +='</span></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow" colspan="2"><span>';
		    table +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		    table +='<input type ="submit" id ="deleteBtn" name="deleteBtn" value="탈퇴" style="width:18%">';
		    table +='<input type="reset" name ="초기화" value ="초기화" style="width:18%" />';  
		    table +='</span></td></tr></table>';  
	        $('#myPage').html(table);
	        meajax3.deleteBtn('${user}')  	
	}
	 
	 
meajax3.deleteBtn = function() {
		 $('#deleteBtn').click(function() {
			 if(!($('#leavechk').is(':checked'))){
					alert('체크라인에 체크하세요');
					$('#leavechk').focus();	
					return false ;
				}else if($('#pass').val().trim() == ""){
					alert("비밀번호를 입력해주세요."); 
					$('#pass').focus();	
					return false ;
				}else if($('#pass').val().trim() != '${user.pass}'){
					alert("비밀번호가 틀렸습니다. 다시 입력해주세요."); 
					$('#pass').focus();
					return false ;
				}else if($('#leaveWhy').val().trim() == ""){
					alert("탈퇴 사유를 입력해주세요"); 
					$('#leaveWhy').focus();	
					return false ;
				}else{
					 $('#meLeaveForm').submit(function() {
						event.preventDefault(); 
						var $form = $('#meLeaveForm');
						var $data = $form.serialize();
						var $url = $form.attr('action');
						$.ajax({
							url : $url,
							type : 'GET',
							data : $data, 
							dataType : 'json',
							contentType : 'application/json', 
							success: function(data) {
							meajax3.leaveDone(); 
							},
							error : function(xhr, status, msg) {
							alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
							}
					     });	  
			 	});  				
			}
		});
					
	}

meajax3.leaveDone = function() {
		alert('회원탈퇴가 완료되었습니다. 홈페이지로 이동합니다.');
		location.href="${root}/home" ;
	 }

meajax3.meUpdateBtn = function() {	
			 $.ajax({
				    url : '${root}/member/meUpdate',
					type : 'GET',
					dataType : 'json',
					contentType : 'application/json', 
					success: function(data) {
						meajax3.moveReviseForm(data);
					},
					error : function(xhr, status, msg) {
					alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
					}		 
			 });
	}
	 
meajax3.moveReviseForm = function(data) {
		 $('#myPage').empty(); 
		    var table ='<form id="meReviseForm" name="meReviseForm" action="${root}/member/meRevise" >';	
		    table +='<br /><br /><br /><br /><br /><br />';
		    table +='<table class="tableClass"><tr class="trClass">';
		    table +='<td class="tdClassRow" colspan="2" style="text-align: center; font-size:30px ">';
		    table +='<span><strong>회원정보 수정창</strong></span></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassTitle">필드</td><td class="tdClassTitle">입력값</td></tr>	';
		    table +='<tr class="trClass"><td class="tdClassRow">기존 패스워드(*)</td>';
		    table +='<td class="tdClassRow"><input type="password" id="oldPass" name="oldPass" style="width: 350px" autofocus required="required"></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">변경될 패스워드</td><td class="tdClassRow">';
		    table +='<input type="password" id="newPass" name="newPass" style="width: 350px" autofocus ></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">변경될 패스워드 재확인</td><td class="tdClassRow">';
		    table +='<input type="password" id="reNewPass" name="reNewPass" style="width: 350px"  autofocus ></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">핸드폰번호</td><td class="tdClassRow">';
		    table +='<input type="text" id="cellPhone" name="cellPhone" style="width: 350px" value="'+ data.cellPhone +'" autofocus></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">일반 전화번호</td><td class="tdClassRow">';
		    table +='<input type="text" id="telNo" name="telNo" style="width:  350px" value="'+ data.telNo+ '"></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">회원 이메일</td><td class="tdClassRow">';
		    table +='<input type="text" id="email1" name="email1" autofocus value="'+data.email+'" /> ';
		    table +='<select id="email2" name="email2" >';
		    table +='<option value="@hanmail.net">@daum.net</option>';
		    table +='<option value="@gmail.com">@gmail.com</option>';
		    table +='<option value="@hanmail.net">@hanmail.net</option>';
		    table +='<option value="@hotmail.com">@hotmail.com</option>';
		    table +='<option value="@hanmail.net">@msn.com</option>';
		    table +='<option value="@nate.com">@nate.com</option>';
		    table +='<option value="@naver.com">@naver.com</option>';
		    table +='<option value="@yahoo.co.kr">@yahoo.co.kr</option>';
		    table +='<option value="">직접입력</option></select></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">회원 Merit(장애우,노약자 등))</td>';
		    table +='<td class="tdClassRow">';
		    table +='<input type="text" id="merit" name="merit" style="width: 350px" value="'+data.merit+'"></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow">회원 주소</td><td class="tdClassRow">';
		    table +='<input type="text" id="address" name="address" style="width: 350px" value="'+data.address+'" autofocus ></td></tr>';
		    table +='<tr class="trClass"><td class="tdClassRow" colspan="2"><span> ';
		    table +='<input type ="submit" id="meReviseBtn" onclick="return meajax3.meReivseBtn()" name="meReviseBtn" value="정보수정" style="width: 40%">';
		    table +='<input type="reset" value="입력초기화" style="width: 40%"></span></td>';
		    table +='</tr></table>';
		    $('#myPage').html(table);
		    $('#meReviseBtn').click(function(){meajax3.meReivseBtn(data);}); 
}
	 
meajax3.meReivseBtn = function(data) {
			 if($('#oldPass').val().trim() == ""){
					$('#oldPass').focus()
					alert('패스워드를 입력해주세요');
					return false ;
				}else if($('#newPass').val()!= $('#reNewPass').val()){
					$('#newPass').focus();
					$('#reNewPass').focus();
					alert('재입력한 패스워드가 다릅니다. 다시 확인해주세요');
					return false ;
				}else if(data.pass == $('#newPass').val()){
					$('#newPass').focus();	
					alert('기존 패스워드와 같습니다. 다시 입력하세요');	
					return false;
				}else if($('#oldPass').val() != data.pass){
					alert('패스워드가 다릅니다. 확인 바랍니다.');	
					return false;	
				}else{
					$('#meReviseForm').submit(function() {
						event.preventDefault(); 
						var $form = $('#meReviseForm');
						var $data = $form.serialize();
						var $url = $form.attr('action');
						$.ajax({
							url : $url,
							type : 'GET',
							data : $data, 
							dataType : 'json',
							contentType : 'application/json', 
							success: function(data) {
								if (data.id =="updataFail") {
									alert("시스템 내부의 예상치 못한 오류로 업데이트실패");
									alert("홈페이지로 이동합니다.");
									location.href="${root}/home/template"	;
								} else {
									alert("업데이트 완료 !홈페이지로 이동합니다");
									location.href="${root}/memberhome"	;
		  						
								}
							},
							error : function(xhr, status, msg) {
							alert('[상세]에러발생 !! 상태 :'+status+',내용'+msg);
							}
					     });	  
			 	      });
				}		 
}

</script>
