<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="${context}/css/common.css" />
 <div align="center">
 	<h2><b>숙소 정보 입력</b></h2>
	<form name="mtUpInfo" action="${root}/event/mtRevision" method="post">
		<table class="tableTag">
			<tr>
				<th> <label for="mtCode">숙소 코드</label> </th>
				<td><input type="text" id="mtCode" name="mtCode" autocomplete="on" required value="${mt.mtCode}" readonly/></td>
			</tr>
			<tr>
				<th> <label for="mtName">숙소 이름 </label></th>
				<td><input type="text" id="mtName" name="mtName" value="${mt.mtName}"/></td>
			</tr>
			<tr>
				<th><label for="mtAddress">숙소 주소</label></th>
				<td><input type="text" id="mtAddress" size="100" name="mtAddress" value="${mt.mtAddress}"/></td>
			</tr>
			<tr>
				<th><label for="mtPhone"> 숙소 연락처 </label></th>
				<td>
					<input type="text" id="mtPhone" name="mtPhone" value="${mt.mtPhone}" />
			</td>
			</tr>
			<tr>
				<th><label for="mtInfo"> 숙소 객실정보 </label></th>
				<td><input type="text" id="mtInfo" name="mtInfo" value="${mt.mtInfo}"/></td>
			</tr>		
			<tr>
				<th> <label for="mtAbout">숙소 세부사항</label> </th>
				<td><textarea id="mtAbout" name="mtAbout" rows="15" cols="100">${mt.mtAbout}</textarea></td>
			</tr>
			<tr>
				<th> <label for="mtPrice">숙소 가격 </label></th>
				<td><input type="text" id="mtPrice" name="mtPrice" value="${mt.mtPrice}"/>원</td>
			</tr>
		</table>
	</form>
 </div>
 <p></p>
 <div align="center">
 	<button id="update">확인</button>
 	<button id="cancel">취소</button>
 </div>
</body>
	<script src="${context}/js/event/event.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#update').click(function() {
			mtUpdate.update();
		});
		
		$('#cancel').click(function() {
			mtUpdate.cancel('${root}/event/mtInfo');
		});
		
	});

	</script>
