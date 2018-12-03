<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewPort" content="width=device=width" ,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>jsp 게시판 웹 사이트</title>

<script>
	/* $(document).ready(function(){
	
	 $('#userName').keyup(function(){
	 var query = $('userName').val();
	 $.ajax({
	 type:"POST",
	 url:"/bbs2/UserSearchServlet",
	 data: query,
	 success:function(data){
	 var array = JSON.parse(data);
	 var table = $('#ajaxTable');
	 for(var i = 0; i < array.length; i++){
	 var row = table.insertRow(0);
	 for(var j = 0; j < result[i].length; j++){
	 var cell = row.insertCell(j);
	 cell.innerHTML=result[i][j].value;
	 }
	 }
	 }
	 })
	
	 })
	
	
	
	 }) */

	var request = new XMLHttpRequest(); // 요청을 보내고자 하는 함수 

	function searchFunction() {
		// request 객체 얻어와서 나에 현제 위치에 서블릿으로 userName=쿼리 스트링으로 내가 입력한 id 값 (input 태그 ) userName 값을
		request.open("Post", "./UserSearchServlet?userName="
				+ encodeURIComponent($('#userName').value), true);
		request.onreadystatechange = searchProcess; // 요청이 끝나면 searchProcess 함수를 호출
		request.send(null);
	}
	function searchProcess() {
		var table = $('#ajaxTable');
		table.innerHTML = ""; //공백으로 만들어줌

	/* 	var array = JSON.parse(request.responseText);
		alert("내꺼" + array); */

		if (request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result; // result json 을 가지고 오겠다는거 

			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for (var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
</script>

</head>
<body>

	<br />
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<!-- onkeyup은 이 input 태그에서 글을 쓰는 매 순간 순간 이벤트를 발생시킨다. -->
				<input class="form-control" name="userName" id="userName" type="text" size="20" onkeyup="searchFunction()">

			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button">검색</button>
			</div>
		</div>

		<table class="table"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">이름</th>
					<th style="background-color: #fafafa; text-align: center;">나이</th>
					<th style="background-color: #fafafa; text-align: center;">성별</th>
					<th style="background-color: #fafafa; text-align: center;">이메일</th>
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<tr>
					<td>kkk</td>
					<td>22</td>
					<td>남자</td>
					<td>xxxx@naver.com</td>

				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>