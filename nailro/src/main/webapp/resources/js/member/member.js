/**
 *   회원가입 자바 스크립트
 */
 var member={
		 
		/* 회원가입 버튼 눌렀을 때 컨트롤러 이동*/
		 moveAgree : function(path) {
				location.href = path+'/moveAgree.nr';
		},
		  loginBtn : function() {
		         if($('#id').val().trim() == "") {
		            alert('아이디를 입력해주세요'); 
		            $('#id').focus();   
		             return false;
		         }else if($('#pass').val().trim() == ""){
		            alert('패스워드를 입력해주세요'); 
		            $('#pass').focus();   
		             return false;   
		         } else {
		         $('#loginform1').attr('action','login.nr').attr('method','post').submit();
		         }
		         
		      },
		passNotSame : function() {
			alert("비밀번호가 다릅니다.");
		},

		 nextBtn : function(){
			if(($('#checkbox').is(':checked'))){	
				$('#agreePol').attr('action','agreePol.nr').attr('method','post').submit();
			}else{
				alert('이용약관에 동의하지 않으셨습니다. 이용약관에 체크해야 합니다.'); 
			    $('#checkbox').focus();	
			    return false;
				
			}
				
		
	},
	
		nochk : function() {
		alert('이용약관에 동의해야만 회원가입하실 수 있습니다.'); 
		return false;
	},

	
	meJoin : function() {
		
          alert('회원가입을 축하드립니다.!!') ; 
		
		
	},
		
	mesearchId : function(url) {
	    window.open(
	                    url,
	                    "searchId",
	                    "scrollbars,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=600,height=500,top=200,left=400");
	 
	},
	
	mesearchPass : function(url) {
	    window.open(
	                    url,
	                    "searchPass",
	                    "scrollbars,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=600,height=500,top=200,left=400");
	},
	
	melogin : function() {	 
	    document.frmLogin.submit();
	},

	logOut : function() {
		$('#myPage').attr('action','logOut.nr').attr('method','post').submit();

	},
	
	
	/*myPage에서 회원탈퇴 버튼 클릭시 -> 해당 콘트롤로 이동 -> */
	meLeave : function() {
		alert("회원탈퇴창으로 이동합니다.");
		$('#myPage').attr('action','meLeave.nr').attr('method','get').submit();
	},
	

	
	/*회원탈퇴페이지에서 leaveBtn클릭시 -> 콘트롤로 이동 -> db delete */
	leaveBtn : function() {
		if(!($('#leavechk').is(':checked'))){
			alert('체크라인에 체크하세요');
			$('#leavechk').focus();	
			return false ;
		}else if($('#pass').val().trim() == ""){
			alert("비밀번호를 입력해주세요."); 
			$('#pass').focus();	
		}else if($('#leaveWhy').val().trim() == ""){
			alert("탈퇴 사유를 입력해주세요"); 
			$('#leaveWhy').focus();	
		}else{
			$('#meDelete').attr('action','meDelete.nr').attr('method','get').submit();
		}
	},
	
	/*myPage에서 회원정보수정 버튼 클릭시 -> 해당 콘트롤로 이동 */
	meUpdate : function() {
		alert("meUpdate 전");
		$('#myPage').attr('action','meUpdate.nr').attr('method','get').submit();
	},
	
	
	meReviseBtn : function() {
		
		if($('#oldPass').val().trim() == ""){
			$('#oldPass').focus();	
			alert('패스워드를 입력해주세요');
			return false ;
		}else if($('#newPass').val()!= $('#reNewPass').val()){
			$('#newPass').focus();
			$('#reNewPass').focus();
			alert('재입력한 패스워드가 다릅니다. 다시 확인해주세요');
			return false ;
		}else if($('#meSsnPass').val() == $('#newPass').val()){
			$('#newPass').focus();	
			alert('기존 패스워드와 같습니다. 다시 입력하세요');	
			return false;
		}else if($('#oldPass').val() !=$('#meSsnPass').val()){
			alert('패스워드가 다릅니다. 확인 바랍니다.');	
			return false;	
	
		}else{
			alert('btn체크 완료');
			$('#meReviseForm').attr('action','meRevise.nr').attr('method','get').submit();	
		}


	
		
	}
	
	
	
	
	
	
	
	
	
	
	/*회원탈퇴 시 유효성 검증 - 패스워드 , 사유 기입 란 필 입력*/
	
	
	
 }      /* var member 종료*/
 
