<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<%@ include file="/WEB-INF/views/mentor/common.jsp" %>
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
					location.href = '${root}/view/user/login.jsp';
				} else {
					history.back();
				}
			} else if(response == '2') {
				alert('멘티 권한이 없습니다. 이전 페이지로 이동합니다.');
				history.back();
			} else {
				init();
			}
		}
	});
	
	<%-- select 이벤트 --%>
	$('#stateSel').change(function(){
		$('#pg').val('');
		$('#state').val($(this).val());
		$('#schoolCate1').val('${schoolCate1}');
		$('#list').attr("method", "GET").attr("action", "${root}/resume/resumelist").submit();
		return false;
	});
	$('#schoolCate1Sel').change(function(){
		$('#pg').val('');
		$('#state').val('${state}');
		$('#schoolCate1').val($(this).val());
		$('#list').attr("method", "GET").attr("action", "${root}/resume/resumelist").submit();
		return false;
	});
	
	<%-- 자소서 내용보기 --%>
	$('.resumeBtn').click(function(){
		var seq = $(this).attr('data-seq');
		var state = $('#state').val();
		var schoolCate1 = $('#schoolCate1').val();
		location.href="${root}/resume/viewresume?seq=" + seq + "&state=" + state + "&schoolCate1=" + schoolCate1;
		return false;
	});
	
	<%-- 페이지 이동 --%>
	$('.apage').click(function(){
		$('#pg').val($(this).text());
		$('#state').val('${state}');
		$('#schoolCate1').val('${schoolCate1}');
		$('#list').attr("method", "GET").attr("action", "${root}/resume/resumelist").submit();
		return false;
	});
	$('.pageBtn').click(function(){
		$('#pg').val($(this).attr('data-pg'));
		$('#state').val('${state}');
		$('#schoolCate1').val('${schoolCate1}');
		$('#list').attr("method", "GET").attr("action", "${root}/resume/resumelist").submit();
		return false;
	});
	
	<%-- 마우스 커서 변경 --%>
	$('.resumeBtn').css('cursor', 'pointer');
	$('.editBtn').css('cursor', 'pointer');
	$('.apage').css('cursor', 'pointer');
	
	<%-- function --%>
	function init() {
		$('#stateSel').val('${state}').prop("selected", true);
		$('#schoolCate1Sel').val('${parameter.schoolCate1}').prop("selected", true);
	}
});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">자소서 목록</label>
			</header>
			<%-- 자소서&첨삭 분류 --%>
			<div class="row gtr-uniform" style="margin: 0 0 3em 0; padding-right:0;">
				<div class="col-2" style="width:8em; padding-left: 0;">
					 <select name="stateSel" id="stateSel">
						<option value="5">- 상태 -</option>
						<option value="0">첨삭대기</option>
						<option value="1">첨삭완료</option>
					</select>
				</div>
				<div class="col-2" style="width:10em; padding-left: 0; margin-left: 1em;"> 
					<select name="schoolCate1Sel" id="schoolCate1Sel" >
						<option value="h">고등학교</option>
						<option value="u">대학교</option>
					</select>
				</div>
			</div>
			<%-- 자소서&첨삭 목록 --%>
			<div>
				<table class="table-wrapper" style="text-align: center;">
					<col width="10%">
					<col width="24%">
					<col width="42%">
					<col width="12%">
					<col width="12%">
					<thead>
						<tr>
							<th></th>
							<th width="10%" style="text-align: center;">학교명</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">멘토ID</th>
							<th style="text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(resumelist) != 0}">
							<c:forEach var="resume" items="${resumelist}">
						<tr class="resumeBtn" data-seq="${resume.boardNo}" data-pseq="${resume.pseq}">
							<td>${(resume.pseq == 0) ? ((resume.state == '0') ? '첨삭대기' : '✔') : '↳'}</td>
							<td>${resume.bSchoolName}</td>
							<td style="text-align: left;">${resume.boardSubject}</td>
							<td>${resume.mentorId}</td>
							<td>${resume.bPostdate}</td>
						</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" align="center" style="padding-top: 4em;">
								<ul class="pagination">${navigator.navigator}</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>


		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>