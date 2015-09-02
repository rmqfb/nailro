<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="content">
		<!-- 역정보 -->
		<form action="${root}/station/stationUpdateForm" method="post">
			<h2 class="txt-c h2Style">역정보</h2>
			<table class="stationTable">	
				<tr>
					<th>역코드</th>
					<td><input
						id="stationCode" name="stationCode" type="text" 
						value="${stationCode}"
						required readonly="readonly"></td>
				</tr> 
				<tr>
					<th>역명</th>
					<td> <input
						id="stationName" name="stationName" type="text" 
						value="${stationName}"
						required autofocus></td>
				</tr> 
				<tr>
					<th>거리</th>
					<td><input
						id="distance" name="distance" type="text" 
						value="${distance}"
						required></td>
				</tr>
				<tr>
					<td class="txt-c" colspan="2"><input type="submit" class="adminBtn" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" class="adminBtn" value="취소" /></form>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type='button' id="btnDel" class="adminBtn" value="삭제"></td>
				</tr>
		</table>
	</div> 

<script src="${context}/js/station/station.js"></script>
<script type="text/javascript">
	$('#btnDel').click(function() {
		alert('삭제버튼');
		var stationCode = $('#stationCode').val();
		station.stationDel('${root}', stationCode);
	});
</script>