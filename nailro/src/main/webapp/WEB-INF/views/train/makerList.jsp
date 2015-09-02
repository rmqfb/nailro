<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div id="inputDiv">
		<a href="${root}/train/makerInput">제조사입력</a>&nbsp;
	</div>
	<table class="trainTable w-90p txt-c">
		<tr>
			<th>번호</th>
			<th>제조사코드</th>
			<th>제조사명</th>
		</tr>
		<c:forEach var="mk" items="${makerList}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td><a href="${root}/train/makerUpdate?makerCode=${mk.makerCode}&&makerName=${mk.makerName}">${mk.makerCode}</a></td>
				<td><a href="${root}/train/makerUpdate?makerCode=${mk.makerCode}&&makerName=${mk.makerName}">${mk.makerName}</a></td>
			</tr>
		</c:forEach>
	</table>

