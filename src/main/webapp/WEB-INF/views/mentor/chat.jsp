<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="other" value="${(mentee != null) ? mentee : mentor}"/>
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
</style>
<script>
$(function(){
	var wsocket;
	connect();


	$('#sendmsg').click(function(){
		if($('#msg').val().trim() != '') {
			sendMsg();
		}
		return false;
	});
	
	$('#msg').keypress(function(e) {
		if (e.which == 13 && $('#msg').val().trim() != '') {
			sendMsg();
			return false;
		}
	});

	$('#back').click(function(){
		var cate = '${sessionScope.oncate}';
		if(cate == 'm') {
			location.href = "${root}/chat/connmentee";
		} else {
			location.href = "${root}/chat/connmentor";
		}
		return false;
	});
	
	<%-- 웹소켓 통신 연결 --%>
	function connect(){
		wsocket = new WebSocket("ws://192.168.14.49:80/godinator/startchat");
		wsocket.onmessage = onMessage;
	}
	
	<%-- 웹소켓 응답 처리 --%>
	function onMessage(evt) {
		var data = evt.data;
		var msg = data.split('#!#!#');
		if(msg[0] == 'msg') {
			var temp = ((msg[1] == '${other}') ? '<span style="color: blue;">' + msg[1] + '님 : </span>' : msg[1] + '님 : ');
			$('#chatcontent').append(temp + msg[2] + '<br>');
		} else if(msg[0] == 'disconn') {
			$('#chatcontent').append('<span style="color: red;">' + msg[2] + '님이 접속을 종료하였습니다.</span><br>');
			$('#sendmsg').attr("disabled","disabled");
			$('#msg').attr("disabled","disabled");
		} else if(msg[0] == 'stay') {
			$('#chatcontent').append('상대방의 접속을 기다리는 중입니다...<br>');
		} else if(msg[0] == 'conn') {
			$('#chatcontent').append((msg[2] != '${other}') ? '<span style="color: blue;">' + msg[2] + '님이 접속하였습니다. </span><br>' : msg[2] + '님이 접속하였습니다.<br>');
		}
	}

	<%-- 메시지 전송 --%>
	function sendMsg() {
		var message = $('#msg').val().trim();
		wsocket.send('msg#!#!#${other}#!#!#' + message);
		$('#msg').val('');
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
					<label style="font-size: 1.7em;">${(mentee != null) ? '멘티' : '멘토'}와의 채팅</label>
					<div class="col-2" style="float: right;">
						<ul class="actions">
							<li><input type="button" id="back" value="돌아가기" class="primary" /></li>
						</ul>
					</div>
				</div>
				<div class="col-12" style="margin-top: 5em; margin-bottom: 1em; text-align: left;">
					<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">WITH. ${other}</label>
					<hr class="major" style="margin-top: 0;"/>
				</div>
				<form method="post" onsubmit="return false;" action="#">
					<%-- 채팅내용 --%>
					<div class="col-12" >
						<div class="box" id="chatcontent" style="height: 300px; overflow-y: auto; overflow-x:hidde">
						</div>
					</div>
					<div class="row gtr-uniform">
						<div class="col-10">
							<input type="text" id="msg" placeholder="내용을 입력하세요">
						</div>
						<div class="col-2">
							<ul class="actions">
								<li><input type="button" id="sendmsg" value="전    송" class="primary" /></li>
							</ul>
						</div>
					</div>
				</form>
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