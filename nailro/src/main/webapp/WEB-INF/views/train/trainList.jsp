<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="inputDiv">
		<a href="${root}/train/trainInput">차량입력</a>
	</div>
	<table class="trainTable w-90p txt-c">
		<tr>
			<th>번호</th>
			<th>차량코드</th>
			<th>차량명</th>
			<th>제조사</th>
			<th>승차가능인원</th>
		</tr>
		<c:forEach var="tr" items="${trainList}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td><a href="${root}/train/trainUpdate?trainCode=${tr.trainCode}&&trainName=${tr.trainName}&&makerCode=${tr.makerCode}&&makerName=${tr.makerName}&&seatCount=${tr.seatCount}">${tr.trainCode}</a></td>
				<td><a href="${root}/train/trainUpdate?trainCode=${tr.trainCode}&&trainName=${tr.trainName}&&makerCode=${tr.makerCode}&&makerName=${tr.makerName}&&seatCount=${tr.seatCount}">${tr.trainName}</a></td>
				<td>${tr.makerName}</td>
				<td>${tr.seatCount}</td>
			</tr>
			<input type="hidden" id="makerCode" value="${tr.makerCode}" />
		</c:forEach>
	</table>

