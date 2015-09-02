<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  	<div id="content">
	<form action="${root}/train/makerInputForm" >
		<h2 class="txt-c h2Style">제조사 정보</h2>
		<table class="stationTable">
			<tr>
				<th>제조사명</th>
				<td>
					 <input id="makerName"
					name="makerName"  type="text" required autofocus>
				</td>
			</tr>
			
			<tr>
					<td class="txt-c" colspan="2"><input type="submit" class="adminBtn" value="입력" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" class="adminBtn" value="취소" /></td>
				</tr>
			</table>
	</form>
	</div>

