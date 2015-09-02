/**
 * 
 */
var train={
		makerDel:function(path,val){
			alert("삭제 성공");
			location.href=path+"/train/makerDelete?makerCode="+val;
		},
		trainDel:function(path,val){
			/*location.href=path+"/train.nr";*/
			alert("삭제 성공");
			location.href=path+"/train/trainDelete?trainCode="+val;
		}
}