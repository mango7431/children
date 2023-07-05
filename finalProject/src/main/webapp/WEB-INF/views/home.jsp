<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bootstrap demo</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="top_menu.jsp"></jsp:include>

	<div class="container">
	<ul>
		<li><a href="jsonQnaSelectAll.do?writer=tester1">jsonQnaSelectAll.do</a></li>
		<li><a href="qnaSelectAll.do?writer=tester1">qnaSelectAll.do</a></li>
		<hr>
		<li><a href="jsonQnaSelectOne.do?qna_num=1">jsonQnaSelectOne.do</a></li>
		<li><a href="qnaSelectOne.do">qnaSelectOne.do</a></li>
		<hr>
		<li><a href="qnaInsertOK.do?writer=tester1&qna_category=1&qna_title=계정이 이상해요&qna_content=확인해주세요">qnaInsertOK.do</a></li>
		<hr>
		<li><a href="jsonQnaSelectCount.do?pageNum=1&amount=10&qna_category=2&writer=tester1">jsonQnaSelectCount.do</a></li>
	</ul>
	</div>
</body>
</html>
