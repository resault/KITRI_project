<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="hSchoolList" value="${requestScope.hSchoolList}"/>
<c:set var="uSchoolList" value="${requestScope.uSchoolList}"/>
<c:set var="hRecomList" value="${requestScope.hRecomList}"/>
<c:set var="uRecomList" value="${requestScope.uRecomList}"/>
	<!-- Content -->
		<section>
			<header class="main">
				<label style="font-size: 3em; text-align: center;">학교 검색</label>
			</header>
			<hr class="major" />

			<div class="row search-condition">
				<div class="col-2 col-12-small">
					<label>학교 구분</label>
					<select name="shcoolCate" id="shcoolCate">
						<option value="h" selected="selected">고등학교</option>
						<option value="u">대학교</option>
					</select>
				</div>
				<div class="col-6 col-12-small">
					<label>&nbsp;</label>
					<input type="text" id="keyword"/>
				</div>
				<div class="col-1 col-12-small">
				</div>
				<div class="col-2 col-12-small" style="text-align: right;">
					<label>&nbsp;</label>
					<a class="button primary" id="searchSchool">검색</a>
				</div>
				<div class="col-1 col-12-small">
				</div>
			</div>
			<div class="row search-condition">
				<div class="col-2 col-12-small">
					<label>지역 구분</label>
					<select name="region" id="region">
						<option value="all" selected="selected">전체</option>
						<option>강원도</option>
						<option>경기도</option>
						<option>경상남도</option>
						<option>경상북도</option>
						<option>광주광역시</option>
						<option>대구광역시</option>
						<option>대전광역시</option>
						<option>부산광역시</option>
						<option>서울특별시</option>
						<option>세종특별자치시</option>
						<option>울산광역시</option>
						<option>인천광역시</option>
						<option>전라남도</option>
						<option>전라북도</option>
						<option>제주특별자치도</option>
						<option>충청남도</option>
						<option>충청북도</option>
					</select>
				</div>
				<div class="col-3 col-12-small" id="htype">
					<label>학교 유형</label>
					<select name="schoolType">
						<option value="all" selected="selected">전체</option>
						<option>일반고등학교</option>
						<option>자율고등학교</option>
						<option>특수목적고등학교</option>
						<option>특성화고등학교</option>
					</select>
				</div>
				<div class="col-3 col-12-small" id="utype">
					<label>학교 유형</label>
					<select name="schoolType">
						<option value="all" selected="selected">전체</option>
						<option>기능대학</option>
						<option>원격대학(전문)</option>
						<option>사이버대학(전문)</option>
						<option>방송통신대학</option>
						<option>사이버대학(대학)</option>
						<option>산업대학</option>
						<option>전문대학(4년제)</option>
						<option>원격대학(대학)</option>
						<option>전문대학(3년제)</option>
						<option>교육대학</option>
						<option>각종대학(대학)</option>
						<option>사내대학(전문)</option>
						<option>대학교</option>
						<option>전문대학(2년제)</option>
						<option>기술대학</option>
						<option>사내대학(대학)</option>
						<option>전공대학</option>
					</select>
				</div>
				<div class="col-2 col-12-small" id="hEstType">
					<label>설립 구분</label>
					<select>
						<option value="all" selected="selected">전체</option>
						<option>공립</option>
						<option>사립</option>
						<option>국립</option>
					</select>
				</div>
				<div class="col-2 col-12-small" id="uEstType">
					<label>설립 구분</label>
					<select>
						<option value="all" selected="selected">전체</option>
						<option>공립</option>
						<option>사립</option>
						<option>국립</option>
						<option>국립대법인</option>
						<option>특별법법인</option>
						<option>특별법국립</option>
					</select>
				</div>
				<div class="col-2 col-12-small" id="mwCate">
					<label>남녀 공학 구분</label>
					<select>
						<option value="all" selected="selected">전체</option>
						<option>남녀공학</option>
						<option>남</option>
						<option>여</option><b>schoolCode schoolName schoolCate1</b>
					</select>
				</div>
			</div>
			<h2>회원님을 위한 추천학교 목록</h2>
			<hr>
			<div class="school-recommendation">
			<c:if test="${not empty hRecomList}">
				<div class="row">
					<c:forEach var="hSchool" items="${hRecomList}">
						<div class="col-3 col-12-small recomSchool">
							<p class="recomSchoolName" data-code="${hSchool.schoolCode}" data-cate="h"><span>${hSchool.schoolName}</span></p>
							<br>
							<p class="searchSchoolType"><span class="juris">${hSchool.schoolCate2}</span>&#9475;<span class="estab">${hSchool.estType}</span></p>
							<br>
								<p class="url" data-url="${hSchool.homePage}">
									<c:choose>
										 <c:when test="${fn:length(hSchool.homePage) > 29}">
							            	<c:out value="${fn:substring(hSchool.homePage,0,29)}"/>...
							             </c:when>
										 <c:otherwise>
								            <c:out value="${hSchool.homePage}"/>
								         </c:otherwise> 
									</c:choose>
						         </p>
						</div>
					</c:forEach>
				</div>
				<hr>
			</c:if>
			<c:if test="${not empty uRecomList}">
				<div class="row">
					<c:forEach var="uSchool" items="${uRecomList}">
						<div class="col-3 col-12-small recomSchool">
							<p class="recomSchoolName" data-code="${uSchool.code}" data-cate="u"><span>${uSchool.name}</span></p>
							<br>
							<p class="searchSchoolType"><span class="juris">${uSchool.type}</span>&#9475;<span class="estab">${uSchool.estType}</span></p>
							<br>
								<p class="url" data-url="${uSchool.link}">
									<c:choose>
										 <c:when test="${fn:length(uSchool.link) > 29}">
							            	<c:out value="${fn:substring(uSchool.link,0,29)}"/>...
							             </c:when>
										 <c:otherwise>
								            <c:out value="${uSchool.link}"/>
								         </c:otherwise> 
									</c:choose>
						         </p>
						</div>
					</c:forEach>
				</div>
			</c:if>
			</div>
			<div class="row" id="hotList">
				<div class="col-10 col-12-small">
				</div>
				<div class="col-1 col-12-small">
					<a class="button primary">핫한 학교 목록보기</a>
				</div>
				<div class="col-1 col-12-small">
				</div>
			</div>
			<div id="hotschool">
			<c:set var="cate" value=""/>
				<c:forEach var="hSchool" items="${hSchoolList}">
					<c:if test="${cate != hSchool.schoolCate1}">
						<hr>
						<c:set var="cate" value="${hSchool.schoolCate1}"/>
						<label class="schoolCate" style="font-size: 1em;">&nbsp;${hSchool.schoolCate1}</label>
						&#9475;
					</c:if>
					<span class="ssdetail" data-cate="h" data-code="${hSchool.schoolCode}">${hSchool.schoolName}</span><b class="up">(up)</b>&#9475;
				</c:forEach>
				<c:forEach var="uSchool" items="${uSchoolList}">
					<c:if test="${cate != uSchool.type}">
						<hr>
						<c:set var="cate" value="${uSchool.type}"/>
						<label class="schoolCate" style="font-size: 1em;">&nbsp;${uSchool.type}</label>
						&#9475;
					</c:if>
					<span class="ssdetail" data-cate="u" data-code="${uSchool.code}">${uSchool.name}</span><b class="up">(up)</b>&#9475;
				</c:forEach>
			</div>
			<hr id="end">
			<div class="hr-sect">검색결과</div>
			<div class="adis-contents">
			</div>
			<ul class="pagination school-detail" id="pros-cons">
			</ul>
		</section>
		<script>
			$(document).ready(function() {
				
				//페이지 초기화 작업
				var schoolCate = "h";
				var region = "";
				var schoolType = "";
				var mwCate = "";
				var estType = "";
				var keyword = "";
				
				$("div#utype").hide();
				$("div#uEstType").hide();
				$("div.hr-sect").hide();
				$("div#hotList").hide();
				
				$("#shcoolCate").change(function() {
					schoolCate = $(this).val();
					if(schoolCate == "u") {
						$("#utype").show();
						$("#uEstType").show();
						
						$("#hEstType").hide();
						$("#htype").hide();
						$("#mwCate").hide();
					}
					else if(schoolCate == "h") {
						$("#htype").show();
						$("#mwCate").show();
						$("#hEstType").show();
						
						$("#utype").hide();
						$("#uEstType").hide();
					}
					return false;
				});
				//컨텐츠의 맨 처음으로 !!
				function scrollContent() {
					var offset = $("div#hotList").offset();
			        $('html, body').animate({scrollTop : offset.top}, 200);
				}
				
				function makeSchoolInfo(result) {
					//ex) {"schoolName":"조선이공대학교","schoolCode":"328","estType":"사립","region":null,"homePage":"www.cst.ac.kr"},
					console.log(result);
					var school = result.schoolInfo;
					var schoolCnt = school.length;
					var schoolContent = "";
					if(schoolCnt != 0) {
						if(result.schoolCate == "h") {
							for(var i = 0; i < schoolCnt; i++) {
								schoolContent += '<div class="adis-content">';
								schoolContent += '<div class="row">';
								schoolContent += 	'<div class="col-12 col-12-small">';
								schoolContent += 		'<span class="school-name" data-code="'+school[i].schoolCode+'" data-cate="h"><strong>'+school[i].schoolName+'</strong></span><span class="location">&nbsp;&nbsp;('+school[i].region+')</span>';
								schoolContent += 	'</div>';
								schoolContent += '</div>';
								schoolContent += '<div class="row">';
								schoolContent += 	'<div class="col-12 col-12-small">';
								schoolContent += 		'<p class="search-simpleInfo"><span class="kind">'+school[i].schoolType+'</span>&#9475;<span class="estab">'+school[i].estType+'</span>&#9475;<span class="coeducation">'+school[i].mwCate+'</span>&#9475;<span class="juris">'+school[i].eduOffice+'</span></p>';
								schoolContent += 	'</div>';
								schoolContent += '</div>';
								schoolContent += '<div class="row">';
								schoolContent += 	'<div class="col-12 col-12-small">';
								schoolContent += 		'<p class="search-simpleInfo"><span>주소 : </span><a class="url" href="'+school[i].homePage+'" target="_blank">'+school[i].homePage+'</a></p>';
								schoolContent += 	'</div>';
								schoolContent += '</div>';
								schoolContent += '<hr/>';
								schoolContent += '</div>';
							}
						} else if(result.schoolCate == "u") {
							for(var i = 0; i < schoolCnt; i++) {
								schoolContent += '<div class="adis-content">';
								schoolContent += '<div class="row">';
								schoolContent += 	'<div class="col-12 col-12-small">';
								schoolContent += 		'<span class="school-name" data-code="'+school[i].schoolCode+'" data-cate="u"><strong>'+school[i].schoolName+'</strong></span><span class="location">&nbsp;&nbsp;('+school[i].region+')</span>';
								schoolContent += 	'</div>';
								schoolContent += '</div>';
								schoolContent += '<div class="row">';
								schoolContent += 	'<div class="col-12 col-12-small">';
								schoolContent += 		'<p class="search-simpleInfo"><span class="kind">'+school[i].schoolType+'</span>&#9475;<span class="estab">'+school[i].estType+'</span></p>';
								schoolContent += 	'</div>';
								schoolContent += '</div>';
								schoolContent += '<div class="row">';
								schoolContent += 	'<div class="col-12 col-12-small">';
								schoolContent += 		'<p class="search-simpleInfo"><span>주소 : </span><a class="url" href="'+school[i].homePage+'" target="_blank">'+school[i].homePage+'</a></p>';
								schoolContent += 	'</div>';
								schoolContent += '</div>';
								schoolContent += '<hr/>';
								schoolContent += '</div>';
							}
						}
						
						$("div.adis-contents").empty();
						$("div.adis-contents").append(schoolContent);
						$("hr#end").hide();
						$("div.hr-sect").show();
						
						//핫 학교 올리기
						$("div#hotschool").slideUp(200);
						$("div#hotList").show();
						
						//학교 이름 클릭
						$("span.school-name").on("click", function() {
							var $cate = $(this).attr("data-cate");
							var $code = $(this).attr("data-code");
							var url = "${root}/schoolinfo/schooldetail?schoolCate="+$cate+"&schoolCode="+$code;
				            window.open(url, "_blank"); 
							return false;
						});
					} else {
						$("div.adis-contents").empty();
						$("div.adis-contents").append("<br><h3 style='text-align: center;'>검색 결과가 없습니다</h3>");
						$("hr#end").hide();
						$("div.hr-sect").show();
						$("div#hotschool").slideUp(200);
						$("div#hotList").show();
					}
					scrollContent();
				}
				
				// 검색 함수
				function search(pg) {
					
					region = $("#region").val();
					keyword = $("#keyword").val();
					
					if(schoolCate == "h") {
						schoolType = $("#htype").find("select").first().val();
						mwCate = $("#mwCate").find("select").first().val();
						estType = $("#hEstType").find("select").first().val();
					} else {
						schoolType = $("#utype").find("select").first().val();
						estType = $("#uEstType").find("select").first().val();
					}
					$.ajax({
						url : "${root}/searchschool/search",
						type : "GET",
						dataType : "json",
						data : {
							"schoolCate" : schoolCate,
							"region" : region,
							"schoolType" : schoolType,
							"mwCate" : mwCate,
							"estType" : estType,
							"keyword" : keyword,
							"pg" : pg
						},
						success : function(result) {
							//ex) {"schoolName":"조선이공대학교","schoolCode":"328","estType":"사립","region":null,"homePage":"www.cst.ac.kr"},
							
							makeSchoolInfo(result);
							
							//페이징 처리
							var pageBean = result.pageBean;
							if(pageBean.totalPage > 1) {
								var pagination = "";
								var startPage = pageBean.startPage;
								var endPage= pageBean.endPage;
								if(pageBean.startPage != 1) {
									pagination += '<li><a class="page eval" data-pg="'+1+'">'+1+'</a></li>';
									pagination += '<li><span>&hellip;</span></li>';
								}
								for(var i=startPage; i<=endPage; i++) {
									if(pageBean.currentPage == i)
										pagination += '<li><a class="page active" data-pg="'+i+'">'+i+'</a></li>';
									else
										pagination += '<li><a class="page eval" data-pg="'+i+'">'+i+'</a></li>';
								}						
								if(pageBean.endPage != pageBean.totalPage) {
									pagination += '<li><span>&hellip;</span></li>';
									pagination += '<li><a class="page eval" data-pg="'+pageBean.totalPage+'">'+pageBean.totalPage+'</a></li>';
								}
								$("#pros-cons").empty();
								$("#pros-cons").append(pagination);
								
								var prevFlag = "";
								var nextFlag = "";
								if(!pageBean.isPrev)
									prevFlag = " disabled";
								if(!pageBean.isNext)	
									nextFlag = " disabled";
								var prevAndNext = "";
								$("#pros-cons").prepend('<li><span class="button'+prevFlag+' eval" data-pg="'+(pageBean.startPage-1)+'">Prev</span></li>');
								$("#pros-cons").append('<li><span class="button'+nextFlag+' eval" data-pg="'+(pageBean.endPage+1)+'">Next</span></li>');
								$("ul#pros-cons>li .eval").click(function() {
									var thisPg = $(this).attr("data-pg");
									search(thisPg);
								});
							} else {
								$("#pros-cons").empty();
							}
						},
						error : function() {
							
						}
					});
				}
				//엔터 이벤트
				$("#keyword").keydown(function (key) {
					if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
						search(1);
			        }
			    });
				
				// 검색 버튼 클릭 이벤트
				$("a#searchSchool").click(function() {
					//학교구분, 지역, 학교유형, 남녀공학, 키워드
					search(1);
					return false;
				});
				//목록보기 클릭			
				$("#hotList a").on("click", function() {
					if($("#hotList a").text() == "핫한 학교 목록보기") {
						$("div#hotschool").slideDown(200);
						$("#hotList a").text("핫한 학교 목록닫기");
					}
					else {
						$("div#hotschool").slideUp(200);
						$("#hotList a").text("핫한 학교 목록보기");
					} 
					return false;
				});
				
				$("span.ssdetail").on("click", function() {
					var $cate = $(this).attr("data-cate");
					var $code = $(this).attr("data-code");
					var url = "${root}/schoolinfo/schooldetail?schoolCate="+$cate+"&schoolCode="+$code;
		            window.open(url, "_blank"); 
					return false;
				});
				
				$("p.recomSchoolName").on("click", function() {
					var $cate = $(this).attr("data-cate");
					var $code = $(this).attr("data-code");
					var url = "${root}/schoolinfo/schooldetail?schoolCate="+$cate+"&schoolCode="+$code;
		            window.open(url, "_blank"); 
					return false;
				});
				$("p.url").on("click", function() {
					var url = $(this).attr("data-url");
					window.open(url, "_blank"); 
				});
				
				
			});
		</script>
<%@ include file="../template/sidebar.jsp" %>