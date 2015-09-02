/**
 * 
 */

var pkgAdmin = {
	upLode : function(path) {
		location.href=path;
	}
   /*del : function(path,code){
		alert("정말로 삭제할래요?");
		location.href=path+'/GoodsDelete.nr?code='+code;
	}  */ //문제가 많아서 주석 1
}

var pkgInsertForm = {
	add : function() {
		var num1 =$('#trainPrice').val();
		var num2 =$('#mtPrice').val();
		/*console.log(num1);*/
		var result = Number(num1) + Number(num2);
		$('#result')
		.val(result);
	//	.html('<div id="result" ><input type="text" id="pkgPrice" value="'+result+'" /></div>');
		/*document.salerFrm.submit();*/
		/*var $price = $('#pkgPrice').val();*/		
	},
	insert : function() {
		alert("DB에 저장완료");
		document.salerForm.submit();
	},
	
	cancel : function(path) {
		location.href=path;
	},
	mtInfo : function(path) {/*숙소 목록 */
		open(path,'숙소정보', 'width=1500,height=650');
	}
}

var pkgHome= {
	mouse : function() {
	 },
	  
	 img : function() {
		$('#img').hover(function() {
			var imgs = $(this).attr("src"); //어트리뷰트 값으로 초기화 
			$(this).after('<img src='+imgs+'width=200>');
		});
	 },
}
/*	  $(function(){

		  $(".vi").hover(function(){
		        var imgs = $(this).attr("src");
		        $(this).after( "<div class='vi2'><img src='"+imgs+"' width='200' /></div>" );
		   },function(){
		        $(".vi2").remove();
		   });

		  });*/
var mtView = {
	mtInsert : function(path) {
			console.log(path);
			location.href = path;
		/*	location.assign(path+'/mtInputForm.nr');*/
			
			// 숙소 정보 입력 폼으로 보낸다.
		},
	mtUpdate : function(path) {
			var key = $("input[name=key]:checked").val();
			console.log(key);
			if(key == null){
				alert("수정 정보를 선택하세요.");
			}else{
				path += "/"+key;
				location.href=path;
			}
		},
	mtDelete : function(path) {
			var key = $("input[name=key]:checked").val();
			console.log(key);
			if (key == null) {
				alert("삭제 정보를 선택하세요.");
			} else {
				var msg = confirm('숙소정보를 삭제하시겠습니까?');
				if(msg){
					path += "/"+key;
					location.href = path;
				}
			}
		},
	/*mtKey : function(path) {
		var key = $('input[name=key]:checked').val();
		path += "/"+key;
		location.href = path;
		},*/
	mtChoose : function() {
		var key = $("input[name=key]:checked").val();
		if (key != null) {
			var value = document.getElementById(key).value;				
			var mtCode = document.getElementById("mtCode"+value).value;
			var mtName = document.getElementById("mtName"+value).value;
			var mtAddress = document.getElementById("mtAddress"+value).value;
			var mtPhone = document.getElementById("mtPhone"+value).value;
			var mtInfo = document.getElementById("mtInfo"+value).value;
			var mtAbout = document.getElementById("mtAbout"+value).value;
			var mtPrice = document.getElementById("mtPrice"+value).value;
			opener.document.pkgForm.mtCode.value =mtCode;
			opener.document.pkgForm.pkgMTName.value =mtName;
			opener.document.pkgForm.pkgMTAddress.value =mtAddress;
			opener.document.pkgForm.pkgMTTel.value =mtPhone;
			opener.document.pkgForm.pkgMTInfo.value =mtInfo;
			opener.document.pkgForm.pkgMTAbout.value =mtAbout;
			opener.document.pkgForm.mtPrice.value =mtPrice;
			window.close();
		}else {
			alert("숙소 정보를 선택하세요.");
		}
	},
}
var mtInputForm = {
		mtInsert : function() {
			document.mtInsert.submit();
			alert("숙소정보입력성공");
		},
		cancel : function(path) {
			location.href= path;
		},
}
var mtUpdate = {
		update : function() {
			alert("수정완료")
			document.mtUpInfo.submit();
	},
		cancel : function(path){
			location.href = path;
	},
}
	
	
	