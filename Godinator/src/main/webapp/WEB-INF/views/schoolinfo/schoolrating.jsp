<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>

	<!-- Content -->
		<section>
			<header class="main">
				<h1 class="mogyoH1R">고등학교 및 대학교 평가</h1>
			</header>
			<div class="row">
				<div class="col-10 col-12-small">
				</div>
				<div class="col-2 col-12-small">
					<h3 class="mogyoH2R">모교 검색</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-7 col-12-small">
				</div>
				<div class="col-2 col-12-small">
				<select id="schoolCate">
					<option value="h">고등학교</option>
					<option value="u">대학교</option>
				</select>
				</div>
				<div class="col-3 col-12-small">
				<input type="text" id="searchSchoolName"/>
				<div id="schoolScrollDiv"><ul id="schoolScrollUl"></ul></div>
				</div>
			</div>
			<!-- Content -->
				<h2 id="content">항목 평가</h2>
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
						<span>학생 복지 : </span><div class="starRev" id="welfare">
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
				<h2 id="content">학교 장단점</h2>
				<div class="row">
				<div class="col-2 col-12-small">
					<h3 class="mogyoH2L">장점</h3>
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
					<h3 class="mogyoH2L">단점</h3>
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
						<a href="" class="button" id="cancel">건너뛰기</a>
					</div>
				</div>
		</section>

		<script>
			$(document).ready(function(e){
				
				var schoolCate = "h";
				var schoolCode;
				var clickSchoolName;
				$("#shcoolCate").change(function() {
					schoolCate = $(this).val();
					return false;
				});
				
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
					var $welfare = $("#welfare").find("span.on");
					var $study = $("#study").find("span.on");
					var $eval_a = $("#eval_a").val();
					var $eval_d = $("#eval_d").val();
					console.log($eval_a);
					if($facilities.length != 0 && $teachers.length != 0 && $course.length != 0 && $welfare.length != 0 && $study.length != 0) {
						var check = confirm("입력 확인 시 수정이 불가합니다. 신중히 작성해주시기 바랍니다.\n작성 완료하시겠습니까?");
						if(check) {
							var $form = $('<form></form>');
							var url = '${root}/schoolinfo/rating';
							$form.attr('action', url);
							$form.attr('method', 'post');
							$form.appendTo('body');
	
							$facilities = $($facilities).last().text();
							$teachers = $($teachers).last().text();
							$course = $($course).last().text();
							$welfare = $($welfare).last().text();
							$study = $($study).last().text();
							console.log($course);
							var facilities = $('<input type="hidden" value="'+$facilities+'" name="facilities">');
							var teachers = $('<input type="hidden" value="'+$teachers+'" name="teachers">');
							var course = $('<input type="hidden" value="'+$course+'" name="course">');
							var welfare = $('<input type="hidden" value="'+$welfare+'" name="welfare">');
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
							
							$form.append(facilities).append(teachers).append(course).append(welfare).append(study).append(pschoolCate).append(pschoolCode);
							console.log($form);
							$form.submit();
						}
						return false;
					} else {
						alert("항목을 평가해주세요");
						return false;
					}
					
				});
				//건너뛰기
				$("div.submit-school-evaluation a#submit").click(function() {
					$(location).attr("href", "${root}/schoolinfo/joinfinish");
					return false;
				}
				
				//학교 이름 검색
				$("#searchSchoolName").keydown(function(e) {
					var $schoolCate = $("#schoolCate").val();
					var $keyword = $(this).val();
					console.log($schoolCate + " " + $keyword);
					if($keyword.trim().length != 0) {
						$.ajax({
							url : "${root}/schoolnews/selectschool",
							type : "GET",
							contentType : "application/json;charset=UTF-8",
							data : "schoolCate="+$schoolCate+"&keyword="+$keyword,
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
				  $(this).parent().children('span').removeClass('on');
				  $(this).addClass('on').prevAll('span').addClass('on');
				  return false;
				});
			});
		</script>
<%@ include file="../template/sidebar.jsp" %>