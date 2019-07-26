<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
</style>
<script>
$(function(){
	<%-- 권한 확인 --%>
	$.ajax({
		url: '${root}/mentor/checkAuth',
		success: function(response){
			if(response == '-1') {
				if(confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?')){
					location.href = '${root}/login';
				} else {
					history.back();
				}
			}
			if(response == '0') {
				if(confirm('멘토 권한이 없습니다. 회원수정 페이지로 이동하시겠습니까?')){
					location.href = '${root}/user/modify_1';
				} else {
					history.back();
				}
			}
		}
	});
	
	$('#saveBtn').click(function(){
		if($('#boardSubject').val() == ''){
			alert('제목을 입력하세요.');
		} else if($('#boardContent').val() == ''){
			alert('내용을 입력하세요.');
		}  else {
			if(confirm('저장 완료된 첨삭은 삭제할 수 없습니다. 작성한 첨삭을 저장하시겠습니까?')) {
				var param = $('#mentorForm').serialize();
				$.ajax({
					url: '${root}/resume/writeedit',
					type: 'POST',
					data: param,
					success: function(response) {
						if(response == '2') {
							alert('첨삭 저장이 완료되었습니다. 목록 페이지로 이동합니다.');
							location.href = '${root}/resume/editlist';
						} else {
							alert('서버 문제로 인하여 첨삭 저장에 실패하였습니다. 나중에 다시 시도하세요.');
						}
					}
				});
			}
		}
		return false;
	});

	<%-- #### 취소 #### --%>
	$('#cancleBtn').click(function(){
		if(confirm('자소서 작성을 취소하시겠습니까?')) {
			history.back();
		} else {
			return false;
		}
	});
	
	
});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">자소서 첨삭</label>
			</header>
			<div style="margin-top: 5em; text-align: right;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">${editDto.bSchoolName}&nbsp;&nbsp;║&nbsp;&nbsp;<c:choose><c:when test="${editDto.bSchoolCate1 != 'h'}">${fn:split(editDto.bSchoolCate2, '||')[0]}&nbsp;&nbsp;║&nbsp;&nbsp;${fn:split(editDto.bSchoolCate2, '||')[1]}</c:when><c:otherwise>${editDto.bSchoolCate2}</c:otherwise></c:choose></label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box" style="background-color: rgb(229, 229, 229); height: 250px; overflow-y: auto;">
				<p><strong>제  목</strong></p>
				<p>${editDto.boardSubject}</p>
				<p></p>
				<p><strong>내  용</strong></p>
				<p>${editDto.boardContent}</p>
			</div>
			<!-- Form -->
			<form method="post" action="#" id="mentorForm">
				<input type="hidden" id="bSchoolName" name="bSchoolName" value="${editDto.bSchoolName}">
				<input type="hidden" id="bSchoolCode" name="bSchoolCode" value="${editDto.bSchoolCode}">
				<input type="hidden" id="bSchoolCate1" name="bSchoolCate1" value="${editDto.bSchoolCate1}">
				<input type="hidden" id="bSchoolCate2" name="bSchoolCate2" value="${editDto.bSchoolCate2}">
				<input type="hidden" id="pseq" name="pseq" value="${pseq}">
				<input type="hidden" id="menteeId" name="menteeId" value="${editDto.bUserId}">
				<div class="row gtr-uniform">
				
					<%-- 첨삭 --%>
					<div class="col-12">
						<textarea style="resize: none;" name="boardSubject" id="boardSubject" placeholder="제목을 입력하세요" rows="1">RE: </textarea>
					</div>
					<div class="col-12">
						<textarea style="resize: none;" name="boardContent" id="boardContent" placeholder="내용을 입력하세요" rows="15"></textarea>
					</div>
					<%-- 버튼 --%>
					<div class="col-12">
						<div style="float: right;">
							<ul class="actions">
								<li><input type="submit" id="saveBtn" value="저    장" class="primary" /></li>
								<li><input type="reset" id="cancleBtn" value="취    소" /></li>
							</ul>
						</div>
					</div>
				</div>
			</form>

		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>