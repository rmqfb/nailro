/**
 * railLine.js
 */
var railLine={
		railLineDel:function(path,val){
			alert("삭제 성공");
			location.href=path+"/railLine/railLineDelete?railCode="+val;
		}
}