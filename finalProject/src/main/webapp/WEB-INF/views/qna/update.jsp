<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Q&A 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url: "json_q_selectOne.do",
				data: {qna_num : ${param.qna_num}},
				method: 'GET',
				dataType: 'json',
				success: function(vo){
					console.log('ajax...success:', vo);
					let category = '';
					
					if (vo.qna_category === 1) {
						category = '계정문의';
				  } else if (vo.qna_category === 2) {
					  category = '채팅, 알림문의';
				  } else if (vo.qna_category === 3) {
					  category = '거래문의';
				  } else if (vo.qna_category === 4) {
					  category = '광고문의';
				  }else if (vo.qna_category === 5){
					  category = '기타문의';
				  }
					
					$('#title').val(vo.qna_title);
					$('#content').text(vo.qna_content);
					$('#category').val(vo.qna_category);

				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
			
			//Q&A 폼 유효성 검사
			$('.finish-btn').click(function() {
				if($('#category').val() === '카테고리') {
					event.preventDefault();
					alert("카테고리를 선택해주세요.");
				} else if ($('#title').val() === '') {
					event.preventDefault();
					alert("제목을 입력해주세요.");
				} else if ($('#content').val() === '') {
					event.preventDefault();
					alert("문의할 내용을 작성해주세요.");
				}
			});
		}); //load
		
		
	</script>
	
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
		    	<li class="fw-bold"><a href="q-selectAll.do">내 Q&A 목록</a></li>
		    </ul>
   		</div>
   		<div class="col-md-9 col-lg-10 px-5">
      	<div class="row">
      		<div class="col fs-5 fw-bold">Q&A 수정</div>
     			<hr class="mt-3">
      	</div>
      	<form action="q-updateOK.do" method="get">
	 				<div class="row py-3 align-items-center justify-content-center">
						<div class="col-md-5 col-lg-3">
							<select id="category" class="form-select" aria-label="Default select example">
								<option>카테고리</option>
							  <option value="1">계정문의</option>
							  <option value="2">채팅, 알림문의</option>
							  <option value="3">거래문의</option>
							  <option value="4">광고문의</option>
							  <option value="5">기타문의</option>
							</select>
						</div>
						<div class="col-md-7 col-lg-9">
							<div>
							  <input type="text" id="title" class="form-control" placeholder="제목">
							</div>
						</div>
	   			</div>
	   			<div class="row">
	   				<div class="col">
				  		<textarea id="content" class="form-control" placeholder="내용을 입력해주세요" style="height: 200px"></textarea>
	   				</div>
	   			</div>
	   			<div class="row">
	   				<div class="col mt-3 d-flex justify-content-end">
				  		<button class="finish-btn">수정하기</button>
	   				</div>
	   			</div>
   			</form>
   			
  		</div>      
  	</div>
	</div>
</body>
</html>
