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
	$("#mentorRegisterBtn").click(function() {
		//alert($("#registerId").val());
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
			$("#schoolForm").attr("action","/godinator/user/mentorRegister").submit();	
		}
	});

//학교이름검색
$("#highSchool").keyup(function(e) {
	var $keyword = $(this).val();
	console.log($keyword);
	if($keyword.trim().length != 0) {
		$.ajax({
			url : "${root}/user/selectHschool",
			type : "GET",
			contentType : "application/json;charset=UTF-8",
			data : "keyword="+$keyword,
			dataType : "JSON",
			success : function(result) {
				if(result != false) {
				console.log(result);
				var school = result.schoolNames;
				console.log(school);
				var schoolNamesCnt = result.schoolNames.length;
				console.log(schoolNamesCnt);
					$("#schoolScrollUlH").empty();
					for(var i=0; i<schoolNamesCnt; i++) {
						var li = $("<li/>", {
							"data-code" : school[i].schoolCode,
							"text" : school[i].schoolName,
							"click" : function() {
								$("#highSchool").val($(this).text());
								$("#schoolScrollUlH").css("display", "none");
								$("#schoolCode").val($(this).attr("data-code"));
								clickSchoolName = $(this).text();
								schoolCode = $(this).attr("data-code");
							}
						});
						$("#schoolScrollUlH").append(li);
					}
					$("#schoolScrollUlH").css("display", "list-item");
				} else {
					console.log(result);
					$("#schoolScrollUlH").css("display", "none");
					$("#schoolScrollUlH").empty();
				}
			},
			error : function() {
				
			}
		});
	} else {
		$("#schoolScrollUlH").css("display", "none");
		$("#schoolScrollUlH").empty();
	}
});

//대학검색
$("#university").keyup(function(e) {
	var $keyword = $(this).val();
	console.log($keyword);
	if($keyword.trim().length != 0) {
		$.ajax({
			url : "${root}/user/selectUschool",
			type : "GET",
			contentType : "application/json;charset=UTF-8",
			data : "keyword="+$keyword,
			dataType : "JSON",
			success : function(result) {
				if(result != false) {
				console.log(result);
				var school = result.schoolNames;
				console.log(school);
				var schoolNamesCnt = result.schoolNames.length;
				console.log(schoolNamesCnt);
					$("#schoolScrollUlU").empty();
					for(var i=0; i<schoolNamesCnt; i++) {
						var li = $("<li/>", {
							"data-code" : school[i].schoolCode,
							"text" : school[i].schoolName,
							"click" : function() {
								$("#university").val($(this).text());
								$("#schoolScrollUlU").css("display", "none");
								$("#schoolCode").val($(this).attr("data-code"));
								clickSchoolName = $(this).text();
								schoolCode = $(this).attr("data-code");
							}
						});
						$("#schoolScrollUlU").append(li);
					}
					$("#schoolScrollUlU").css("display", "list-item");
				} else {
					console.log(result);
					$("#schoolScrollUlU").css("display", "none");
					$("#schoolScrollUlU").empty();
				}
			},
			error : function() {
			}
		});
	} else {
		$("#schoolScrollUlU").css("display", "none");
		$("#schoolScrollUlU").empty();
	}
});
});
</script>

		<link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/register.css"/>

							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>회원가입</h1>
										<h3 class="subtitle">후배들의 멘토가 되어주세요!</h3>
									</header>
									<br><br>
									<!-- Content -->
									<form id="schoolForm" name="schoolForm" method="post" action="">
									<div>
										<h3 id="contentId">출신 고등학교</h3>
										   <input type="text" name="highSchool" id="highSchool" />
										  <div id="schoolScrollDivH"><ul id="schoolScrollUlH"></ul></div>
										   <br><br>
										   <h5>고등학교 구분</h5>
										   <div id="h_category" class="custom-control-inline">
													<select class="form-control" id="hSchoolCate" name="hSchoolCate">
														<option value="특수목적고등학교">특수목적고등학교</option>
														<option value="일반고등학교">일반고등학교</option>
														<option value="자율고등학교">자율고등학교</option>
														<option value="특성화고등학교">특성화고등학교</option>
													</select>
										   </div>
										<br><br><br><br>
										<h3 id="contentPwd">출신 대학교</h3>
										   <input type="text" name="university" id="university" />
										 <div id="schoolScrollDivU"><ul id="schoolScrollUlU"></ul></div>
										   <br><br>
										    <h5>대학교 구분</h5>
										   <div id="u_category" class="custom-control-inline">
													<select class="form-control" id="uSchoolCate" name="uSchoolCate">

														<option value="인문,사회">인문,사회</option>
														<option value="자연,공학">자연,공학</option>
														<option value="의학">의학</option>
														<option value="예술,체육">예술,체육</option>
														<option value="교육">교육</option>
													</select>
										   </div>
									
<input type="hidden" id="registerId" name="registerId" value="${registerInfo.userId}">
									<hr>
									<br><br>
									<section id="highMentorSection">
										<h3 id="contentPwd"><strong>고등학교</strong> 멘토 구분</h3>
								<div class="col-6 col-12-small">
										<input type="checkbox" id="highMentorCheck" name="highMentorCheck" >
										<label for="highMentorCheck">선택</label>
									</div>
									</section>						
										   <br>
									<section id="uniMentorSection">
										<h3 id="contentPwd"><strong>대학교</strong> 멘토 구분</h3>
						<div class="col-6 col-12-small">
											<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck" >
											<label for="uniMentorCheck">선택</label>
										</div>
									</section>						
										   <br>
										   
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li>2/4</li>
										<li><a href="#" class="button primary" id="mentorRegisterBtn" name="mentorRegisterBtn">건너뛰기</a></li>
									</ul>
									
								</div>

		<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>