<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<c:set var="srch" value="${parameter.pg}"/>
<c:set var="srch" value="${parameter.srch}"/>
<c:set var="msgCate" value="${parameter.msgCate}"/>
<c:set var="srcCate" value="${parameter.srcCate}"/>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
</style>
<script>
$(function(){
	$('.list').click(function(){
		$('#list').attr("method", "GET").attr("action", "${root}/msg/msgbox").submit();
		return false;
	});
	$('.back').click(function(){
		history.back();
	});
	
	$('.answer').click(function(){
		var rcp = $(this).text();
		if(confirm(rcp + '님에게 보낼 쪽지를 작성하시겠습니까?')) {
			window.open("${root}/msg/writemsg?rcp=" + rcp, "_blank", "width=600, height=700, left=500, top=20");
			return false;
		}
		return false;
	});
	
	<%-- 마우스 커서 변경 --%>
	$(document).on('mouseover', '.answer', function(){
		$(this).css('cursor', 'pointer');
	});
});
</script>
		<%-- Content --%>
		<section>
			<form id="list">
				<input type="hidden" name="seq" id="seq">
				<input type="hidden" name="pg" id="pg" value="${pg}">
				<input type="hidden" name="srch" id="srch" value="${srch}">
				<input type="hidden" name="msgCate" id="msgCate" value="${msgCate}">
				<input type="hidden" name="srcCate" id="srcCate" value="${srcCate}">
			</form>
			<%-- 버튼 --%>
			<div>
				<label style="font-size: 1.7em;"><i class="far fa-envelope-open"></i>&nbsp;FROM&nbsp;:&nbsp;&nbsp;<span class="answer">${msg.sendId}</span></label>
				<div style="float: right; margin-top: 1em;">
					<ul class="actions">
						<li><input type="submit" value="목    록" class="small list" /></li>
						<li><input type="reset" value="이    전" class="primary small back"/></li>
					</ul>
				</div>
			</div>
			<div class="col-12" style="margin-top: 8em; margin-bottom: 1em; text-align: left;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">${msg.msgTitle}</label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box">
				<p>${msg.msgContent}</p>
			</div>
			<div style="float: right; margin-top: 1em;">
				<ul class="actions">
					<li><input type="submit" value="목    록" class="small list" /></li>
						<li><input type="reset" value="이    전" class="primary small back"/></li>
				</ul>
			</div>
		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>