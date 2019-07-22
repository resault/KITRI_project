<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${root}/css/main.css" />
<%-- font-awesome --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>
<script>
$(function(){
	
	var wsocket;
	connect();

	<%-- 웹소켓 통신 연결 --%>
	function connect(){
		wsocket = new WebSocket("ws://183.101.196.136:80/godinator/connchat");
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	
	<%-- 멘티에게 채팅요청 온 경우 --%>
	function onMessage(evt) {
		var data = evt.data;
		var msg = data.split('#!#!#');
		$('#mentee').val(msg[2]);
		if(msg[0] == "ask") {
			$('#myModal').find('p').empty();
			$('#myModal').find('p').text(msg[2] + '님의 채팅 요청을 수락하시겠습니까?');
			$('#myModal').css("display", "block");
		}
	}
	
	<%-- 채팅요청 응답 처리 --%>
	$(document).on('click', '.answer', function(){
		var a = $(this).attr('data-cate'); <%-- 수락:y, 거절:n --%>
		wsocket.send('answer#!#!#' + $('#mentee').val() + '#!#!#' + a);
		$('#myModal').css("display", "none");
		if(a == 'y') {
			$('#chatForm').submit();
		}
		return false;
	});
	
	<%-- 웹소켓 종료 --%>
	function onClose(evt) {
		alert('채팅 접속이 종료되었습니다.');
		window.close();
	}
	
});
</script>
</head>
<body style="padding: 0; margin: 0;">
	<div id="wrapper" style="padding: 0;">
		<!-- Main -->
		<div id="main" style="padding: 0; margin: 0;">
			<div class="inner">
				<%-- Content --%>
				<div style="margin-top: 3em;">
					<label style="font-size: 1.7em;">채팅 대기</label>
				</div>
				<%-- 멘토 목록 --%>
				<input type="hidden" id="selectedMentor" name="selectedMentor">
				<div style="height: 300px; overflow-y: auto; border: thin solid;">
					<p>멘티의 채팅 신청을 기다리는 중입니다...</p>
				</div>
			</div>
		</div>
	</div>
	<form action="${root}/chat/startchat" id="chatForm">
		<input type="hidden" id="mentee" name="mentee">
	</form>
	<div id="myModal" class="modal">
	 
	      <!-- Modal content -->
	      <div class="modal-content">
	        <div class="close">&times;</div>                                                               
	        <p></p>
	        <div style="text-align: center;">
	        	<button class="answer" data-cate="n">거절</button>
	        	<button class="answer" data-cate="y">수락</button>
	        </div>
	      </div>
	 
	    </div>
	<!-- Scripts -->
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/browser.min.js"></script>
	<script src="${root}/js/breakpoints.min.js"></script>
	<script src="${root}/js/util.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>