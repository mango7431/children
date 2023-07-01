<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<header class="p-3 mb-3 border-bottom">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
	        </a>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          <li><a href="home.do" class="nav-link px-2 link-secondary">중고링</a></li>
	          <li><a href="#" class="nav-link px-2 link-dark">공지사항</a></li>
	          <li><a href="#" class="nav-link px-2 link-dark">중고거래</a></li>
	          <li><a href="#" class="nav-link px-2 link-dark">채팅목록</a></li>
	        </ul>
	
	        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
	          <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
	        </form>
	               	
	        <div>
	        	<a id="login" href="login.do">로그인</a>
	        	<a id="m_insert" href="memberInsert3.do">회원가입3(최종)</a>
<!-- 	        	<a href="memberInsert1.do">회원가입1</a> -->
<!-- 	        	<a href="memberInsert2.do">회원가입2</a> -->
<!-- 	        	<a href="m_selectAll.do">회원목록test</a> -->
	        </div>
	        <div class="dropdown text-end">
	          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu text-small">
	            <li><a class="dropdown-item" href="#">내 상점</a></li>
	            <li><a class="dropdown-item" href="#">마이페이지</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li id="logout"><a class="dropdown-item" href="logout.do">로그아웃</a></li>
	          </ul>
	        </div>
	      </div>
	    </div>
	    
	    <hr>
	    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	console.log('onload....');

});
	if('${user_id}'===''){//섹션 없을떄(로그인정보 없을때)
		$('#login').show();
		$('#m_insert').show();
		$('#logout').hide();
	
	}else{//섹션 있을떄(로그인정보 있을때)
		$('#login').hide();
		$('#m_insert').hide();
		$('#logout').show();
		
	}
</script>

  </header>