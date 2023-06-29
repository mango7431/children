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
			var urlParams = new URLSearchParams(window.location.search);
			var category = "";
			if (urlParams.get('category') === "전체") {
				category = 0;
			}
			
			var category = urlParams.get('category');
			
			renderQnAList(category);
			
			$(".q-category").on("click", function(){
				$(".q-category").removeClass('selected');
				$(this).addClass('selected');
				category = $(this).text();
				
				if (category === '계정문의') {
					category = 1;
			  } else if (category === '채팅, 알림문의') {
				  category = 2;
			  } else if (category === '거래문의') {
				  category = 3;
			  } else if (category === '광고문의') {
				  category = 4;
			  } else if (category === '기타문의'){
				  category = 5;
			  } else if (category === '전체'){
				  category = 0;
			  }
				
				urlParams.set('category', category);
        var newUrl = window.location.pathname + '?' + urlParams.toString();
        
        window.history.replaceState({}, '', newUrl);
				
				renderQnAList(category);
			});
			
		}); //load
		
		function renderQnAList(category){
			$.ajax({
				url: "json_q_selectAll.do",
				data: {writer: "tester1",
							 category: category
				},
				method: 'GET',
				dataType: 'json',
				success: function(vos){
					console.log('ajax...success:', vos);
					let tag_vos = '';
					let status = '';
					let category = '';
					let date = '';

					// 날짜 형식 지정
					var formattedDate = date.toLocaleString();
					
					$.each(vos, function(index, vo) {
						if (vo.qna_status === 1) {
							status = '미답변';
					  } else if (vo.qna_status === 2) {
						  status = '답변완료';
					  }
						status = vo.qna_status === 1 ? '미답변' : '답변완료';
						
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
						
						date = new Date(vo.qna_date);
						let formattedDate = date.toLocaleString();
						
					  tag_vos += `
					    <tr>
					      <th scope="row" class="text-center">\${vo.qna_num}</th>
					      <td>
					      	<a href="q-selectOne.do?qna_num=\${vo.qna_num}">
						        <div class="fs-5"><span class="q-status fw-bold me-2">\${status}</span>\${vo.qna_title}</div>
						        <div class="mt-3">\${category}</div>
						        <div class="mt-2">\${formattedDate}</div>
						      </a>
					      </td>
					    </tr>
					  `;
					});
					
					$("#vos").html(tag_vos);
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
		}
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
	   		<div class="col-md-9 col-lg-10">
	      	<div class="row">
	      		<div class="col-md-6 fs-5 fw-bold">Q&A 목록</div>
	      		<div class="col-md-6 text-end"><a href="#">글쓰기</a></div>
      			<hr class="mt-2">
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
				      <th scope="col" class="col-2 text-center">글번호</th>
				      <th scope="col" class="col-10 text-center">내용</th>
				    </tr>
				  </thead>
				  <tbody id="vos">

				  </tbody>
				</table>
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>  
	          
	  		</div>      
	  	</div>
		</div>
	</div>
</body>
</html>
