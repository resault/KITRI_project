<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<style>
hr{
	border: 1px dashed #5a5a5a;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginGoBtn").click(function() {
		$(this).attr("href","${root}/view/user/login.jsp");
	});
	$("#moveGoMainBtn").click(function() {
		$(this).attr("href","${root}/view/user/main.jsp");
		$("#modifyForm").attr("method","post").attr("action","${root}/user/moveSchoolModify").submit();
		
	});
});

</script>

									<!-- Content -->
									<div style="text-align: center">
									<h2>"회원정보 수정이 성공적으로 완료되었습니다."</h2>
									</div>
										   <br>
									<ul class="actions">
										<li><a href="" id="moveGoMainBtn">메인으로 돌아가기</a></li>
									</ul>
		
	<form id="modifyForm" name="modifyForm">
		<input type="hidden" name="cateList" id="cateList" value="${modifyCateList}">			
		<input type="hidden" name="hName" id="hName" value="${modifyHname}">			
		<input type="hidden" name="uName" id="uName" value="${modifyUname}">			
	</form>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>













