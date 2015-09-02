<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content">
		<!-- 역정보 -->
		<form action="${root}/train/trainUpdateForm" method="post">
			<h2 class="txt-c h2Style">차량정보</h2>
			<table class="stationTable w-40p txt-c">
				<tr>
					<th>차량코드</th>
					<td><input id="trainNo" name="trainNo" type="text" value="${trainCode}" required autofocus readonly="readonly" /></td>
				</tr>
				<tr>
					<th>차량명</th>
					<td><input id="trainName" name="trainName" type="text"  value="${trainName}" required></td>
				</tr> 
				<tr>
					<th>제조사</th>
					<td>
						<select name="makerSelect" id="makerSelect">
							<c:forEach var="makerList" items="${makerList}" varStatus="i">
								<option value="${makerList.makerCode}">${makerList.makerName}</option>
							</c:forEach>
						</select>	
					</td>
				</tr>
				<tr>
					<th>승차가능인원</th>
					<td><input
						id="seatCount" name="seatCount" type="number" min="20" max="72" 
						value="${seatCount}"
						required></td>
				</tr>
				<tr>
				<td class="txt-c" colspan="2"><input type="submit" class="adminBtn" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" class="adminBtn" value="취소" /></form>
						&nbsp;&nbsp;
						<input type="button" id="btnDel" class="adminBtn" value="삭제" /></td>
			</tr>
		</table>
</div>

<script src="${context}/js/train/train.js"></script>
<script type="text/javascript">
	$('#btnDel').click(function() {
		var trainCode = $('#trainNo').val();
		train.trainDel('${root}', trainCode);
	});
</script> 