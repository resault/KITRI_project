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
</style>
<script>
$(function(){
	
	var wsocket;
	connect();
	getOnlineMentors();

	<%-- 채팅장 종료 --%>
	$(window).bind("beforeunload", function(){
		wsocket.close();
	})

	<%-- 채팅 신청 --%>
	$(document).on('click', '.mentor', function(){
		var mentor = $(this).attr('data-id');
		$('#mentor').val(mentor);
		<%-- 선택한 멘토에게 수락요청 --%>
		$.ajax({
			url: "${root}/chat/askChat",
			data: 'mentor=' + mentor,
			async: false,
			success: function(response) {
				if(response != 0) {
					wsocket.send('ask#!#!#' + mentor);
					alert('멘토에게 채팅 요청을 전송하였습니다.');
				} else {
					alser('해당 멘토가 접속을 종료하였습니다.');
				}
			}
		});
		return false;
	});	
	
	
	<%-- #### function #### --%>
	<%-- 웹소켓 통신 연결 --%>
	function connect(){
		wsocket = new WebSocket("ws://192.168.14.49:80/godinator/connchat");
		wsocket.onmessage = onMessage;
		
	}
	
	<%-- 웹소켓 응답 처리 --%>
	function onMessage(evt) {
		var data = evt.data;
		var msg = data.split('#!#!#');
		if(msg[0] == 'answer' && msg[2] == 'y') {
			alert(msg[3] + '님과의 채팅을 시작합니다.');
			$('#chatForm').submit();
		} else if(msg[0] == 'disconn' || msg[0] == 'conn'){ 
			getOnlineMentors();
		}else {
			alert('채팅 요청이 거절되었습니다.');
		}
	}

	
	<%-- 접속 중 멘토 검색 --%>
	$('#school-cate1').change(function(){
		if($(this).val() == '1') {
			$('#hcate2').css('display', '');
			$('#ucate2').css('display', 'none');
			$('#ucate2').val('0').attr('selected', 'selected');
		} else {
			$('#hcate2').css('display', 'none');
			$('#hcate2').val('0').attr('selected', 'selected');
			$('#ucate2').css('display', '');
		}
		getOnlineMentors();
	});
	$('#hcate2, #ucate2').change(function(){
		getOnlineMentors();
	});
	$('#search').click(function(){
		if($('#searchMentor').val().trim() != '') {
			getOnlineMentors();
		}
		return false;
	});
	$('#searchMentor').keypress(function(e) {
		if (e.which == 13 && $(this).val().trim() != '') {
			getOnlineMentors();
		}
	});
	
	<%-- 새로고침 --%>
	$('#refresh').click(function(){
		$('#searchMentor').val('');
		$('#school-cate3').val('id').attr('selected', 'selected');
		$('#hcate2').val('0').attr('selected', 'selected');
		$('#ucate2').val('0').attr('selected', 'selected');
		$('#school-cate1').val('1').attr('selected', 'selected');
		$('#school-cate1').trigger("change");
	});
	
	<%-- 접속중 멘토 목록 --%>
	function getOnlineMentors(){
		var cate1 = $('#school-cate1 option:selected').val();
		var cate2 = (cate1 == '1') ? $('#hcate2 option:selected').val() : $('#ucate2 option:selected').val();
		var cate3 = $('#school-cate3 option:selected').val();
		var search = $('#searchMentor').val().trim();
		var param =  {'cate1': cate1, 'cate2': cate2, 'cate3': cate3, 'search': search};
		$.ajax({
			url: '${root}/chat/list',
			type: 'GET',
			data: param,
			success: function(response){
				var list = JSON.parse(response);
				var cnt = list.length;
				var mentorlist = '';
				for(var i=0;i<cnt;i++) {
					var mentor = list[i];
					mentorlist += '<tr class="mentor" data-id="' + mentor.userId + '">';
					mentorlist += '	<td>' + (i+1) + '</td>';
					mentorlist += '	<td>' + mentor.userId + '</td>';
					if(cate1 == '1') {
						mentorlist += '	<td>' + mentor.hSchoolCode + '</td>';
						mentorlist += '	<td>' + mentor.hSchoolCate + '</td>';
					} else {
						mentorlist += '	<td>' + mentor.uSchoolCode + '</td>';
						mentorlist += '	<td>' + mentor.uSchoolCate + '</td>';
					}
					mentorlist += '</tr>';
				}
				$('#searchMentor').val('');
				$('#school-cate3').val('id').attr('selected', 'selected');
				$('#mentorList').html(mentorlist);
			}
		});
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
					<label style="font-size: 1.7em;">접속중인 멘토</label>
				</div>
				<div class="row gtr-uniform" style="margin-top: 2em;">
					<div class="col-2 col-12-small">
					</div>
					<div class="col-10 col-12-small">
						<div class="col-2 col-12-small" style="padding-left	: 0; float: right;">
							<ul class="actions">
								<li><a href="#" id="search" class="button primary icon"><i class="fas fa-search"></i></a></li>
								<li><a href="#" class="button" id="refresh"><i class="fas fa-redo"></i></a></li>
							</ul>
						</div>
						<div class="col-2" style="padding-left: 0.5em; width: 15em; padding-right: 1em; float: right;">
							<input type="text" name="searchMentor" id="searchMentor" value="" placeholder="검색어를 입력하세요"/>
						</div>
						<div class="col-6" style="padding-left: 0.5em; float: right;">
							 <select name="school-cate3" id="school-cate3">
								<option value="id">ID</option>
								<option value="schoolName">학교명</option>
							</select>
						</div>
						<div style="clear: both;">
						</div>
					</div>
				</div>
				<%-- 학교 분류 --%>
				<div class="row gtr-uniform" style="margin: 0 0 2em 0;">
					<div class="col-2" style="padding-left: 0; width: 10em;">
						 <select name="school-cate1" id="school-cate1" >
							<option value="1">고등학교</option>
							<option value="2">대학교</option>
						</select>
					</div>
					<div class="col-2" style="width: 10em; padding-left: 0; margin-left: 1em;"> 
						 <select name="hcate2" id="hcate2">
							<option value="0">- 전체 -</option>
							<option value="특수목적고등학교">특수목적고등학교</option>
							<option value="일반고등학교">일반고등학교</option>
							<option value="자율고등학교">자율고등학교</option>
							<option value="특성화고등학교">특성화고등학교</option>
						</select>
						 <select name="ucate2" id="ucate2" style="display: none;">
							<option value="0">- 전체 -</option>
							<option value="인문·사회">인문·사회</option>
							<option value="자연·공학">자연·공학</option>
							<option value="의학">의학</option>
							<option value="예술·체육">예술·체육</option>
							<option value="교육">교육</option>
						</select>
					</div>
				</div>
				<%-- 멘토 목록 --%>
				<form action="${root}/chat/startchat" id="chatForm">
					<input type="hidden" id="mentor" name="mentor">
				</form>
				<div style="height: 300px; overflow-y: auto; border: thin solid;">
					<table class="alt" style="text-align: center;">
						<tbody id="mentorList">
						</tbody>
					</table>
				</div>
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