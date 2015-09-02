/**
 * station.js
 */
var station={
		stationDel:function(path,val){
			/*location.href=path+"/station.nr";*/
			alert(path+","+","+val+"111삭제 성공");
			location.href=path+"/station/stationDelete?stationCode="+val;
		}
}