<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="${root}/railLine/railLineInputForm" name="frmRail"
	method="post">
	<h2 class="txt-c h2Style">노선정보</h2>
	<table class="stationTable">
		<tr>
			<th>노선명</th>
			<td><input id="railName" name="railName" type="text" required
				autofocus></td>
		</tr>
		<tr>
			<th>역1</th>
			<td><select name="stationSelect1" id="stationSelect1">
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역2</th>
			<td><select name="stationSelect2" id="stationSelect2">
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역3</th>
			<td><select name="stationSelect3" id="stationSelect3">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역4</th>
			<td><select name="stationSelect4" id="stationSelect4">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역5</th>
			<td><select name="stationSelect5" id="stationSelect5">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역6</th>
			<td><select name="stationSelect6" id="stationSelect6">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역7</th>
			<td><select name="stationSelect7" id="stationSelect7">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역8</th>
			<td><select name="stationSelect8" id="stationSelect8">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역9</th>
			<td><select name="stationSelect9" id="stationSelect9">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>역10</th>
			<td><select name="stationSelect10" id="stationSelect10">
					<option value="" selected>--없음--</option>
					<c:forEach var="stationList" items="${stationList}" varStatus="i">
						<option value="${stationList.stationCode}">${stationList.stationName}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td class="txt-c" colspan="2"><input type="submit"
				class="adminBtn" value="입력" />&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="reset" class="adminBtn" value="취소" /></td>
		</tr>
	</table>
</form>

<script src="${context}/js/railline/railLine.js"></script>
<script type="text/javascript">
	$(function() {
		$('#railName').keydown(function() {
			railLine.onKeyDown(20, this);
		});
	});
</script>