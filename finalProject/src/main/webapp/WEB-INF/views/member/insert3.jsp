<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>

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
			url : "jsonIdCheck.do",
			data : {
				id : $("#id").val()
			},
			method : 'GET',
			dataType : 'json', 
			success : function(response) {
				console.log('ajax...success:', response);
				let msg = response.result === 'OK' ? '사용가능한 아이디 입니다' : '아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.'
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
	<form action="memberInsertOK.do" method="post"
		enctype="multipart/form-data">

		<!-- 아이디 -->
		<div class="form-group">
			<label for="id">아이디</label> <br> 
			<input type="text" id="id" name="id" 
				placeholder="ID" required>
			<button type="button" onclick="idCheck()" class="myButton">ID중복검사</button>
<!-- 			<div class="check_font" id="id_check"></div> -->
			<br><span id="demo"></span></td>
		</div>

		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="pw">비밀번호</label> <br> 
			<input type="password" id="pw" name="pw" 
				placeholder="PASSWORD" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<!-- 			<div class="form-group"> -->
		<!-- 				<label for="user_pw2">비밀번호 확인</label> -->
		<!-- 					<input type="password" class="form-control" id="user_pw2" name="user_pw2" placeholder="Confirm Password" required> -->
		<!-- 				<div class="check_font" id="pw2_check"></div> -->
		<!-- 			</div> -->
		<!-- 이름 -->
		<div class="form-group">
			<label for="name">이름</label> <br> 
			<input type="text" id="name" name="name" 
				placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<!-- 주소 -->
		<div class="form-group">
			<label for="address">주소 </label> <br>
			<input type="text" id="address" name="address" 
				placeholder="Address" required>
			<div class="check_font" id="address_check"></div>
		</div>
		<!-- 프로필 사진 -->
		<!-- 		필수X -->
		<div class="form-group">
			<label for="multipartFile">프로필 사진</label> <br>
			<input type="file" id="multipartFile" name="multipartFile">
			<div class="check_font" id="multipartFile_check"></div>
		</div>


	
		
<!-- 		<div class="reg_button"> -->
<!-- 			<a class="btn btn-danger px-3" href="home.do"> <i -->
<!-- 				class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기 -->
<!-- 			</a>&emsp;&emsp; -->
<!-- 			<button class="btn btn-primary px-3" id="reg_submit"> -->
<!-- 				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기 -->
<!-- 			</button> -->

<!-- 			<input type="submit" class="myButton"></td> -->
		<div>
			<input type="submit" class="myButton">
		</div>
	</form>
</body>
</html>