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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url: "jsonMemberSelectAll.do",
				method: 'GET',
				dataType: 'json',
				success: function(vos){
					console.log('ajax...success:', vos);				
					let tag_vos = '';
					$.each(vos, function(index, vo) {
						tag_vos += `
					    <tr>
					      <td scope="row" class="text-center align-middle">\${index+1}</td>
					      <td scope="row" class="text-center align-middle">
					      	<img width="35px" src="resources/uploadimg/\${vo.member_savename}">
					      </td>
					      <td scope="row" class="text-center align-middle">\${vo.id}</td>
					      <td scope="row" class="text-center align-middle">\${vo.name}</td>
					      <td scope="row" class="text-center align-middle">\${vo.address}</td>
					      <td scope="row" class="text-center align-middle">\${vo.member_report}</td>
				    	</tr>
					  `;
					});
					
					$("#vos").html(tag_vos);
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
			
			$("#vos").on("click", "tr", function() {
			    var id = $(this).find("td:nth-child(3)").text(); // ID 값을 가져옴
			    goToDetailPage(id);
			});
			
		});
		
		function goToDetailPage(id) {
			var detailPageUrl = "memberSelectOne.do?id="+id
			window.location.href = detailPageUrl;
		}
	</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">회원목록</div>
		<div class="row justify-content-end">
			<div class="col-2">
		    <select class="form-select" required aria-label="select example">
		      <option selected>선택</option>
		      <option value="아이디">아이디</option>
		      <option value="이름">이름</option>
		    </select>
			</div>
			<div class="col-3">
				<input type="text" class="form-control">
			</div>
			<div class="col-1">
				<button type="button" class="submit-btn">검색</button>
			</div>
		</div>	
		<hr>
		<div class="row">
			<table class="table table-sm">
			  <thead>
			    <tr>
			      <th scope="col" class="col text-center py-3">No.</th>
			      <th scope="col" class="col text-center py-3">프로필</th>
			      <th scope="col" class="col text-center py-3">ID</th>
			      <th scope="col" class="col text-center py-3">이름</th>
			      <th scope="col" class="col text-center py-3">주소</th>
			      <th scope="col" class="col text-center py-3">신고</th>
			    </tr>
			  </thead>
			  <tbody id="vos">
	
			  </tbody>
			</table>
		</div>
	</div>
</body>
</html>
