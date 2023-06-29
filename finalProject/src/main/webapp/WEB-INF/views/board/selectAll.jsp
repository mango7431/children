<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중고거래</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>중고거래</h1>
	<a href="boardInsert.do">글쓰기</a>
<div class="row row-cols-1 row-cols-md-4 g-4">
	<c:forEach var="vo" items="${vos }">
	<div class="col">
		<div class="card" style="width: 18rem;">
				<a href="boardSelectOne.do?board_num=${vo.board_num }" class="list-group-item list-group-item-action active">
					<img src="resources/img/${vo.board_savename1 }" class="card-img-top">
				</a>
			<div class="card-body">
				<p class="card-title">${vo.board_title }</p>
				<p class="card-text">${vo.price }</p>
				<p class="card-text">${vo.board_date }</p>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</body>
</html>
