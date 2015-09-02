/**
 * 
 */
var review= {
	deletion : function(path,brdNo) {		
		if(!confirm('삭제 하시겠습니까?')){
			return// 다시 원래페이지로 돌아가고
		}else{
		location.href=path+'/reviewdelet.nr?brdNo='+brdNo;
		}
	},
	notifybtn : function(path,brdNo){
		if(!confirm('수정하시겠습니까?')){
			return
		}else{
		
		location.href=path+'/reNotifyFrom.nr?brdNo='+brdNo;
		}
	},
	reviewbtn : function(path) {
		location.href=path+'/review.nr';
	},
	writingbtn : function(path) {
		location.href=path+'/reviewWtForm.nr';
	},
	reviewNotify : function(path,title,content,brdNo) {		
		
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
			location.href=path+'/reviewNotify.nr?title='+title+'&content='+content+'&brdNo='+brdNo;
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
			location.href=path+'/reviewWt.nr?title='+title+'&content='+content;
		}
	},
	cancelbtn : function(path) {
		location.href=path+'/review.nr';
	},
	serchbtn : function() {
		
	}
	
}