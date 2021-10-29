<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="application/javascript">
$(window).load(function() {
	
	$('.button').click(function(){
		fetchData('/api/schedules/'+$(this).attr('id'));
		$('#CheckedButton').text($(this).attr('id'));
	})
	
	async function fetchData(url) {
		const response = await fetch(url);
		const json = await response.json();
		console.log(json);
		if(json !=null){
			for (var value of json) {
				var str = 
					"<tr><td>"+value.rsvno+"</td><td>"+value.studentno+"</td><td>"+value.profno+"</td><td>"+value.manno+"</td><td>"
					+value.studiono+"</td><td>"+value.studioloc+"</td><td>"+value.rsvDate+"</td><td>"+value.startTime+"</td><td>"
					+value.endTime+"</td></tr>";
					
				/* var str2 = `<tr><td>${value.rsvno}</td></tr>`; */
				$("#rsvList > tbody:last").append(str);
			}
		}
	}
	
	$('#search').click(function(){
		var searchSelect = $('#searchSelect').val();
		var textValue = $('#searchBox').val();
		var CheckedButton = $('#CheckedButton').text();
		getSearchData(CheckedButton,searchSelect,textValue);
		//url = /api/schdules/btn1
	})
	
	function getSearchData(CheckedButton,searchSelect,textValue){
		
	}
});
</script>

</head>
<body>

	<div style="text-align: center;">
		<input type="button" class="button" id="btn1" value="studiorsv" name="btn1" /> 
		<input type="button" class="button" id="btn2" value="rentalrsv" name="btn2" /> 
		<input type="button" class="button" id="btn3" value="btn3rsv" name="btn3" /> 
		<input type="button" class="button" id="btn4" value="btn4rsv" name="btn4" />
		<select name="searchSelect" id="searchSelect" class="searchSelect">
			<option value="none">== 검색조건을 선택해주세요 ==</option>
			<option value="name">이름</option>
			<option value="userId">유저아이디</option>
			<option value="mainCategory">메인카테고리</option>
		</select>
		<input type="text" id="searchBox" />
		<input type="button" id="search" name="search" value="검색"/>
	</div>
	<p id="CheckedButton"></p>
	<div style="width: 800px; margin: 0 auto;">
	 	<table border=1 id="rsvList">
	 		<thead>
		 		<tr><td align=center>예약번호</td>
		 		    <td align=center>학번</td>
		 		    <td align=center>교번</td>
		 		    <td align=center>관리자번호</td>
		 		    <td align=center>스튜디오번호</td>
		 		    <td align=center>스튜디오위치</td>
		 		    <td align=center>예약날짜</td>
		 		    <td align=center>시작시간</td>
		 		    <td align=center>종료시간</td>
		 		</tr>
	 		</thead>
	 		<tbody>
	 		</tbody>
	 	</table>
	 </div>
	
</body>
</html>