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
<title>jsp �Խ��� �� ����Ʈ</title>

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

	var request = new XMLHttpRequest(); // ��û�� �������� �ϴ� �Լ� 

	function searchFunction() {
		// request ��ü ���ͼ� ���� ���� ��ġ�� �������� userName=���� ��Ʈ������ ���� �Է��� id �� (input �±� ) userName ����
		request.open("Post", "./UserSearchServlet?userName="
				+ encodeURIComponent($('#userName').value), true);
		request.onreadystatechange = searchProcess; // ��û�� ������ searchProcess �Լ��� ȣ��
		request.send(null);
	}
	function searchProcess() {
		var table = $('#ajaxTable');
		table.innerHTML = ""; //�������� �������

	/* 	var array = JSON.parse(request.responseText);
		alert("����" + array); */

		if (request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result; // result json �� ������ ���ڴٴ°� 

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
				<!-- onkeyup�� �� input �±׿��� ���� ���� �� ���� ���� �̺�Ʈ�� �߻���Ų��. -->
				<input class="form-control" name="userName" id="userName" type="text" size="20" onkeyup="searchFunction()">

			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button">�˻�</button>
			</div>
		</div>

		<table class="table"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">�̸�</th>
					<th style="background-color: #fafafa; text-align: center;">����</th>
					<th style="background-color: #fafafa; text-align: center;">����</th>
					<th style="background-color: #fafafa; text-align: center;">�̸���</th>
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<tr>
					<td>kkk</td>
					<td>22</td>
					<td>����</td>
					<td>xxxx@naver.com</td>

				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>