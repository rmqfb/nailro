<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="header2">
  <section>
   <h1>
   <a href="#" id="home">
      <img src="${context}/image/home/lets_logo.gif"/>
       <input type="hidden" id="userid" value="${user.id}"/></a>
   </h1>
   <span id="top-menu">
   <a href="#" id="home">HOME |</a>
    <c:choose>
  <c:when test="${empty user.id}">
  <a href="#" onclick="loginForm()" class="loginOpen">로그인 |</a>
  </c:when>
  <c:otherwise>
  <a href="#" onclick="logoutForm()">로그아웃|</a>
  </c:otherwise>
</c:choose>
   <a href="#" class="unactive">코레일멤버십 |</a>
   <a href="#" class="unactive">승차권제휴할인 |</a>
   <a href="#" class="unactive">장바구니 |</a>
   <a href="#" id="move-mypage" onclick="move-mypage">마이페이지 |</a>
   <a href="#" class="unactive">고객센터 |</a>
   <a href="#" id="admin-home">관리자 |<input type="hidden" id="adminid" value="${user.id}" /></a>
   <a href="#google-map" class="popupOpen">찾아오시는길 ★</a>
   </span>
	<nav class="nav">
		<ul>
			<li><a href="#" class="item">승차권</a>
				<ul class="sub">
					<li><a href="#" id="erp-reserve" class="item txt-darkgray">예매하기</a></li>
					<li><a href="#" id="erp-reserveCancel" class="item">예매취소</a></li>
				</ul></li>
			<li><a href="#" class="item">패키지여행</a>
				<ul class="sub">
					<li><a href="#" id="pkg-pkgHome" class="item">예매하기</a></li>
					<li><a href="#" id="pkg-reserveView" class="item">예매취소</a></li>
				</ul></li>
			<li><a href="#" class="item">자유여행</a>
				<ul class="sub">
					<li><a href="#" id="erp-reverse3" class="item">예매하기</a></li>
					<li><a href="#" id="erp-reserveCancel" class="item">예매취소</a></li>
				</ul>
			</li>
			<li><a href="#" class="item">게시판</a>
				<ul class="sub">
					<li><a href="#" id="bbs-review" class="item">리뷰</a></li>
					<li><a href="#" id="bbs-faq" class="item">자주묻는질문</a></li>
				</ul>
			</li>
			<li><a href="#" class="item" id="bbs-notice">공지사항</a></li>
			<li><a href="#" class="item" id="">만든사람들</a></li>
		</ul>
	</nav>
	<!-- /.navbar-collapse -->
</section><!-- /.container-fluid -->
</div>
<script type="text/javascript">
$(function(){
	$('#header2').find('a').css('color','white');
	$('#header2').find('h1').addClass('header-h1');
	$('#header2').find('span').addClass('header-span');
	$('#header2').find('section').addClass('header-section');
	gnb.tab();
	$(function() {
		$('.popupOpen').magnificPopup({
			type : 'inline',
			preloader : false,
			modal : true,
			closeContentPos : true,
			fixedContentPos: true,
	        alignTop: false, /* 최상단위치 */
			showCloseBtn: true
		});
		$(document).on('click','.popupClose',function(e){
			e.preventDefault();
			$.magnificPopup.close();
		});
});

});
var gnb={}
gnb.tab = function() {
   $('.nav li').on('mouseenter',function(){
	   gnb.reset();
	   $(this).addClass('on');
   }).on('mouseleave',function(){
	   $(this).removeClass('on');
   });
   $('.nav li a').focusin(function() {
	gnb.reset();
	$(this).parent('.nav li').addClass('on');
});
}
gnb.reset =function(){
	$('.nav li').removeClass('on, selected');
}
$('#top-menu').tooltip({
	items : 'a.unactive',
	content : '추가로 구현하겠습니다. !!',
	show : null,//show immediately
	open : function(event,ui) {
		if(typeof(event.originalEvent)==='undefined'){//==타입체크,
			return false;
		}
		var $id = $(ui.tooltip).attr('id');
		$('div.ui-tooltip').not('#'+$id).remove();
	},
	close : function(event,ui) {
		ui.tooltip.hover(function() {
			$(this).stop(true).fadeTo(400,1);
		}),
		function() {
			$(this).fadeOut('400',function(){
				$(this).remove();
			});
		}
	}
});
	$('#home').click(function() {
		if ($('#userid').val().length != 0) {
			location.href = "${root}/memberhome";
		} else {
			location.href = "${root}/home";
		}
	});
	logoutForm = function() {
	    alert(" 로그아웃  처리합니다. 첫 화면으로 이동합니다.");
	    location.href="${root}/member/logOut"; 
	}
	/*마이페이지*/
	$('#move-mypage').click(function() {
		if (($('#userid').val()).length != 0) {
			location.href = "${root}/member/moveMyPage";
		} else {
			alert("회원 전용입니다. 로그인 해주세요");
			location.href = "${root}/home";
		}
	});
	/*erp */
	$('#erp-reserve').click(function() {
		location.href = "${root}/erp/reserve";
	});
	$('#erp-reserveCancel').click(function() {
		if (($('#userid').val()).length != 0) {
			location.href = "${root}/erp/infoMain";
		} else {
			alert("회원 전용입니다. 로그인 해주세요");
			location.href = "${root}/home";
		}
		
	});
	/*event */
	$('#pkg-pkgHome').click(function() {
		location.href = "${root}/event/pkgHome";
	});
	$('#pkg-reserveView').click(function() {
		if (($('#userid').val()).length != 0) {
			location.href = "${root}/event/pkgReserveView";
		} else {
			alert("회원 전용입니다. 로그인 해주세요");
			location.href = "${root}/home";
		}
		
	});
	$('#pkg-pkgConfirm').click(function() {
		location.href = "${root}/event";
	});
	/*bbs*/
	$('#bbs-notice').click(function() {
			location.href = "${root}/board/notice";
	});
	$('#bbs-review').click(function() {
		location.href = "${root}/board/review";
    });
	$('#bbs-faq').click(function() {
		location.href = "${root}/board/faq";
    });
	$('#admin-home').click(function() {
		location.href ="${root}/adminForm";
	});

</script>