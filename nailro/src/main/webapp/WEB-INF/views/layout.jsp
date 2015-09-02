<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<link rel="stylesheet" href="${context}/css/common.css" />
	<!-- jquery ui 넣기 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="${context}/jquery-ui/jquery-ui.css"type="text/css" />
<link rel="stylesheet" href="${context}/jquery-ui/jquery-ui.theme.css"type="text/css" />
<link rel="stylesheet" href="${context}/jquery-ui/jquery-ui.structure.css"type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%-- <script src="${context}/js/home/magnific-popup.js"></script>--%>
<script src="${context}/jquery-ui/jquery-ui.js"></script> 
<script src="${context}/jquery-ui/jquery.bxslider.js"></script>
<script src="${context}/jquery-ui/plugins/jquery.easing.1.3.js"></script>
<script src="${context}/jquery-ui/plugins/jquery.fitvids.js"></script>
<script src="${context}/js/home/magnific-popup.js"></script>
<script src="${context}/jquery-ui/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content" class="min-h">
			<section class="sectionClass">
				<div class="mainview">
					<tiles:insertAttribute name="content"/>
				</div>
			</section>
		</div>
		<div id="footer" class="both">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>