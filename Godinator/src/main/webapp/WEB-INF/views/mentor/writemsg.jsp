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
	
	$('#save').click(function(){
		if($('#subject').val() == '') {
			alert('제목을 입력하세요.');
		} else if($('#content').val() == '') {
			alert('내용을 입력하세요.');
		} else {
			if(confirm('${rcp}님에게 쪽지를 전송합니다.')) {
				$.ajax({
					url: '${root}/msg/writemsg',
					type: 'POST',
					data: $('form').serialize(),
					success: function(response){
						if(response == '1') {
							alert('쪽지가 전송되었습니다.');
							window.close();
						} else {
							alert('전송에 실패하였습니다. 나중에 다시 시도하세요.');
						}
					}
				});
			}
		}
		return false;
	});
	
	$('#cancle').click(function(){
		if(confirm('쪽지 작성을 취소하시겠습니까?')) {
			window.close();
		} else {
			return false;
		}
	});
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
					<label style="font-size: 1.7em;">쪽지 보내기</label>
				</div>
				<div class="col-12" style="margin-top: 4em; margin-bottom: 1em; text-align: left;">
					<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">TO&nbsp;:&nbsp;&nbsp;${rcp}</label>
					<hr class="major" style="margin-top: 0;"/>
				</div>
				<form method="post" action="#">
					<input type="hidden" name="rcp" value="${rcp}">
					<div class="row gtr-uniform">
						<%-- 쪽지 --%>
						<div class="col-12">
							<textarea style="resize: none;" name="subject" id="subject" placeholder="제목을 입력하세요" rows="1"></textarea>
						</div>
						<div class="col-12">
							<textarea style="resize: none;" name="content" id="content" placeholder="내용을 입력하세요" rows="10"></textarea>
						</div>
						<%-- 버튼 --%>
						<div class="col-12">
							<div style="float: right;">
								<ul class="actions">
									<li><input type="submit" id="save" value="전    송" class="primary" /></li>
									<li><input type="reset" id="cancle" value="취    소" /></li>
								</ul>
							</div>
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