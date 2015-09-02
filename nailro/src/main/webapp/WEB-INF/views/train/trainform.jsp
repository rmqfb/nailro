<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<div id="content">
	<form action="${root}/train/trainInputForm">
		<h2 class="txt-c h2Style">차량정보</h2>
		<table class="stationTable">
				<tr>
					<th>차량명</th>
					<td> <input id="trainName"
					name="trainName" type="text" required></td>
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
						id="seatCount" name="seatCount" type="number" min="20" max="72" required></td>
				</tr>
			
				<tr>
					<td class="txt-c" colspan="2"><input type="submit" class="adminBtn" value="입력" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" class="adminBtn" value="취소" /></td>
				</tr>
			</table>
		</form> 
	</div>


