<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 목록</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajax({
			url : "jsonQnaSelectAll.do",
			method:'GET',
			dataType:'json',
			success : function(arr) {
				console.log('ajax...success:', arr);
				
	 			let tag_vos = '';
	 			
	 			$.each(arr,function(index,vo){
	 				tag_vos += `
	 					<tr>
	 					<td>				
	 						<a href="jsonQnaSelectOne.do?qna_num=\${vo.qna_num}">\${vo.qna_num}</a>
	 					</td>
	 					<td>\${vo.qna_status}</td>
	 					<td>\${vo.qna_category}</td>
	 					<td>\${vo.qna_content}</td>
	 					<td>\${vo.writer}</td>
	 					<td>\${vo.qna_date}</td>
	 				</tr>
	 				`;
	 			});
				
				$("#vos").html(tag_vos);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
	});//end onload...

</script>




</head>
<body>
	
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h3>Q&A목록</h3>
	<select name="searchKey" id="searchKey">
		<option value="title">title</option>
		<option value="content">content</option>
	</select>
	<input type="text" name="searchWord" id="searchWord" value="sp">
	<button onclick="searchList()" class="myButton">검색</button>


	<table id="boardList">
		<thead>
			<tr>
				<th>질문번호</th>
				<th>답변여부</th>
				<th>구분</th>
				<th>내용</th>
				<th>작성자</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<tbody id="vos">
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>



