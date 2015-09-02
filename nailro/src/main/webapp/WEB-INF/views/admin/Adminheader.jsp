<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
   
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" id="home">
      <img src="${context}/image/home/logo.jpg" style="width: 100px; height:50px; position:absolute; margin-top: -20px;"/>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#" id="admin-memberlist">회원관리</a></li>
        <li><a href="#" id="admin-grossprofit">수익관리</a></li>
        <li><a href="#" id="admin-reserve">예매관리</a></li>
        <li><a href="#" id="admin-pkg">패키지관리</a></li>
        <li><a href="#" id="admin-station">역관리</a></li>
        <li><a href="#" id="admin-railLine">노선관리</a></li>
        <li><a href="#" id="admin-train">열차관리</a></li>
        <li><a href="#" id="admin-maker">제조사관리</a></li>
        <li><a href="#" id="admin-runtrain">운행열차관리</a></li>
          </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" id="narilo-home">홈</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<script type="text/javascript">
/* 홈 */
$('#admin-logout').click(function() {location.href="${root}/Controller.nr";});
$('#narilo-home').click(function()  {location.href="${root}/home";});
/* 멤버관리*/
$('#admin-memberlist').click(function() {location.href="${root}/member/adminMemberMain";});
/* erp*/
$('#admin-grossprofit').click(function() {location.href="${root}/erp/grossprofitAdmin/1";});
$('#admin-reserve').click(function() {location.href="${root}/erp/reserveAdmin";});
/* 패키지관리*/
$('#admin-pkg').click(function() {location.href="${root}/event/pkgAdmin";});
/* 철도관리*/
$('#admin-station').click(function() {location.href="${root}/station/stationList";});
$('#admin-railLine').click(function() {location.href="${root}/railLine/railLineList";});
$('#admin-train').click(function() {location.href="${root}/train/trainList";});
$('#admin-maker').click(function() {location.href="${root}/train/makerList";});
$('#admin-runtrain').click(function() {location.href="${root}/erp/runTrainWirteForm";});
</script>