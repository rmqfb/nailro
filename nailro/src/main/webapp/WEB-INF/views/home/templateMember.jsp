<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id = "mainbox" >
 <div id="clear"></div>

</div> <!--  전체 메인 div 끝 -->

<script type="text/javascript">
$(function(){
	$.getJSON("${root}/board/list/1/1",function(data){
		meajax2.listForm(data);
	});
	
});


meajax2 = {}
meajax2.listForm = function(data) {
	$('.boardDiv').empty();
	var table =  '<input type="hidden" id="pageNo" value='+data.pageNo+'/>';
		table += '<table>';
		table += '<td style = "text-align: end">';
		table += '</table>';
		table += '<table id="boTable" style="font-size: 20px;"><tr style="background-color: #00ffff;"><th width="50px" >번 호</th><th width="200px">제 목</th><th width="15%">작 성 자</th><th width="15%">등 록 일</th><th width="15%">조 회 수</th></tr>';
		$.each(data.list,function(){
		table += '<tr><td>'+this.brdNo+'</td>';
		table += '<td><a href="#" id="detail" onclick="return meajax2.detail('+this.brdNo+','+(this.readCnt+1)+')">'+this.title+'</a></td><td>관리자</td>';
		table += '<td>'+this.boardDate+'</td><td>'+this.readCnt+'</td></tr>';
		});
		table += '<tr><td colspan="5">';
		table += '<div style="width:600px;margin:0 auto">';
		table += '<nav><ul  class="pagination">';
		table += '</ul></nav></div></td></tr>';
		table +='</table>';
		$('.boardDiv').html(table);
		$('#detail').click(function() {
			meajax2.detail();
		});
}
meajax2.detail =function(){
	 alert('자세한 사항은 게시판 공지사항을 통해서 확인하시기 바랍니다.');	
	}

 
 
</script> 
