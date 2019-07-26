<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<style>
hr{
	border: 1px dashed #5a5a5a;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#modifyMentorBtn").click(function() {
		//alert("학교수정 버튼 눌림");
		var hcheckL = $("input[name='highMentorCheck']:checked").length;
		var ucheckL = $("input[name='uniMentorCheck']:checked").length;
			console.log(hcheckL);
			console.log(ucheckL);
		var high = $("#highSchool").val();
		var uni = $("#university").val();
		
		if(hcheckL>0 && high == ""){//체크했는데
			alert("멘토 신청을 위해 고등학교를 입력해 주세요.");
		}else if(ucheckL>0 && uni == ""){
			alert("멘토 신청을 위해 대학교를 입력해 주세요.");
		}else{
			$("#schoolModifyForm").attr("action","/godinator/user/mentorModifyRegister").submit();	
		}
	});
});
</script>

		<link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/register.css"/>

							<!-- Content -->
								<div id="loginAll">
									<header class="main">
										<h1>학교 및 멘토 정보 수정</h1>
										<h3 class="subtitle">후배들의 멘토가 되어주세요!</h3>
									</header>
									<br><br>
									<!-- Content -->
									<form id="schoolModifyForm" name="schoolModifyForm" method="post" action="">
									<div>
										<h3 id="contentId">출신 고등학교</h3>
										   <input type="text" name="highSchool" id="highSchool" value="${hName}" />
										  <!--  <a href="#" class="button">학교 검색</a> -->
										   <br><br>
										   <h5>고등학교 구분</h5>
										   <div id="h_category" class="custom-control-inline">
													<select class="form-control" id="hSchoolCate" name="hSchoolCate" value="{userInfo.hSchoolCate}" >
														<option value="특수목적고등학교">특수목적고등학교</option>
														<option value="일반고등학교">일반고등학교</option>
														<option value="자율고등학교">자율고등학교</option>
														<option value="특성화고등학교">특성화고등학교</option>
													</select>
										   </div>
										<br><br><br><br>
										<h3 id="contentPwd">출신 대학교</h3>
										   <input type="text" name="university" id="university" value="${uName}" />
										   <!-- <a href="#" class="button">학교 검색</a> -->
										   <br><br>
										    <h5>대학교 구분</h5>
										   <div id="u_category" class="custom-control-inline">
													<select class="form-control" id="uSchoolCate" name="uSchoolCate" value="{userInfo.uSchoolCate}"  >
														<option value="인문,사회">인문,사회</option>
														<option value="자연,공학">자연,공학</option>
														<option value="의학">의학</option>
														<option value="예술,체육">예술,체육</option>
														<option value="교육">교육</option>
													</select>
										   </div>
									<hr>
									<br><br>
								
								<c:set var="size" value="${fn:length(cateList)}"/>
								<c:choose >
									<c:when test="${size eq 6}">
									<div class="col-6 col-12-small">
											<section id="highMentorSection">
												<h3 id="contentPwd"><strong>고등학교</strong> 멘토 구분</h3>
												<input type="checkbox" id="highMentorCheck" name="highMentorCheck" checked="checked">
												<label for="highMentorCheck">선택</label>
											</div>
											</section>						
												   <br>
											<section id="uniMentorSection">
												<h3 id="contentPwd"><strong>대학교</strong> 멘토 구분</h3>
											<div class="col-6 col-12-small">
													<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck" checked="checked">
													<label for="uniMentorCheck">선택</label>
												</div>
											</section>						
									</c:when>
									<c:when test="${size eq 3}">
									<%-- <c:set var="three" value='${fn:substring(cateList,1,1)}'/> --%>
										<c:choose >
											<c:when test="${three eq 'h'}">
											<div class="col-6 col-12-small">
											<section id="highMentorSection">
											<h3 id="contentPwd"><strong>고등학교</strong> 멘토 구분</h3>
											<input type="checkbox" id="highMentorCheck" name="highMentorCheck" checked="checked">
													<label for="highMentorCheck">선택</label>
												</div>
												</section>						
													   <br>
												<section id="uniMentorSection">
													<h3 id="contentPwd"><strong>대학교</strong> 멘토 구분</h3>
											<div class="col-6 col-12-small">
														<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck">
														<label for="uniMentorCheck">선택</label>
													</div>
												</section>
											</c:when>
											<c:when  test="${three eq 'u'}">
											<div class="col-6 col-12-small">
												<section id="highMentorSection">
												<h3 id="contentPwd"><strong>고등학교</strong> 멘토 구분</h3>
												<input type="checkbox" id="highMentorCheck" name="highMentorCheck" >
														<label for="highMentorCheck">선택</label>
													</div>
													</section>						
														   <br>
													<section id="uniMentorSection">
														<h3 id="contentPwd"><strong>대학교</strong> 멘토 구분</h3>
												<div class="col-6 col-12-small">
															<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck" checked="checked">
															<label for="uniMentorCheck">선택</label>
														</div>
													</section>
											</c:when>
										</c:choose>
									</c:when>
										<c:otherwise>
										<div class="col-6 col-12-small">
											<section id="highMentorSection">
												<h3 id="contentPwd"><strong>고등학교</strong> 멘토 구분</h3>
																<input type="checkbox" id="highMentorCheck" name="highMentorCheck" >
																<label for="highMentorCheck">선택</label>
															</div>
											</section>						
																   <br>
											<section id="uniMentorSection">
																<h3 id="contentPwd"><strong>대학교</strong> 멘토 구분</h3>
																	<div class="col-6 col-12-small">
														<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck">
														<label for="uniMentorCheck">선택</label>
													</div>
											</section>
											</c:otherwise>
										</c:choose>
								
										   <br>
										   
									</div>
							</form>
										   <br>
									<ul class="actions">
										<li><button href="#" class="button primary" id="modifyMentorBtn" name="modifyMentorBtn">수정</button></li>
									</ul>
									
								</div>

		<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>