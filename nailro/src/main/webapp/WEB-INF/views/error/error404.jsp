<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
	<strong>404dpfjqkftod </strong>
	<br />
	<br />
	<div>
		<img src="${context}/image/error/error404.jpg" alt="" />
	</div>
	주소를 바르게 입력했는지 확인해보기기 바랍니다.
	<!--HTTP 프로토콜 
	은 응답상태 코드를 이용하여 서버의 처리결과를 웹브라우저에 알ㄹ려주며 주요 응답상태코드로는 다음과 같은 것들이 존재
	200 - ok
	307 - dlatl 임시, 리다이렉트
	400 - 문법에러;
	401 - 접근 불가 
	404 - URL에 따른페이지가 존재하지 않음 
	405 - 요청된 메소드는 허용불가(get방식 post방식 )일때 
	500 -서버 내부 에러jsp 에서 익셉션이 발생했을 경우 
	503 - 서버 부하 . 예)디도스 
	
	
	jsp 가 정상적으로 실행되는 응답코드로 200이 전송되며 , 
	respone.sendRedirect() 를 이용할 경우 응답코드로 307 이 전송된다. 
	  -->
	
</body>
</html>