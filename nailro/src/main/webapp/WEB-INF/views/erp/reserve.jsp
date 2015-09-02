<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- 예매하기에 필요한 출발역 도착역 시간 인원등을 선택할수 있는 폼 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	

<!-- <div id="wrap"> -->
<%-- <jsp:include page="/views/home/header.jsp"/> --%>
<!-- <div id="main"> -->
	<form action="${context}/infoForm.nr" name="infoFrm">
		<div align="center">
			<table class="retable">	
				<!-- <tr>
					<td>출발역</td>
					<td><input type="text" name="startStation" id="startStation"/></td>
					<td><button onclick="windowController.open1()">역검색</button></td>
				</tr>	 -->
					
				<tr>
					<td>출발역</td>
					<td><select name="startStation" >
						<option value="st10">서울</option>
						<option value="st20">부산</option>
						<option value="st40">대구</option>
						<option value="st30">대전</option>
					</select></td>
					<td></td>
				</tr>
				<!-- <tr>
					<td>도착역</td>
					<td><input type="text" name="arriveStation" id="arriveStation"></td>
					<td><button onclick="windowController1.open2()">역검색</button></td>
				</tr> -->
				<tr>
					<td>도착역</td>
					<td><select name="endStation" >
					    <option value="선택" selected="selected">선택</option>
						<option value="st10">서울</option>
						<option value="st20">부산</option>
						<option value="st30">대전</option>
						<option value="st40">대구</option>
					</select></td>
					<td></td>
				</tr>
				<tr>	
					<td>출발일</td>
					<td><input type="text" id="datepicker" name="date"></td>
					<td></td>
				</tr>
				<tr>	
					<td>시 간</td>
					<td><select name="time">
					
					<c:forEach begin="0" end="23" var="time" step="1">
					<option value="${time}">${time}시</option>
					</c:forEach>
					</select>
					</td>
				</tr>
				<tr>	
					<td>인 원</td>
					<td><select name="people">
					<c:forEach begin="0" end="10" var="people" step="1">
					<option value="${people}">${people}명</option>
					</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="submit" align="center">
						<input type="submit" value="승차권 검색" />
					</td>
				</tr>
			</table>
		</div>
	</form>
	<script src="${context}/js/erp/jquery-ui.js"></script>
	<script type="text/javascript">
  $(function() {
    $("#datepicker").datepicker();
   
  });
  var popupCalendar = function(url){
		window.open(url,
					"popupCalendar",
					"scrollbars,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=150,height=400,top=200,left=400"
		);
		
	}
  </script>

