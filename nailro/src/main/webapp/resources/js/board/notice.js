/**
 * 
 */
var notice= {
	deletion : function(path,brdNo) {		
		if(!confirm('삭제 하시겠습니까?')){
			return// 다시 원래페이지로 돌아가기
		}else{
		location.href=path+'/noticedelet.nr?brdNo='+brdNo;
		}
	},
	notify : function(path,brdNo){
		if(!confirm('수정하시겠습니까?')){
			return
		}else{
		alert(brdNo);
		location.href=path+'/notifyform.nr?brdNo='+brdNo;
		}
	},
	notice : function(path) {
		location.href=path+'/notice.nr';
	},
	writing : function(path) {
		location.href=path+'/writingForm.nr';
	},
	notifyResister : function(path,title,content,brdNo) {		
		
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}
		else if (content == "") {
			alert('내용을 입력해주세요');
			return false;
		}
		if (!confirm('수정하시겠습니까?')) {
			return;
		} else {
			location.href=path+'/notify.nr?title='+title+'&content='+content+'&brdNo='+brdNo;
		}	
	},
	resister : function(path,title,content) {		
		
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}
		else if (content == "") {
			alert('내용을 입력해주세요');
			return false;
		}
		if (!confirm('등록하시겠습니까?')) {
			return;
		} else {
			location.href=path+'/writing.nr?title='+title+'&content='+content;	
		}	
	},
	
	cancel : function(path) {
		location.href=path+'/notice.nr';
	},
	serch : function() {
		
	}
	
}