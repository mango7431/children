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
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			
		}); //load
		
		
	</script>
	
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

	<div class="container">
		<div class="breadcrumb fs-5 fw-bold">내 Q&A 목록</div>
 		<div class="container my-3">
	 		<div class="row">
	     	<div class="col-md-3 col-lg-2">     
			    <ul class="mypage-floating-menu">
			    	<li><a href="#">마이페이지</a></li>
			    	<li><a href="#">회원정보수정</a></li>
			    	<li><a href="#">찜목록</a></li>
			    	<li><a href="#">내 거래 목록</a></li>
			    	<li><a href="#">내동네설정</a></li>
			    	<li class="fw-bold"><a href="#">내 Q&A 목록</a></li>
			    </ul>
	   		</div>
	   		<div class="col-md-9 col-lg-10 px-5">
	      	<div class="row">
	      		<div class="col-md-6 fs-5 fw-bold">Q&A</div>
	      		<div class="col-md-6 text-end">
	      			<a href="#">수정하기</a>
	      			<a href="#">삭제하기</a>
	      		</div>
      			<hr class="mt-3">
	      	</div>
   				<div class="row q-detail py-3">
     				<div class="fs-4"><span>미답변</span>문의사항입니다.</div>
     				<div><span>계정문의</span><span class="ms-3">2022.08.23</span></div>
     				<hr>
     				<div>글내용입니다.</div>
     			</div>
	  		</div>      
	  	</div>
		</div>
	</div>
</body>
</html>
