<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		console.log('onload....');

	});
	function idCheck() {
		console.log('idCheck()....');

		//2.jquery ajax
		console.log('id:', $("#id").val());
		$.ajax({
			url : "json_idCheck.do",
			data : {
				id : $("#id").val()
			},
			method : 'GET',
			dataType : 'json', 
			success : function(response) {
				console.log('ajax...success:', response);
				let msg = response.result === 'OK' ? '사용가능' : '사용중'
				$("#demo").html(msg);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
	}
</script>


</head>
<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>

	<form action="m_insertOK.do" method="post"
		enctype="multipart/form-data">
		<table id="memberList">
			<tr>
				<td><label for="id">아이디:</label></td>
				<td><input type="text" id="id" name="id" value="tester">
					<button type="button" onclick="idCheck()" class="myButton">ID중복체크</button>
					<span id="demo"></span></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호:</label></td>
				<td><input type="password" id="pw" name="pw" value="hi11"></td>
			</tr>
			<tr>
				<td><label for="name">이름:</label></td>
				<td><input type="text" id="name" name="name" value="lee이"></td>
			</tr>
			<tr>
				<td><label for="address">주소:</label></td>
				<td><input type="text" id="address" name="address" value="서울"></td>
			</tr>
			<tr>
				<td><label for="multipartFile">프로필 사진:</label></td>
				<td><input type="file" name="multipartFile"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>