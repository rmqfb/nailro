<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="container"></div>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '${root}/train/trainList',
			type : 'GET',
			dataType : 'JSON',
			contentType : 'application/json',
			success : function(data) {
				train.listForm(data); /*분기문을 통해 데이터가 있고 없고에 따른 페이지 구성해야함*/
			},
			error : function() {
				alert('차량 리스트 에러');
			}
		});

	});

	train = {}
	train.list = function() {
		$('#trainInput').click(function() {

			$.ajax({
				url : '${root}/train/trainList',
				type : 'GET',
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					if(data!=null){
						train.listForm(data); /*분기문을 통해 데이터가 있고 없고에 따른 페이지 구성해야함*/
					}else{
						train.noData();
					}
				},
				error : function() {
					alert('차량 리스트 에러');
				}
			});
		});

	}
	train.noData= function() {
		$('#container').empty();
		var table = '<br /><br /><br /><div id="inputDiv"><input type="button" id = "trainInput" value="차량입력" /></div>';
		table += '<table>';
		table += '<tr>';
		table += '	<th colspan="5">입력된 차량이 없습니다. 차량을 입력해 주세요</th>';
		table += '	<th>차량코드</th>';
		table += '</tr></table>';
		$('#container').html(table);
		train.Input();
	}
	
	train.listForm = function(data) {
		$('#container').empty();
		var table = '<br /><br /><br /><div id="inputDiv"><input type="button" id = "trainInput" value="차량입력" /></div>';
		table += '<table>';
		table += '<tr>';
		table += '	<th>번호</th>';
		table += '	<th>차량코드</th>';
		table += '<th>차량명</th>';
		table += '<th>제조사</th>';
		table += '<th>승차가능인원</th>';
		table += '</tr>';
		$.each(data,function(index) {
							table += '<tr>';
							table += '		<td>' + (index + 1) + '</td>';
							table += '<td><a href="#" onclick="return train.update('+this.trainCode+')">' 
									+ this.trainCode + '</a></td>';
					
							table += '<td><a href="#" onclick="return train.update('+this.trainCode+')">'
									+ this.trainName + '</a></td>';
							table += '		<td>' + this.makerName + '</td>';
							table += '		<td>' + this.seatCount + '</td>';
							table += '</tr>';
						});
		table += '</table>';
		$('#container').html(table);
		train.Input();
	}

	train.InputForm = function(data) {

		$('#container').empty();
		$('#container').append('<form action="#" id="frmTrainInput">');
		var frm = '<fieldset><legend>차량 정보</legend>';
		frm += '<ol>';
		frm += '<li><label for="trainName">차량명</label> <input id="trainName" name="trainName" type="text" required></li>';
		frm += '<li><label for="maker">제조사</label>';
		frm += '<select name="makerSelect" id="makerSelect">';
		/* frm += '<option selected="selected" value="1">선 택</option>' */;
		
		if(data!=null){
			$.each(data, function() {
				frm += '<option value="'+this.makerCode+'">' + this.makerName
						+ '</option>';
			});
		}else{
			frm += '<option selected="selected" value="1">제조사가 없습니다.</option>'
		}
		frm += '</select></li>';
		frm += '<li><label for="seatCount">승차가능인원</label> ';
		frm += '<input id="seatCount" name="seatCount" type="number" min="20" max="72" required></li>';
		frm += '</ol><br />';
		frm += '<div id="divCenter">';
		frm += '<input type="submit" value="입력" id="trInput" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="취소" /></div>';
		frm += '</fieldset>';

		$('#frmTrainInput').html(frm);
		train.InputAction();
	}
	train.Input = function() {
		$('#trainInput').click(function() {
			$.ajax({
				url : '${root}/train/makerList',
				type : 'GET',
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {

					train.InputForm(data); /*분기문을 통해 데이터가 있고 없고에 따른 페이지 구성해야함*/

				},
				error : function() {
					alert('차량 리스트 에러');
				}
			});

		});
	}

	train.InputAction = function() {
		$('#makerSelect').on("change", function() {
			var makerCode = $(this).val();
			$('#trInput').click(function() {
				var trainName = $('#trainName').val();
				var seatCount = $('#seatCount').val();

			/* 	alert('실패실패'); */
				var allData = {
					"trainName" : trainName,
					"makerCode" : makerCode,
					"seatCount" : seatCount
				};
				$.ajax({
					url : '${root}/train/trainInputForm',
					type : 'GET',
					data : allData,
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						train.listForm(data);
					},
					error : function() {
						alert('에러');
					}
				});

			});
		});
	}
	
	train.Update = function() {
		
	}
</script>