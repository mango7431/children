<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">내 Q&A 목록</div>
 		<div class="row my-3">
	     	<div class="col-md-3 col-lg-2">     
			    <ul class="mypage-floating-menu px-0">
			    	<li><a href="#">마이페이지</a></li>
			    	<li><a href="#">회원정보수정</a></li>
			    	<li><a href="#">찜목록</a></li>
			    	<li><a href="#">내 거래 목록</a></li>
			    	<li><a href="#">내동네설정</a></li>
			    	<li class="fw-bold"><a href="qnaSelectAll.do">내 Q&A 목록</a></li>
			    </ul>
	   		</div>
	   		<div class="col-md-9 col-lg-10 px-5">
	      	<div class="row">
	      		<div class="col-md-6 fs-5 fw-bold">Q&A 목록</div>
	      		<div class="col-md-6 text-end"><a href="qnaInsert.do">글쓰기</a></div>
      			<hr class="mt-3">
	      		<ul class="list-inline q-filter-btn">
	      			<li class="list-inline-item px-3 py-2 q-category selected">전체</li>
	      			<li class="list-inline-item px-3 py-2 q-category">계정문의</li>
	      			<li class="list-inline-item px-3 py-2 q-category">채팅, 알림문의</li>
	      			<li class="list-inline-item px-3 py-2 q-category">거래문의</li>
	      			<li class="list-inline-item px-3 py-2 q-category">광고문의</li>
	      			<li class="list-inline-item px-3 py-2 q-category">기타문의</li>	      			
	      		</ul>
	      	</div>
	        <table class="table table-sm">
					  <thead>
					    <tr>
					      <th scope="col" class="col-2 text-center py-3">글번호</th>
					      <th scope="col" class="col-10 text-center py-3">내용</th>
					    </tr>
					  </thead>
					  <tbody id="vos">
	
					  </tbody>
					</table>
				
				<nav class="text-center">
				  <ul class="list-inline">
				    <li class="list-inline-item">
				      <a href="#"><span>&laquo;</span></a>
				    </li>
				    <li class="list-inline-item"><a class="page-link" href="#">1</a></li>
				    <li class="list-inline-item"><a class="page-link" href="#">2</a></li>
				    <li class="list-inline-item"><a class="page-link" href="#">3</a></li>
				    <li class="list-inline-item">
				      <a href="#"><span aria-hidden="true">&raquo;</span></a>
				    </li>
				  </ul>
				</nav>  
	          
	  		</div>      
	  </div>
	</div>
</body>
</html>
