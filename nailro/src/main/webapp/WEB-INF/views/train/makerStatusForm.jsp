<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div id="content">
		<!-- 역정보 -->
		
		<form action="${root}/train/makerUpdateForm" method="post">
			<h2 class="txt-c h2Style">제조사정보</h2>
			<table class="stationTable">
				<tr>
					<th>제조사코드</th>
					<td>
						 <input id="makerCode"
							name="makerCode" type="text" value="${makerCode}" required readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th>제조사명</th>
					<td>
						<input id="makerName"
							name="makerName" type="text" value="${makerName}" required autofocus />
					</td>
				</tr>
				<tr>
					<td class="txt-c" colspan="2"><input type="submit" class="adminBtn" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="reset" class="adminBtn" value="취소" /></form>
							&nbsp;&nbsp;
							<input type="button" id="btnDel" class="adminBtn" value="삭제"></td>
				</tr>
			</table>
		</form>
	</div>

<script src="${context}/js/train/train.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnDel').click(function() {
			var makerCode = $('#makerCode').val();
			train.makerDel('${root}', makerCode);
		});
	});
</script>