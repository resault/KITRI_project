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
	$("#authenBtn").click(function() {
		$("#authenForm").attr("action","${root}/mail/sendMail/auth").submit();
		return false;
	});
	
	$("#registerGoBtn").click(function() {
		$("#authenForm").attr("action","${root}/mail/sendMail/check").submit();
		return false;
	});
});
</script>

									<!-- Content -->
									<form id="authenForm" name="authenForm" method="post">
									<h2 align="left" style="font-weight:bold; ">이메일 인증 </h2>
									<h4 align="left">1. 인증받을 이메일을 입력해주세요 </h4>
										   <br>
									<ul class="actions">
										<li><input type="email" id="email" name="email" placeholder="godinator@gmail.com" value="${email}"></li>
										<li><input type="button" class="primary" id="authenBtn" name="authenBtn" value="인증받기"></li>
									</ul>
									
									<br>
									<br>
									<h4 align="left">2. 인증코드를 입력해주세요 </h4>
										   <br>
									<ul class="actions">
										<li><input type="text" id="authenCode" name="authenCode" placeholder="인증코드를 입력해주세요"></li>
										<li><input type="button" class="primary" id="registerGoBtn" name="registerGoBtn" value="회원가입하러 가기"></li>
									</ul>
									</form>
									<hr class="major" />
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>