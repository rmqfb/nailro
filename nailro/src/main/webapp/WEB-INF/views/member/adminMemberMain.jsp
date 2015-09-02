<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<c:set var="PAGESIZE" value="5"/>
<c:set var="ROWPERPAGE" value="10"/> 
<div style="float: left; width: 100%">  <!-- 전체 div -->

<c:choose>
 <c:when test="${(count%ROWPERPAGE) eq 0}">
 <fmt:parseNumber var="totPage" integerOnly="true" value="${(count/ROWPERPAGE)}" />
 <c:set var= "totPage" value="${totPage}" />
 </c:when>
 <c:otherwise>
 <fmt:parseNumber var="totPage" integerOnly="true" value="${(count/ROWPERPAGE)+1}" />
 <c:set var= "totPage" value="${totPage}" />
 </c:otherwise>
</c:choose>

<c:set var="startPage" value="${pageNo-((pageNo-1)%PAGESIZE)}"/>

<c:choose>
<c:when test="${(startPage+PAGESIZE-1) le totPage}">	
  <c:set var="lastPage" value="${startPage+PAGESIZE-1}"/>
  </c:when>
  <c:otherwise>
  <c:set var="lastPage" value="${totPage}"/>
  </c:otherwise>
</c:choose>




<form action="${root}/member/memberAllList?command=list&pageNo="${startPage}" name="frmAdmin" id="frmAdmin">
    <table class = "memberAllList">
    	<tr align="left" >
    	 <td colspan="10" style="margin-top: 25px;"> 
    	 &nbsp;&nbsp;&nbsp; 전체 회원수 :${count}&nbsp;&nbsp;&nbsp;
    	 <p></p>   	
    	 </td>
    	</tr>
    	
    	<tr>
    	초기 페이지No : "${pageNo}"
    	토탈페이지 : ${totPage}
    	스타트페이지 : ${startPage}
    	두번째블럭의 스타트페이지 : ${pageNo-((pageNo-1)%PAGESIZE)}
    	라스트페이지 : ${lastPage}
    	 다음▶ 에 걸리는 값  : ${startPage+PAGESIZE}
    	 </tr>
    	
    	<tr>
    		<th style="width: 7%; text-align:left">ID </th>
    		<th style="width: 7%; text-align:left">이름 </th>
    		<th style="width: 5%; text-align:left">나이 </th>
    		<th style="width: 5%; text-align:left">성별</th>
    		<th style="width: 10%; text-align:left">핸드폰번호</th>
    		<th style="width: 10%; text-align:left">집전화</th>
    		<th style="width: 13%; text-align:left">이메일</th>
    		<th style="width: 11%; text-align:left">가입일</th>
    		<th style="width: 9%; text-align:left">우대사항</th>
    		<th style="width: 23%; text-align:left">주소</th>
    			
    	</tr>
    	
    	<c:forEach var="member" items="${memberList}" varStatus="status">
    	<tr> 
    		<td>${member.id}</td>
    		<td>${member.name}</td>
    		<td>${member.age}</td>
    		<td>${member.gender}</td>
    		<td>${member.cellPhone}</td>
    		<td>${member.telNo}</td>
    		<td>${member.email}</td>
    		<td>${member.joindate}</td>
    		<td>${member.merit}</td>
    		<td>${member.address}</td>
    	</tr>
    	</c:forEach>

   <tr align="center">
     <td colspan="10" style="width:280px;" >	
 
    		<c:if test="${(startPage-PAGESIZE) gt 0}">
    		<a href="${root}/member/memberAllList?command=list&pageNo=${startPage-PAGESIZE}" >
    		      ◀ 이전</a>
    		</c:if>
    		
    		<c:forEach begin="${startPage}" end="${lastPage}" step="1" varStatus="i">
    		 <c:choose> 		 
    		  <c:when test="${i.index == pageNo}">
    		   <font size="4" color="RED">${i.index}</font>
    		   </c:when>
    		   <c:otherwise>
    		   <a href="${root}/member/memberAllList?command=list&pageNo=${i.index}">
    		     <font size="4" color="BULE">${i.index}</font>
    		   </a>
    		   </c:otherwise>
    		 </c:choose>
    		</c:forEach>
    	   
    	<c:if test= "${(startPage + PAGESIZE) le totPage}" >
    	<a href="${root}/member/memberAllList?command=list&pageNo=${(startPage+PAGESIZE)}" >
             다음▶</a>
    	</c:if> 		   
   </td>
  </tr>
    	
  </table>
</form>
   
 <div style="float: left; width: 100%;" >
</div>

<p></p>
<p></p>
<p></p>
<p></p>
 
<div style="width: 30%"> <!--  재 검색 창 div  -->
<form id="memberAllList" name ="memberAllList">	 
<table style="width:100%; height: 100%; ">
   	<tr >
   		<td> 
   		<div style="width:80%; height: 60%;">
   		<select name="searchKey" id="searchKey" style="width:50%;height: 50%;">
         <option value="list" selected="selected">전체보기</option>
         <option value="id">아이디</option>
         <option value="name">이름</option>
        </select>
          <input type="text" name="searchVal" style="width:20%; height: 50%;"/>
   		  <input type="hidden" name="pageNo" />
          <input type="hidden" name ="command" value="search" /> 
          <br /> <br />
		 <input type ="button" id="allListBtn" name="allListBtn" value="정보보기" style="width: 30%">
		 <input type ="button"  id="logOutAdminBtn" name="logOutAdminBtn" value="로그아웃" style="width: 30%"> 		  
		  </div>     
        </td>
   	</tr>
</table>
 </form>
</div>    <!--  재 검색 창 div  종료-->

</div> <!-- 전체 div  닫기-->


<script type="text/javascript">

 
 $(function() {
	$('#logOutAdminBtn').click(function(){adminajax.logOutAdminBtn();});
	$('#allListBtn').click(function(){adminajax.allListBtn();});
}); 
 
 
 
 adminajax = {}
 
 
 
 adminajax.logOutAdminBtn = function() {
	 $('#logOutAdminBtn').click(function() {
		 alert("관리자 로그아웃합니다. 홈페이지로 이동합니다.");
		 location.href = "${root}/member/logOutAdmin";
	});	 
}
 
 
 adminajax.allListBtn = function() {
	adminajax.memberAllList('${root}/member/memberAllList');

}
 
 adminajax.memberAllList = function(path) {
		$('#memberAllList').attr('action',path).attr('method','get').submit();
}



</script> 
