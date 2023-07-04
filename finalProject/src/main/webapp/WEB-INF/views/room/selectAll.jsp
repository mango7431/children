<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>채팅목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/roomSelectOne.css">
	
<!-- 디자인 : https://bootsnipp.com/snippets/1ea0N -->

<script type="text/javascript">
	
	$(function(){
		var currentStompConnection = null;
		$('.chat_list').click(function(){
			var roomNum = $(this).data('roomnum');
			var user_id = '${user_id}';
			console.log('chat_list click ',roomNum);
			console.log('user_id : ',user_id);
			
			
			if (currentStompConnection !== null) {
		        currentStompConnection.disconnect();
		        currentStompConnection = null;
		        $(".msg_send_btn").off("click");
		    }

				var sockJs = new SockJS('/idle/chat/'+roomNum+'/info');
				var stomp = Stomp.over(sockJs);
				currentStompConnection = stomp;
				
				stomp.connect({},function(frame){
					console.log('Connected : '+frame);
					console.log('연결 성공!');
					
					$('.msg_history').empty();
					
					$.ajax({
						url:"json_message_selectAll.do",
						data:{room_num:roomNum},
						method:'GET',
						dataType:'json',
						success:function(vos){
							console.log('ajax success:',vos);
							
							let str = ``;
							
							$.each(vos,function(index,vo){
								let date = new Date(vo.message_date).toLocaleString();
								if (vo.sender === user_id) {
									str += `
										<div class="outgoing_msg">
							              <div class="sent_msg">
							             	<div align="right">\${vo.sender}</div>
							                <p>\${vo.message}</p>
							                <span class="time_date">\${date}</span> </div>
							            </div>
									`;
								} else {
									str += `
										<div class="incoming_msg">
							              <div class="incoming_msg_img"> <img src="resources/img/thumb_\${vo.sender_savename }"> </div>
							              <div class="received_msg">
							              	<p>\${vo.sender}</p>
							                <div class="received_withd_msg">
							                  <p>\${vo.message}</p>
							                  <span class="time_date">\${date}</span></div>
							              </div>
							            </div>
									`;
								}
							});
							$('.msg_history').append(str);
							
						},
						error:function(xhr,status,error){
							console.log('xhr:',xhr.status);
						}
					});
					
					
					stomp.subscribe("/sub/chat/room/" + roomNum, function(message) {
						console.log(message);
						var msg = JSON.parse(message.body);
						
						let str = ``;
						
						let date = new Date(msg.message_date).toLocaleString();
						
						let imgnum = jQuery('#'+roomNum).attr("src");
						console.log(imgnum);

						if (msg.sender === user_id) {
							
							str += `
								<div class="outgoing_msg">
					              <div class="sent_msg">
					              	<div align="right">\${msg.sender}</div>
					                <p>\${msg.message}</p>
					                <span class="time_date">\${date}</span> </div>
					            </div>
							`;
							$('.msg_history').append(str);

						} else {
							str += `
								<div class="incoming_msg">
					              <div class="incoming_msg_img"> <img src="\${imgnum}"> </div>
					              <div class="received_msg">
					              	<p>\${msg.sender}</p>
					                <div class="received_withd_msg">
					                  <p>\${msg.message}</p>
					                  <span class="time_date">\${date}</span></div>
					              </div>
					            </div>
							`;
							$('.msg_history').append(str);
							
							prepareScroll();
						}
					});
					prepareScroll();
					
				});
				
				$(".msg_send_btn").on("click", function(e) {
					var msg = document.getElementById("msg");

					console.log(user_id + " : " + msg.value);
					stomp.send('/pub/chat/message', {}, JSON.stringify({
						room_num : roomNum,
						message : msg.value,
						sender : user_id
					}));
					msg.value = '';
					prepareScroll();
				});	
		});
		
		$('#msg').keyup(function(event){
			if(event.which === 13){
				$("#bt").click();
			}
		});
	});
	
	function scrollUI(){
		let chatUI = document.querySelector('.msg_history');
		chatUI.scrollTop = chatUI.scrollHeight;
	}
	
	function prepareScroll() {
		  window.setTimeout(scrollUI, 50);
		}
	
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<section style="padding-left: 100px; padding-right: 100px;">
	<div class="container">
<h3 class=" text-center">채팅</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>채팅목록</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
			<div class="inbox_chat">
				<c:forEach var="vo" items="${vos }">
					<div class="chat_list" data-roomnum="${vo.room_num }">
						<div class="chat_people">
							<div class="chat_img">
								<img src="resources/img/thumb_${vo.member_savename }" id="${vo.room_num }">
							</div>
							<div class="chat_ib">
								<c:if test="${user_id eq vo.buyer }">
									<h5>${vo.seller }
										<span class="chat_date">${vo.room_date }</span>
									</h5>
								</c:if>
								<c:if test="${user_id eq vo.seller }">
									<h5>${vo.buyer }
										<span class="chat_date">${vo.room_date }</span>
									</h5>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
        
        <div class="mesgs">
        
          <div class="msg_history" id="scroll">
            
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" id="msg"/>
              <button class="msg_send_btn" type="button" id="bt"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
          
        </div>
      </div>
      
    </div></div>
	</section>
</body>
</html>