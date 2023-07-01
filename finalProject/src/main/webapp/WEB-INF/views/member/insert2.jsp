<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입2</title>
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
			method : 'GET',//default get
			// 			method:'POST',
			dataType : 'json', //xml,text
			success : function(response) {
				console.log('ajax...success:', response);//{"result":"OK"}
				let msg = response.result === 'OK' ? '사용가능' : '사용중'
				$("#demo").html(msg);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
				// 				console.log('status:', status);
				// 				console.log('error:', error);
			}
		});
	}
</script>


</head>
<!-- <body background="https://cdn.imweb.me/upload/S20200130a3018554a5004/a6f46584e7133.png"> -->
   <body>
   <jsp:include page="../top_menu.jsp"></jsp:include>
    <br>
    <br><br>
    <form name="joinForm" action="mailto:hk7286@nvaer.com?subject=안녕하세요">
        <table text-align="center" align="center" border="1" width="800" height="600" cellspacing="0">
            <tr>
                <td bgcolor="#48dbfb" align="center" colspan="2" height="50"> <b>회원 기본 정보</b> </td>
            </tr>
            <tr>
                <td bgcolor="#c8d6e5" align="center" width="150">아이디:</td>
                <td bgcolor="white"> <input type="text" size="20" name="uid" id="uid" minlength="4" maxlength="12"> 4~12자의 영문 대소문자의 숫자로만 입력 </td>
            </tr>
            <tr>
                <td bgcolor="#c8d6e5" align="center">비밀번호:</td>
                <td bgcolor="white"> <input type="password" size="20" name="pw" id="pw" minlength="4" maxlength="12"> 4~12자의 영문 대소문자의 숫자로만 입력</td>
            </tr>
<!--             <tr> -->
<!--                 <td bgcolor="#c8d6e5" align="center">비밀번호확인:</td> -->
<!--                 <td bgcolor="white"><input type="password" size="20" name="cpw" id="cpw"></td> -->
<!--             </tr> -->
            <tr>
                <td bgcolor="#c8d6e5" align="center">이름:</td>
                <td bgcolor="white"><input type="text" size="30" name="uname" id="uname"></td>
            </tr>
            <tr>
                <td bgcolor="#c8d6e5" align="center">주소:</td>
                <td bgcolor="white"><input type="address" size="30" name="mail" id="mail"> 예) 서울</td>
            </tr>
            <tr>
				<td><label for="multipartFile">프로필 사진:</label></td>
				<td><input type="file" name="multipartFile"></td>
			</tr>
        </table>
        <br>
        <div align="center">
            <button type="button" width="30" onclick="Validation()">회원 가입</button>
<!--             <input type="reset" onclick="alert('초기화 했습니다.')" value="다시 입력"> -->
        </div>
    </form>
</body>
</html>