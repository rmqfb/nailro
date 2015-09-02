<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="inputDiv">
		<a href="${root}/station/stationInput">역입력</a>
	</div>
		<table class="stationTable w-90p txt-c">
			<tr>
				<th>번호</th>
				<th>역코드</th>
				<th>역명</th>
				<th>거리</th>
			</tr>
		<c:forEach var="st" items="${stationList}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td><a href="${root}/station/stationUpdate?stationCode=${st.stationCode}&&stationName=${st.stationName}&&distance=${st.distance}">${st.stationCode}</a></td>
				<td><a href="${root}/station/stationUpdate?stationCode=${st.stationCode}&&stationName=${st.stationName}&&distance=${st.distance}">${st.stationName}</a></td>
				<td>${st.distance}</td>
			</tr>
		</c:forEach>
		</table>
