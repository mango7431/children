<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<title>판매 목록</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload....",'${vos.size()}');
	
	for(let i=0;i<'${vos.size()}';i++){
			
		$("#flexSwitchCheckDefault"+i).click(function(){
			
			console.log(i,$(this).is(":checked"),$("#span"+i).text());	
			hideCheck($(this).is(":checked"),$("#span"+i).text());
		});
	}
	
	
});

function hideCheck(isChecked,board_num){
	console.log("hideCheck....",isChecked,board_num);
	
	$.ajax({
		url : "jsonhideCheck.do",
		data:{
			isChecked:isChecked,
			board_num:board_num
			},
		method:'GET',
		dataType:'json',
		success : function(obj) {
			console.log('ajax...success:', obj);
			
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
}//end idCheck()...
</script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>판매 목록</h1>
	<a href="buyselectAll.do?buy_num=${param.buy_num}" class="myButton" style="float: left;">구매 목록</a>
	
	<table id="noticeList">
	<thead>
		<tr>	
			<th>판매 번호</th>
			<th>게시글 번호</th>
			<th>상대방 ID</th>
			<th>토글</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}" varStatus="status">
			<tr>
				<td>${vo.sell_num}</td>
				<td><a href="boardSelectOne.do?board_num=${vo.board_num}"><span id="span${status.index}">${vo.board_num}</span></a></td>
				<td>${vo.id}</td>
				<td>
					<div>
					<div class="form-check form-switch" style="display: inline-block">
	  					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault${status.index}">
	 					<label class="form-check-label" for="flexSwitchCheckDefault" style="font-size:15px; float:left;">비공개</label>
					</div>
					<div class="form-check form-switch" style="display: inline-block">
	  					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
	 					<label class="form-check-label" for="flexSwitchCheckChecked" style="font-size:15px; float:left;">판매완료</label>
					</div>
					<a href="sellUpdate.do?sell_num=${param.sell_num}" class="myButton" style="display: inline-block">상위로 이동</a>
					<a href="sellDeleteOK.do?sell_num=${param.sell_num}" class="myButton" style="display: inline-block">삭제</a>
					</div>
				</td>
				
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">[
					<c:forEach var="i" begin="1"
							end="${totalPageCount }" step="1">
							<a href="sellselectAll.do?cpage=${i }${params}">${i }</a>&nbsp;
					</c:forEach>
			]</td>
		</tr>
	</tfoot>
	</table>

</body>
</html>