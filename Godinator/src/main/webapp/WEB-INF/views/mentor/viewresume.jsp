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
history.forward();
$(function(){
	<%-- 이전 페이지 --%>
	$('.back').click(function(){
		history.back();
	});
	
	<%-- 목록 페이지 --%>
	$('.list').click(function(){
		$('#pg').val('');
		$('#state').val('${state}');
		$('#schoolCate1').val('${schoolCate1}');
		$('#list').attr("method", "GET").attr("action", "${root}/resume/resumelist").submit();
	});
	
	<%-- 첨삭 내용보기 --%>
	$('#edit').click(function(){
		var state = $('#state').val();
		var schoolCate1 = $('#schoolCate1').val();
		location.href = "${root}/resume/viewresume?pseq=" + ${editDto.boardNo} + "&state=" + state + "&schoolCate1=" + schoolCate1;
		return false;
	});
});
</script>
		<%-- Content --%>
		<section>
			<%-- 버튼 --%>
			<div>
				<c:choose>
					<c:when test="${editDto.pseq == 0}">
				<label style="font-size: 1.7em;"><i class="far fa-file-alt"></i>&nbsp;${editDto.boardSubject.replace('<', '&lt')}</label>
					</c:when>
					<c:otherwise>
				<label style="font-size: 1.7em;"><i class="far fa-edit"></i>&nbsp;${editDto.boardSubject.replace('<', '&lt')}</label>
					</c:otherwise>
				</c:choose>
				<div style="float: left; margin-top: 1em;">
					<c:if test="${editDto.pseq == 0 && editDto.state == '1'}">
					<ul class="actions">
						<li><input type="submit" value="첨  삭  글" class="primary small" id="edit"/></li>
					</ul>
					</c:if>
				</div>
				<div style="float: right; margin-top: 1em;">
					<ul class="actions">
						<li><input type="submit" value="목    록" class="small list" /></li>
						<li><input type="reset" value="이    전" class="primary small back"/></li>
					</ul>
				</div>
			</div>
			<div class="col-12" style="margin-top: 8em; margin-bottom: 1em; text-align: left;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">${editDto.bSchoolName}&nbsp;&nbsp;║&nbsp;&nbsp;<c:choose><c:when test="${editDto.bSchoolCate1 != 'h'}">${fn:split(editDto.bSchoolCate2, '||')[0]}&nbsp;&nbsp;║&nbsp;&nbsp;${fn:split(editDto.bSchoolCate2, '||')[1]}</c:when><c:otherwise>${editDto.bSchoolCate2}</c:otherwise></c:choose></label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box">
				<p>${editDto.boardContent}</p>
			</div>
			<div style="float: right; margin-top: 1em;">
				<ul class="actions">
					<li><input type="submit" value="목    록" class="small list" /></li>
					<li><input type="reset" value="이    전" class="primary small back"/></li>
				</ul>
			</div>
		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>