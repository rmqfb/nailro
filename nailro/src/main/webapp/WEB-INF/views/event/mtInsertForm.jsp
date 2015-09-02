<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${context}/css/common.css" />
 <div align="center">
 	<h2><b>숙소 정보 입력</b></h2>
	<form name="mtInsert" action="${root}/event/mtInsert" method="POST">
		<table class="tableTag">
			<tr>
				<th> <label for="mtCode">숙소 코드</label> </th>
				<td><input type="text" id="mtCode" name="mtCode" autocomplete="on" required/></td>
			</tr>
			<tr>
				<th> <label for="mtName">숙소 이름 </label></th>
				<td><input type="text" id="mtName" name="mtName"/></td>
			</tr>
			<tr>
				<th><label for="mtAddress">숙소 주소</label></th>
				<td><input type="text" id="mtAddress" size="100" name="mtAddress"/></td>
			</tr>
			<tr>
				<th><label for="mtPhone"> 숙소 연락처 </label></th>
				<td><select name="mtPhone1" id="mtPhone1"> <option value="000">전국번호</option>
						<option value="02">02(서울)</option><option value="051">051(부산)</option><option value="053">053(대구)</option>
						<option value="032">032(인천)</option><option value="062">062(광주)</option><option value="042">042(대전)</option>
						<option value="052">052(울산)</option><option value="044">044(세종)</option><option value="031">031(경기)</option>
						<option value="033">033(강원)</option><option value="043">043(충북)</option><option value="041">041(충남)</option>
						<option value="063">063(전북)</option><option value="061">061(전남)</option><option value="054">054(경북)</option>			
						<option value="055">055(경남)</option><option value="064">064(제주)</option>			
				</select> <input type="text" name="mtPhone2" size="5"/> <input type="text" name="mtPhone3" size="5"/></td>
				
			</tr>
			<tr>
				<th><label for="mtInfo"> 숙소 객실정보 </label></th>
				<td><input type="text" id="mtInfo" name="mtInfo"/></td>
			</tr>		
			<tr>
				<th> <label for="mtAbout">숙소 세부사항</label> </th>
				<td><textarea id="mtAbout" name="mtAbout" rows="15" cols="100"></textarea></td>
			</tr>
			<tr>
				<th> <label for="mtPrice">숙소 가격 </label></th>
				<td><input type="text" id="mtPrice" name="mtPrice"/>원</td>
			</tr>
		</table>
	</form>
 </div>
 <p></p>
 <div align="center">
 	<button id="update">확인</button>
 	<button id="cancel">취소</button>
 </div>
	<script src="${context}/js/event/event.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#update').click(function() {
			mtInputForm.mtInsert();
		});
		
		$('#cancel').click(function() {
			mtInputForm.cancel('${root}/event/mtInfo');
		});
		
	});

	</script>