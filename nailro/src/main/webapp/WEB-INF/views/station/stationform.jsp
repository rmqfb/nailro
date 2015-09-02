<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="content">
		<!-- 역정보 -->
			<form action="${root}/station/stationInputForm" method="post"> 
			<h2 class="txt-c h2Style">역정보입력</h2>
			<table class="stationTable">
				<tr>
					<th>역명</th>
					<td><input id="stationName" name="stationName" type="text" required autofocus></td>
				</tr> 
				<tr>
					<th>거리</th>
					<td><input id="distance" name="distance" type="text" required></td>
				</tr>
				<tr>
					<td class="txt-c" colspan="2"><input type="submit" class="adminBtn" value="입력" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" class="adminBtn" value="취소" /></td>
				</tr>
			</table>
		</form> 
	</div>
