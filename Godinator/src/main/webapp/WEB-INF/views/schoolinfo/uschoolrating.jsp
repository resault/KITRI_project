<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<c:set var="record" value="${requestScope.record}"/>
<c:set var="evalA" value="${requestScope.evalA}"/>
<c:set var="evalD" value="${requestScope.evalD}"/>
<c:set var="schoolCode" value="${requestScope.schoolCode}"/>
<c:set var="schoolName" value="${requestScope.schoolName}"/>
<c:set var="joinCheck" value="${requestScope.joinCheck}"/>
	<!-- Content -->
		<section>
			<header class="main">
				<label style="font-size: 3em; text-align: center;">대학교 평가</label>
			</header>
			<div class="row">
				<div class="col-10 col-12-small">
				</div>
				<div class="col-2 col-12-small">
					<c:if test="${schoolCode == '' || schoolCode eq null}">
					<label style="font-size: 1.5em;" class="mogyoH2R" id="contentPwd">모교 검색</label>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-7 col-12-small">
				</div>
				<div class="col-2 col-12-small">
				</div>
				<div class="col-3 col-12-small">
				<c:if test="${schoolCode == '' || schoolCode eq null}">
					<input type="text" id="searchSchoolName"/>
					<div id="schoolScrollDiv"><ul id="schoolScrollUl"></ul></div>
				</c:if>
				<c:if test="${schoolCode != '' || schoolCode ne null}">
					<label style="font-size: 1em; text-align: right;">${schoolName}</label>
				</c:if>
				</div>
			</div>
			<!-- Content -->
				<label style="font-size: 2em;">항목 평가</label>
				<div class="row">
					<div class="col-6 col-12-small">
						<span>시설 : </span><div class="starRev" id="facilities">
										  <span class="starR">1</span>
										  <span class="starR">2</span>
										  <span class="starR">3</span>
										  <span class="starR">4</span>
										  <span class="starR">5</span>
										  <span class="starR">6</span>
										  <span class="starR">7</span>
										  <span class="starR">8</span>
										  <span class="starR">9</span>
										  <span class="starR">10</span>
										</div>
					</div>
					<div class="col-6 col-12-small">
						<span>학업분위기 : </span><div class="starRev" id="study">
										  <span class="starR">1</span>
										  <span class="starR">2</span>
										  <span class="starR">3</span>
										  <span class="starR">4</span>
										  <span class="starR">5</span>
										  <span class="starR">6</span>
										  <span class="starR">7</span>
										  <span class="starR">8</span>
										  <span class="starR">9</span>
										  <span class="starR">10</span>
										</div>
					</div>
				</div><br>
				<div class="row">
					<div class="col-6 col-12-small">
						<span>교직원 (교육, 인성) : </span><div class="starRev" id="teachers">
										  <span class="starR">1</span>
										  <span class="starR">2</span>
										  <span class="starR">3</span>
										  <span class="starR">4</span>
										  <span class="starR">5</span>
										  <span class="starR">6</span>
										  <span class="starR">7</span>
										  <span class="starR">8</span>
										  <span class="starR">9</span>
										  <span class="starR">10</span>
										</div>
					</div>
					<div class="col-6 col-12-small">
						<span>진로 교육 : </span><div class="starRev" id="course">
										  <span class="starR">1</span>
										  <span class="starR">2</span>
										  <span class="starR">3</span>
										  <span class="starR">4</span>
										  <span class="starR">5</span>
										  <span class="starR">6</span>
										  <span class="starR">7</span>
										  <span class="starR">8</span>
										  <span class="starR">9</span>
										  <span class="starR">10</span>
										</div>
					</div>
				</div><br>
				<div class="row">
					<div class="col-6 col-12-small">
						<span>취업/진학률 : </span><div class="starRev" id="erate">
										  <span class="starR">1</span>
										  <span class="starR">2</span>
										  <span class="starR">3</span>
										  <span class="starR">4</span>
										  <span class="starR">5</span>
										  <span class="starR">6</span>
										  <span class="starR">7</span>
										  <span class="starR">8</span>
										  <span class="starR">9</span>
										  <span class="starR">10</span>
										</div>
					</div>
					<div class="col-6 col-12-small">
						<span>동아리 활성화 : </span><div class="starRev" id="clubVital">
										  <span class="starR">1</span>
										  <span class="starR">2</span>
										  <span class="starR">3</span>
										  <span class="starR">4</span>
										  <span class="starR">5</span>
										  <span class="starR">6</span>
										  <span class="starR">7</span>
										  <span class="starR">8</span>
										  <span class="starR">9</span>
										  <span class="starR">10</span>
										</div>
					</div>
				</div>
				<hr>
				<br>
				<label style="font-size: 2em;">학교 장단점</label>
				<div class="row">
				<div class="col-2 col-12-small">
					<label style="font-size: 1em;">장점</label>
				</div>
				<div class="col-10 col-12-small">
				</div>
				</div>
				<div class="row">
					<div class="col-12">
						<textarea id="eval_a" placeholder="학교 장점을 입력해주세요" rows="6"></textarea>
					</div>
				</div>
				<div class="row">
				<div class="col-2 col-12-small">
					<label style="font-size: 1em;">단점</label>
				</div>
				<div class="col-10 col-12-small">
				</div>
				</div>
				<div class="row">
					<div class="col-12">
						<textarea id="eval_d" placeholder="학교 단점을 입력해주세요" rows="6"></textarea>
					</div>
				</div>
				<br>
				<div class="row submit-school-evaluation">
					<div class="col-4 col-12-small">
					</div>
					<div class="col-2 col-1-small">
						<a href="" class="button primary" id="submit">확인</a>
					</div>
					<div class="col-2 col-1-small">
						<a href="" class="button" id="cancel">취소</a>
					</div>
				</div>
		</section>

		<script>
			$(document).ready(function(e){
				
				var recordCheck = '${empty record}';
				var evalACheck = '${empty evalA}';
				var evalDCheck = '${empty evalD}';
				var joinCheck = '${joinCheck}';
				
				var schoolCate = "u";
				var schoolCode;
				if("${schoolCode != '' || schoolCode ne null}" == "true") {
					schoolCode = "${schoolCode}";
				}
				
				var clickSchoolName;
				
			    $('.search-panel .dropdown-menu').find('a').click(function(e) {
					e.preventDefault();
					var param = $(this).attr("href").replace("#","");
					var concept = $(this).text();
					$('.search-panel span#search_concept').text(concept);
					$('.input-group #search_param').val(param);
				});
			    
				$("div.submit-school-evaluation a#submit").click(function() {
					var $keyword = $("#searchSchoolName").val();
					if(clickSchoolName != $keyword) {
						alert("학교를 선택해 주세요");
						return false;
					}
					
					var $facilities = $("#facilities").find("span.on");
					var $teachers = $("#teachers").find("span.on");
					var $course = $("#course").find("span.on");
					var $erate = $("#erate").find("span.on");
					var $clubVital = $("#clubVital").find("span.on");
					var $study = $("#study").find("span.on");
					var $eval_a = $("#eval_a").val();
					var $eval_d = $("#eval_d").val();
					console.log($eval_a);
					if($facilities.length != 0 && $teachers.length != 0 && $course.length != 0 && $erate.length != 0 && $study.length != 0 && $clubVital.length != 0) {
						var check = confirm("입력 확인 시 수정이 불가합니다. 신중히 작성해주시기 바랍니다.\n작성 완료하시겠습니까?");
						if(check) {
							var $form = $('<form></form>');
							var url = '${root}/schoolinfo/urating';
							$form.attr('action', url);
							$form.attr('method', 'post');
							$form.appendTo('body');
	
							$facilities = $($facilities).last().text();
							$teachers = $($teachers).last().text();
							$course = $($course).last().text();
							$erate = $($erate).last().text();
							$clubVital = $($clubVital).last().text();
							$study = $($study).last().text();
							console.log($course);
							var facilities = $('<input type="hidden" value="'+$facilities+'" name="facilities">');
							var teachers = $('<input type="hidden" value="'+$teachers+'" name="teachers">');
							var course = $('<input type="hidden" value="'+$course+'" name="course">');
							var erate = $('<input type="hidden" value="'+$erate+'" name="erate">');
							var clubVital = $('<input type="hidden" value="'+$clubVital+'" name="clubVital">');
							var study = $('<input type="hidden" value="'+$study+'" name="study">');
							var pschoolCate = $('<input type="hidden" value="'+schoolCate+'" name="schoolCate">');
							var pschoolCode = $('<input type="hidden" value="'+schoolCode+'" name="schoolCode">');
							if($eval_a.trim().length != 0) {
								var eval_a = $('<input type="hidden" value="'+$eval_a+'" name="eval_a">');
								$form.append(eval_a);
							}
							if($eval_d.trim().length != 0) {
								var eval_d = $('<input type="hidden" value="'+$eval_d+'" name="eval_d">');
								$form.append(eval_d);
							}
							
							$form.append(facilities).append(teachers).append(course).append(erate).append(clubVital).append(study).append(pschoolCate).append(pschoolCode);
							console.log($form);
							$form.submit();
						}
						return false;
					} else {
						alert("항목을 평가해주세요");
						return false;
					}
					
				});
				
				//학교 이름 검색
				$("#searchSchoolName").keydown(function(e) {
					var $keyword = $(this).val();
					if($keyword.trim().length != 0) {
						$.ajax({
							url : "${root}/schoolnews/selectschool",
							type : "GET",
							contentType : "application/json;charset=UTF-8",
							data : "schoolCate=u&keyword="+$keyword,
							dataType : "JSON",
							success : function(result) {
								if(result != false) {
								console.log(result);
								var school = result.schoolNames;
								console.log(school);
								var schoolNamesCnt = result.schoolNames.length;
								console.log(schoolNamesCnt);
									$("#schoolScrollUl").empty();
									for(var i=0; i<schoolNamesCnt; i++) {
										var li = $("<li/>", {
											"data-code" : school[i].schoolCode,
											"text" : school[i].schoolName,
											"click" : function() {
												$("#searchSchoolName").val($(this).text());
												$("#schoolScrollUl").css("display", "none");
												$("#schoolCode").val($(this).attr("data-code"));
												clickSchoolName = $(this).text();
												schoolCode = $(this).attr("data-code");
											}
										});
										$("#schoolScrollUl").append(li);
									}
									$("#schoolScrollUl").css("display", "list-item");
								} else {
									console.log(result);
									$("#schoolScrollUl").css("display", "none");
									$("#schoolScrollUl").empty();
								}
							},
							error : function() {
								
							}
						});
					} else {
						$("#schoolScrollUl").css("display", "none");
						$("#schoolScrollUl").empty();
					}
				});
				
				$('div.starRev span').click(function(){
					if(recordCheck == "false") {
						alert("이미 평가했습니다");
						return false;
					}
					
					 $(this).parent().children('span').removeClass('on');
					 $(this).addClass('on').prevAll('span').addClass('on');
					 return false;
				});
				
				if(recordCheck == "false") {
					
					var facilities = Number('${record.U_EVAL1}');
					var teachers = Number('${record.U_EVAL2}');
					var course = Number('${record.U_EVAL3}');
					var erate = Number('${record.U_EVAL4}');
					var clubVital = Number('${record.U_EVAL5}');
					var study = Number('${record.U_EVAL6}');
					var $facilities = $("#facilities").find("span");
					var $teachers = $("#teachers").find("span");
					var $course = $("#course").find("span");
					var $erate = $("#erate").find("span");
					var $clubVital = $("#clubVital").find("span");
					var $study = $("#study").find("span");
					console.log(facilities);
					console.log(teachers);
					console.log(course);
					console.log(erate);
					console.log(clubVital);
					console.log(study);
					for(var i=0; i<10; i++) {
						if(i < facilities)
							$($facilities[i]).addClass("on");
						
						if(i < teachers)
							$($teachers[i]).addClass("on");
						
						if(i < course)
							$($course[i]).addClass("on");
						
						if(i < erate)
							$($erate[i]).addClass("on");
						
						if(i < clubVital)
							$($clubVital[i]).addClass("on");
						
						if(i < study)
							$($study[i]).addClass("on");
					}
				}
				if(evalACheck == "false") {
					$("#eval_a").val("${evalA}").attr("readonly ", "readonly");
				}
				if(evalDCheck == "false") {
					$("#eval_d").val("${evalD}").attr("readonly ", "readonly");
				}
				if(joinCheck == "true") {
					$("a#cancel").text("건너뛰기");
		    	}
				if(recordCheck == "false" && evalACheck == "false" && evalDCheck == "false") {
					$("a#submit").remove();
					$("a#cancel").remove();
				}
				//건너뛰기
			    $("div.submit-school-evaluation a#cancel").click(function() {
			    	if(joinCheck == "true") {
			    		$(location).attr("href", "${root}/schoolinfo/register");
				    	return false;
			    	} else {
			    		$(location).attr("href", "${root}/board/main");
				    	return false;
			    	}
			    });
			});
		</script>
<%@ include file="../template/sidebar.jsp" %>