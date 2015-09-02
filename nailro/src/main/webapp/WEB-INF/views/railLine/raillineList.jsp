<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!--노선정보 -->
	<div id="inputDiv">
		<a href="${root}/railLine/railLineInput">노선입력</a>
	</div>
	<form action="${root}/railLine/railLineList"
		name="frmRail" id="frmRail" method="post">

		<table class="railTable w-90p txt-c">
			<tr>
				<th>번호</th>
				<th>노선코드</th>
				<th>노선명</th>
			</tr>
			<c:forEach var="rl" items="${list}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td><a
						href="railLineUpdate?railCode=${rl.lineCode}&&railName=${rl.lineName}">
							${rl.lineCode}</a></td>
					<td><a
						href="railLineUpdate?railCode=${rl.lineCode}&&railName=${rl.lineName}">${rl.lineName}</a>
					</td>
				</tr>
			</c:forEach>
			</table>
			</form>



