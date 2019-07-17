<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<c:set var="schoolDto" value="${requestScope.schoolDto}"/>
<c:set var="imgUrl" value="${requestScope.imgUrl}"/>
<c:set var="schoolCate" value="${requestScope.schoolCate}"/>
<c:set var="schoolCode" value="${requestScope.schoolCode}"/>
<c:set var="schoolName" value="${requestScope.schoolName}"/>
<c:set var="cateAvg" value="${requestScope.cateAvg}"/>
<c:set var="schoolType" value="${requestScope.schoolType}"/>
<c:set var="latitude" value="${requestScope.latitude}"/>
<c:set var="longitude" value="${requestScope.longitude}"/>
	<!-- Content -->
	<section>
		<header class="main">
		<c:if test="${schoolCate == 'h'}">
			<label style="font-size: 2em; text-align: center;">${schoolDto.schoolName}</label>
		</c:if>
		<c:if test="${schoolCate == 'u'}">
			<label style="font-size: 2em; text-align: center;">${schoolDto.name}</label>
		</c:if>
		</header>
			<div class="row">
				<div class="col-8 col-12-small">
					<span class="image main"><img src="${imgUrl}" alt="" /></span>
				</div>
				<div class="col-4 col-12-small">
					<label style="font-size: 2em; text-align: center;">학교 정보</label>
					<c:if test="${schoolCate == 'h'}">
					<fieldset> 
						<legend>관할 교육청</legend> 
						<label>${schoolDto.eduOffice}</label>
					</fieldset>
					<fieldset> 
						<legend>대표 전화 / 팩스</legend> 
						<label>${schoolDto.phone} / ${schoolDto.fax}</label>
					</fieldset>
					<fieldset> 
						<legend>홈페이지</legend> 
						<label>${schoolDto.homePage}</label>
					</fieldset>
					</c:if>
					<c:if test="${schoolCate == 'u'}">
					<fieldset> 
						<legend>대표 전화 / 팩스</legend> 
						<label>${schoolDto.tel} / ${schoolDto.fax}</label>
					</fieldset>
					<fieldset> 
						<legend>홈페이지</legend> 
						<label>${schoolDto.link}</label>
					</fieldset>
					</c:if>
				</div>
			</div>


		<hr class="major" />

		<label style="font-size: 2em;">항목별 평가 지수</label>
		<div class="row">
            		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		                  <c:choose>
			                  <c:when test="${not empty schoolDto.eval1Avg}">
			                          <div class="card">
			                              <div class="card-body">
			                                  <div id="curve_chart" style="width: 100%;"></div>
			                              </div>
			                          </div>
			                  </c:when>
			                  <c:otherwise>
			                  		<label style="font-size: 3em; text-align: center;">아직 평가되지 않았습니다!</label>
			                  </c:otherwise>
		                  </c:choose>
	            	</div>
          	</div>

		<hr class="major" />
		
		<label style="font-size: 2em;">학교 위치</label>
		<c:if test="${schoolCate == 'h'}">
			<div class="row">
				<div id="schooldetail-map" style="width: 80%;">
				</div>
			</div>
			<br>
			<p id="schoolDetailAddress">${schoolDto.address}${schoolDto.addressDetail}</p>
		</c:if>
		<c:if test="${schoolCate == 'u'}">
			<p id="schoolDetailAddress">${schoolDto.address}</p>
		</c:if>
		<hr class="major" />

		<label style="font-size: 2em;">학교 장단점</label>
		<div class="row">
			<div class="col-1 col-12-small">
			</div>
			<div class="col-3 col-12-small">
				<p id="adis"><span class="adis" style="color: black; font-weight: bold;" data-type="r">공감 비율 순</span>&#9475;<span class="adis" data-type="m">순공감 순</span>&#9475;<span class="adis" data-type="l">최신순</span></p>
				</div>
				<div class="col-5 col-12-small">
				
				</div>
				<div class="col-3 col-12-small" id="adDiv">
						<a class="button primary" data-adDiv="a">장점</a>
						<a class="button" data-adDiv="d">단점</a>
				</div>
			</div>
			<hr/>
			<div class="adis-contents">
				<div class="adis-content">
					<div class="row">
						<div class="col-8 col-12-small">
							<span class="id">&nbsp;&nbsp;<strong>sdfi****</strong></span>
						</div>
						<div class="col-4 col-12-small">
							<a href="#" class="button btn-success small">공감:1165</a>
							<a href="#" class="button primary small">비공감:78</a>
							<a href="#" class="button primary small">신고</a>
						</div>
					</div>
					<div class="row">
						<div class="col-1 col-12-small">
						</div>
						<div class="col-10 col-12-small">
							<div class="textarea">
								<p>최신식 기숙사!!</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 col-12-small">
							<span>2019-06-21 11:23</span>
						</div>
					</div>
					<hr/>
				</div>
			</div>
			<ul class="pagination school-detail" id="pros-cons">
			</ul>

		</section>
		
		
		<!-- 구글차트 -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<!-- 지도 -->
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45bb62aaacbd960790cdbac158d998e7"></script>
	    <script>
	      
		$(document).ready(function() {
			
			var schoolTypeChart = '${schoolType}';
			var schoolNameChart = '${schoolName}';
			console.log(schoolTypeChart+"  :  " +schoolNameChart);
			google.charts.load('current', {'packages':['corechart']});
		    google.charts.setOnLoadCallback(drawChart);
		      
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		        	  ['학교 구분', schoolTypeChart+' 평균', schoolNameChart],
			          ['시설', ${cateAvg.EVAL1AVG}, ${schoolDto.eval1Avg}],
			          ['학업 분위기', ${cateAvg.EVAL2AVG}, ${schoolDto.eval2Avg}],
			          ['교직원(교육, 인성)', ${cateAvg.EVAL3AVG}, ${schoolDto.eval3Avg}],
			          ['진로 교육', ${cateAvg.EVAL4AVG}, ${schoolDto.eval4Avg}],
			          ['취업률/진학률', ${cateAvg.EVAL5AVG}, ${schoolDto.eval5Avg}],
			          ['동아리 활성화', ${cateAvg.EVAL6AVG}, ${schoolDto.eval6Avg}]
		        ]);
		
		        var options = {
		          title: '10점 만점!!',
		          curveType: 'function',
		          legend: { position: 'bottom' }
		        };
		
		        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
		
		        chart.draw(data, options);
		      }
			
			var schoolCate = "${schoolCate}";
			var schoolCode = "${schoolCode}";
			var searchType = "r";
			var adDiv = 'a';
			//$('#subChart span.subDate').text(dataValues[0].y);
			$("span.adis").click(function() {
				$(this).css("color", "black").css("font-weight", "bold").siblings().css("color", "gray").css("font-weight", "normal");
			});
			
			function getEvals(adDivVal, searchType, currpg) {
				$.ajax({
					url : "${root}/schoolinfo/schooleval",
					type : "GET",
					contentType : "application/json;charset=utf-8",
					dataType : "JSON",
					data : "schoolCate="+schoolCate+"&schoolCode="+schoolCode+"&adDiv="+adDivVal+"&searchType="+searchType+"&currpg="+currpg,
					success : function(result) {
						var evals = result.evals;
						var evalsCnt = evals.length;
						var content = "";
						if(evalsCnt != 0) {
							for(var i=0; i<evalsCnt; i ++) {
								content += '<div class="adis-content"><div class="row"><div class="col-8 col-12-small">';
								content += '	<span class="id">&nbsp;&nbsp;<strong>'+evals[i].userId+'</strong></span></div>';
								content += '	<div class="col-4 col-12-small menu" data-seq="'+evals[i].adNo+'">';
								content += '		<a class="button btn-success small sympathy">공감:<span>'+evals[i].upvote+'</span></a>';
								content += '		<a class="button primary small uncensored">비공감:<span>'+evals[i].downvote+'</span></a>';
								content += '		<a class="button primary small">신고</a>';
								content += '	</div></div><div class="row"><div class="col-1 col-12-small"></div>';
								content += '	<div class="col-10 col-12-small"><div class="textarea">';
								content += '			<p>'+evals[i].content+'</p>';
								content += '		</div></div></div><div class="row"><div class="col-12 col-12-small">';
								content += '		<span>'+evals[i].regitDate+'</span></div></div><hr/></div>';
							}
							$("div.adis-contents").empty();
							$("div.adis-contents").append(content);
							

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
									var currpg = $(this).attr("data-pg");
									getEvals(adDiv, searchType, currpg);
								});
							}
							//공감 비공감 눌렀을때
							$("div.adis-contents a.sympathy, a.uncensored").click(function() {
								console.log($(this).text());
								var $this = this;
								var adNo = $(this).parent().attr("data-seq");
								var $parent = $(this).parent();
								console.log("data-seq : "+adNo);
								var upDown;
								if($(this).index() == 0) {
									upDown = "u";
								} else {
									upDown = "d";
								}
								var param = JSON.stringify({
									"schoolCate" : schoolCate,
									"schoolCode" : schoolCode,
									"adNo" : adNo,
									"upDown" : upDown
								});
								$.ajax({
									url : "${root}/schoolinfo/poscon",
									type : "PATCH",
									contentType : "application/json;charset=utf-8",
									dataType : "json",
									data : param,
									success : function(result) {
										if(result.loginCheck == "true") {
											// s, d, e
											console.log(result.msg);
											if(result.msg == "s") {
												$($parent).children().eq(0).find("span").text(result.upvote);
												$($parent).children().eq(1).find("span").text(result.downvote);
												if(upDown == "u") {
													//$(this).css("border", "u");
													$($this).css("border", "3px solid yellow !important");
													console.log($($this).find("span").first().text());
												} else {
													//$(this).attr("data-state", "d");
													$($this).css("border", "3px solid blue !important");
													console.log($($this).find("span").first().text());
												}
											} else if(result.msg == "d") {
												//$(this).removeAttr("data-state");
													$($this).css("border", "none");
													$($this).find("span").text(Number($($this).find("span").text())-1);
													console.log($($this).find("span").first().text());
											} else {
												alert(result.msg);
											}
										} else {
											var cf = confirm("로그인 후 이용해주세요");
											if(cf) {
												//alert(result.referer); 이전 페이지 주소
												$(location).attr("href", "${root}/view/user/login.jsp");
											}
										}
									},
									error : function() {
										alert("에러가 발생했습니다! 다시시도해주세요");
									}
								});
								return false;
							});
						} else {
							$("div.adis-contents").empty();
							$("div.adis-contents").append("검색 결과가 없습니다");
						}
					},
					error : function() {
					}
				});
			}
			getEvals('a', 'r', '1');
			
			$("span.adis").click(function() {
				searchType = $(this).attr("data-type");
				getEvals(adDiv, searchType, 1);
				return false;
			});
			$("#adDiv>a").click(function() {
				adDiv = $(this).attr("data-adDiv");
				console.log(adDiv);
				getEvals(adDiv, searchType, 1);
			});
		function map() {
			if(schoolCate == "h") {
				setTimeout(function() {
					
					console.log("지도 함수 호출");
					var mapContainer = document.getElementById('schooldetail-map'), // 지도를 표시할 div 
					mapOption = { 
					    center: new kakao.maps.LatLng('${latitude}', '${longitude}'), // 지도의 중심좌표
					    level: 3 // 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					//마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng('${latitude}', '${longitude}');
					
					//마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position: markerPosition
					});
					
					//마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					//아래 코드는 지도 위의 마커를 제거하는 코드입니다
					//marker.setMap(null); 
					console.log("지도 함수 종료");
				}, 1500);
			}
		}
		map();
		});
		</script>
<%@ include file="../template/sidebar.jsp" %>