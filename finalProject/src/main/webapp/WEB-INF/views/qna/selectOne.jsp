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
			$.ajax({
				url: "jsonQnaSelectOne.do",
				data: {qna_num : ${param.qna_num}},
				method: 'GET',
				dataType: 'json',
				success: function(vo){
					console.log('ajax...success:', vo);
					let status = '';
					let category = '';

					let date = new Date(vo.qna_date);
					let formattedDate = date.toLocaleString();
					
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
						
					let tag_vo = `
	    				<div class="fs-4 mb-2"><span class="q-status fs-5 fw-bold me-2">\${status}</span>\${vo.qna_title}</div>
	    				<div><span>\${category}</span><span class="ms-3">\${formattedDate}</span></div>
	    				<hr class="my-3">
	    				<div>\${vo.qna_content}</div>
				  `;
					
					$("#vo").html(tag_vo);
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
			
			$('.delete-btn').click(function(event) {
	            event.preventDefault();
	            var confirmDelete = confirm("정말로 삭제하시겠습니까?");
	            if (confirmDelete) {
	                window.location.href = $(this).attr('href');
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
		    	<li class="fw-bold"><a href="qnaSelectAll.do">내 Q&A 목록</a></li>
		    </ul>
   		</div>
   		<div class="col-md-9 col-lg-10 px-5">
      	<div class="row">
      		<div class="col-md-6 fs-5 fw-bold">Q&A</div>
      		<div class="col-md-6 text-end">
      			<a href="qnaUpdate.do?qna_num=${param.qna_num}">수정하기</a>
      			<a href="qnaDeleteOK.do?qna_num=${param.qna_num}" class="ms-3 delete-btn">삭제하기</a>
      		</div>
     			<hr class="mt-3">
      	</div>
 				<div class="row q-detail py-3" id="vo">

   			</div>
   			
   			<div id="answer">
   				<div>답변</div>
	 				<div class="row q-detail py-3 mt-3" id="vo">
	
	   			</div>
 				</div>
  		</div>      
  	</div>
	</div>
</body>
</html>
