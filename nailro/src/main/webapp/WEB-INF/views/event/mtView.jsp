<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${context}/css/common.css" />
	<div align="center" style="margin: 50px 0 50px 0">
		<button id="mtInsert">숙소 추가</button>
		<button id="mtUpdate">숙소 수정</button>
		<button id="mtDelete">숙소 삭제</button>
		<button id="mtChoose">숙소 선택</button>
	</div>	
	<div style="margin: 50px 0 50px 0"align="center">
		<h2>숙소 목록</h2>
		<table class="tableTag txt-c">
			<tr>
				<th>선택</th>
				<th>숙소 코드</th>
				<th>숙소 이름</th>
				<th>숙소 주소</th>
				<th>숙소 연락처</th>
				<th>숙소 객실정보</th>
				<th>숙소 세부사항</th>
				<th>숙소 가격</th>
			</tr>
				<c:forEach var="mt" items="${mtList}" varStatus="status">
			<tr>
				<td><input type="radio"  name="key"  value="${mt.mtCode}"/>
						<input type="hidden" id="${mt.mtCode}" value="${status.index+1}"/>
				</td>
				<td>${mt.mtCode}<input type="hidden" id="mtCode${status.index+1}" value="${mt.mtCode}"/></td>
				<td>${mt.mtName}<input type="hidden" id="mtName${status.index+1}" value="${mt.mtName}"/></td>
				<td>${mt.mtAddress}<input type="hidden" id="mtAddress${status.index+1}" value="${mt.mtAddress}"/></td>
				<td>${mt.mtPhone}<input type="hidden" id="mtPhone${status.index+1}" value="${mt.mtPhone}"/></td>
				<td>${mt.mtInfo}<input type="hidden" id="mtInfo${status.index+1}" value="${mt.mtInfo}"/></td>
				<td>${mt.mtAbout}<input type="hidden" id="mtAbout${status.index+1}" value="${mt.mtAbout}"/></td>
				<td>${mt.mtPrice}<input type="hidden" id="mtPrice${status.index+1}" value="${mt.mtPrice}"/></td>
			</tr>
				</c:forEach> 
		</table>
	</div>	
</body>

<script src="${context}/js/event/event.js"></script>
<script type="text/javascript">
		$('input[type=radio]').click(function() {
			var key = $('input[name=key]:checked').val();
			var value = document.getElementById(key).value;
			}); 
		$('#mtInsert').click(function() {
			mtView.mtInsert('${root}/event/mtInputForm');
		});
		$('#mtUpdate').click(function() {   
			mtView.mtUpdate('${root}/event/mtRevisionForm');
		});
		$('#mtDelete').click(function() {
			mtView.mtDelete('${root}/event/mtDelete');
		});
		$('#mtChoose').click(function() {
			mtView.mtChoose();
	});
</script>
