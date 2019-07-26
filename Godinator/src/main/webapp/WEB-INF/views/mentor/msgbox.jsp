<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
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
			} else {
				init();
			}
		}
	});
	
	<%-- select 이벤트 --%>
	$('#msg-cate').change(function(){
		$('#pg').val('');
		$('#msgCate').val($(this).val());
		$('#srcCate').val('0');
		$('#srch').val('');
		$('#list').attr("method", "GET").attr("action", "${root}/msg/msgbox").submit();
		return false;
	});
	
	<%-- 검색 --%>
	$('#srchBtn').click(function(){
		if($('#src-cate').val() != '0') {
			getMsgList('');
		}
		return false;
	});
	$('#search').keypress(function(e) {
		if (e.which == 13 && $(this).val().trim() != '' && $('#src-cate').val() != '0') {
			getMsgList('');
			return false;
		}
	});
	
	<%-- 초기화 --%>
	$('#refresh').click(function(){
		$('#msg-cate').val('0').prop("selected", true);
		$('#msg-cate').trigger("change");
	});
	
	<%-- 전체선택 --%>
	$('#checkAll').click(function(){
		if($(this).prop("checked")) {
			$('.msg').prop('checked', true);
		} else {
			$('.msg').prop('checked', false);
		}
	});
	
	<%-- 마우스 커서 변경 --%>
	$('.editBtn').css('cursor', 'pointer');
	$('.apage').css('cursor', 'pointer');
	$('.msgBtn').css('cursor', 'pointer');
	
	
	<%-- 페이지 이동 --%>
	$('.apage').click(function(){
		$('#pg').val($(this).text());
		$('#list').attr("method", "GET").attr("action", "${root}/msg/msgbox").submit();
		return false;
	});
	$('.pageBtn').click(function(){
		$('#pg').val($(this).attr('data-pg'));
		$('#list').attr("method", "GET").attr("action", "${root}/msg/msgbox").submit();
		return false;
	});
	
	<%-- 쪽지 내용보기 --%>
	$(document).on('click', '.msgBtn', function(){
		$('#seq').val($(this).parent('tr').attr('data-seq'));
		$('#list').attr("method", "GET").attr("action", "${root}/msg/viewmsg").submit();
		return false;
	});
	
	
	<%-- 삭제 --%>
	$('#delBtn').click(function(){
		var seqArr = [];
		var sendIdArr = [];
		var type;
		$("input[name=msg]:checked").each(function(i, e) {
			seqArr[i] = $(this).parents('tr').attr('data-seq'); 
			sendIdArr[i] = $(this).parents('tr').attr('data-sendId'); 
		});
		if(seqArr.length == 0){
			alert('삭제할 항목을 선택하세요.');
			return false;
		} else if ($('#msg-cate').val() != '2') {
			type = 'trash';
		} else {
			type = 'delete';
			if(!confirm('완전 삭제시 되돌릴 수 없습니다. 삭제를 진행하시겠습니까?')) {
				return false;
			}
		}
		$.ajaxSettings.traditional = true;
		$.ajax({
			url: '${root}/msg/' + type,
			data: {seqArr : seqArr, sendIdArr : sendIdArr},
			success: function(response) {
				if(response != "0") {
					alert('선택한 항목이 삭제되었습니다.');
					getMsgList('');
				} else {
					alsert('삭제 작업에 실패하였습니다. 나중에 다시 시도하세요.');
				}
			}
		});
		return false;
	});
	<%-- 복구 --%>
	$('#restoreBtn').click(function(){
		var seqArr = [];
		var sendIdArr = [];
		var type;
		$("input[name=msg]:checked").each(function(i, e) {
			seqArr[i] = $(this).parents('tr').attr('data-seq'); 
			sendIdArr[i] = $(this).parents('tr').attr('data-sendId'); 
		});
		if(seqArr.length == 0){
			alert('복구할 항목을 선택하세요.');
			return false;
		} else {
			$.ajaxSettings.traditional = true;
			$.ajax({
				url: '${root}/msg/restore',
				data: {seqArr : seqArr, sendIdArr : sendIdArr},
				success: function(response) {
					if(response != "0") {
						alert('선택한 항목이 복구되었습니다.');
						getMsgList('');
					} else {
						alsert('복구 작업에 실패하였습니다. 나중에 다시 시도하세요.');
					}
				}
			});
		}
		return false;
	});
	
	<%-- function --%>
	function init(){
		$('#search').val('');
		$('#msg-cate').val('${msgCate}').prop("selected", true);
		$('#src-cate').val('${srcCate}').prop("selected", true);
	}
	function getMsgList(pg){
		$('#pg').val(pg);
		$('#msgCate').val($('#msg-cate').val());
		$('#srcCate').val($('#src-cate').val());
		$('#srch').val($('#search').val().trim());
		$('#list').attr("method", "GET").attr("action", "${root}/msg/msgbox").submit();
	}
});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">쪽지함</label>
			</header>
			<form id="list">
				<input type="hidden" name="seq" id="seq">
				<input type="hidden" name="pg" id="pg" value="${pg}">
				<input type="hidden" name="srch" id="srch" value="${srch}">
				<input type="hidden" name="msgCate" id="msgCate" value="${msgCate}">
				<input type="hidden" name="srcCate" id="srcCate" value="${srcCate}">
			</form>
			<%-- 쪽지함 분류 --%>
			<div class="row gtr-uniform" style="margin: 0 0 1em 0;">
				<div class="col-12" style="padding-left: 0;">
					<div style="float: left; padding-left: 0;">
						 <select name="msg-cate" id="msg-cate">
							<option value="0">받은쪽지</option>
							<option value="1">보낸쪽지</option>
							<option value="2">휴지통</option>
						</select>
					</div>
					<div style="clear: both;">
					</div>
				</div>
			</div>
			<%-- 쪽지 검색 --%>
			<div class="row gtr-uniform" style="margin-top: 2em; margin-bottom: 1em;">
				<div class="col-3 col-12-small">
					<div style="float: left; margin-left: 0.5em;">
						<ul class="actions">
							<li><a href="#" class="button primary icon" id="delBtn"><i class="far fa-trash-alt"></i></a></li>
							<li style="display: ${(msgCate == '2') ? '' : 'none'};"><a href="#" class="button icon" id="restoreBtn"><i class="fas fa-trash-restore-alt"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-9 col-12-small">
					<div class="col-2 col-4-small" style="float: right;">
						<ul class="actions">
							<li><a href="#" class="button primary icon" id="srchBtn"><i class="fas fa-search"></i></a></li>
							<li><a href="#" class="button" id="refresh"><i class="fas fa-redo"></i></a></li>
						</ul>
					<div class="col-0 col-8-small" style="float: right;">
					</div>
					</div>
					
					<div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float: right;">
						<input type="email" name="demo-email" id="search" value="" placeholder="검색어를 입력하세요" />
					</div>
					<div class="col-7 col-7-small" style="float: right;">
						 <select name="src-cate" id="src-cate">
							<option value="0">- 검색조건 -</option>
							<option value="1">ID</option>
							<option value="2">내용</option>
						</select>
					</div>
					<div style="clear: both;">
					</div>
				</div>
			</div>
			<%-- 쪽지 목록 --%>
			<div>
				<table class="table-wrapper" style="text-align: center;">
					<col width="5%">
					<col width="5%">
					<col width="12%">
					<col width="12%">
					<col width="40%">
					<col width="13%">
					<col width="13%">
					<thead>
						<tr>
							<th style="text-align: center;">
								<input type="checkbox" class="msg" id="checkAll" name="checkAll">
								<label for="checkAll" style="padding-left: 0.1em;"></label>
							</th>
							<th></th>
							<th style="text-align: center;">보낸사람</th>
							<th style="text-align: center;">받는사람</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">송신일</th>
							<th style="text-align: center;">수신일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) != 0}">
								<c:forEach var="msg" items="${list}" varStatus="n">
						<tr data-seq="${msg.msgNo}" data-sendId="${msg.sendId}">
							<td>
								<input type="checkbox" class="msg" id="msg${n.count}" name="msg">
								<label for="msg${n.count}" style="padding-left: 0.1em;"></label>
							</td>
							<td class="msgBtn" ><i class="${(empty msg.recvDate) ? 'fas fa-envelope' : 'far fa-envelope-open'}"></i></td>
							<td class="msgBtn" >${msg.sendId}</td>
							<td class="msgBtn" >${msg.recvId}</td>
							<td class="msgBtn"  style="text-align: left;">${msg.msgTitle}</td>
							<td class="msgBtn" >${msg.sendDate}</td>
							<td class="msgBtn" >${msg.recvDate}</td>
						</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
						<tr><td colspan="7">쪽지가 없습니다.</td></tr>	
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" align="center" style="padding-top: 4em;">
								<ul class="pagination">${navigator.navigator}</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>


		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>