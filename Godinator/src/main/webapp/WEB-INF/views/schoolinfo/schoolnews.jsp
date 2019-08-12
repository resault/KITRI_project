<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>

	<!-- Content -->
		<section>
			<header class="main">
				<label style="font-size: 3em; text-align: center;">학교 뉴스 검색</label>
			</header>
			<div class="row">
				<div class="col-4 col-12-small">
				</div>
				<div class="col-2 col-12-small">
					<label style="font-size: 2em; text-align: center;">학교 검색</label>
				</div>
				<div class="col-2 col-12-small">
					<select id="schoolCate">
						<option value="h" selected="selected">고등학교</option>
						<option value="u">대학교</option>
					</select>
				</div>
				<div class="col-3 col-12-small">
				<input type="text" id="newsSearch"/>
				<div id="schoolScrollDiv"><ul id="schoolScrollUl"></ul></div>
				</div>
				<div class="col-1 col-12-small">
				<input type="hidden" id="schoolCode" />
				<a href="#" class="button primary" id="submit">검색</a>
				</div>
			</div>
			<br>
			<input type="hidden" id="nextGoogle" />
			<input type="hidden" id="nextNaver" />
			<h3 class="newsH3C"></h3>
			<div id="newsarea">
		  	</div>
		  	<div class="row main-school-news">
					<div class="col-5 col-12-small">
					</div>
					<div class="col-2 col-1-small">
						<a href="#" class="button primary" id="submit">메인으로</a>
					</div>
			</div>
		</section>
		<script>
		$(document).ready(function() {
			
			var isEnd = false;
			var pageCnt = 0;
			function makeAppendNews(data, mode) {
				var newsContentCnt = data.length;
				$("h3.newsH3C").text($("input#newsSearch").val());
				var newsContents = '';
				for(var i=0; i<newsContentCnt; i++) {
					//json 바인딩
					newsContents += '<hr class="major" />';
					newsContents += '	<div class="news">';
					newsContents += '		<div class="row">';
					newsContents += '			<div class="col-3 col-3-small">';
					newsContents += '				<span class="image main"><img class="schoolNews" src="'+data[i].imgUrl+'" alt="" /></span>';
					newsContents += '			</div>';
					newsContents += '			<div class="col-9 col-9-small">';
					newsContents += '				<p class="newsContent subject"><a href="'+data[i].url+'">'+data[i].subject+'</a></p>';
					newsContents += '	      		<p class="newsContent press_date"><span class="press">'+data[i].press+'</span>&#9475;<span class="date">'+data[i].date+'</span></p>';
					newsContents += '	      		<p class="newsContent detail">'+data[i].detail+'</p>';
					newsContents += '			</div>';
					newsContents += '		</div>';
					newsContents += '	</div>';			
				}
				if(mode == "first") {
					console.log("first");
					$("div#newsarea").html(newsContents);
				} else {
					console.log("append");
					$("div#newsarea").append(newsContents);
				}
				$("p.subject>a").click(function() {
					$(this).attr('target','_blank');
				});
				pageCnt++;
				console.log("pageCnt : " + pageCnt);
				if(pageCnt == 5)
					isEnd = true;
				//alert($("#page").val());
			};
			
			//ajax 호출
			function searchNews(mode) {
				if(!isEnd) { 
					var schoolName = $("#newsSearch").val();
					var nextGoogle = $("#nextGoogle").val();
					var nextNaver = $("#nextNaver").val();
					var schoolCate = $("#schoolCate").val();
					var param = JSON.stringify({"keyWord" : schoolName, "nextGoogle" : nextGoogle, "nextNaver" : nextNaver, "schoolCate" : schoolCate, "schoolCode" : $("#schoolCode").val()});
					$.ajax({
						url : '${root}/schoolnews/searchnews',
						type : 'POST',
						contentType : "application/json;charset=UTF-8",
						dataType : 'json',
						data : param,
						success : function(result) {
							makeAppendNews(result.schoolnews, mode);
							
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("jqXHR : " + jqXHR + "\ntextStatus : " + textStatus + "\nerrorThrown : " + errorThrown)
						}
					});	
				}
			}
			
			$("#submit").click(function() {
				var selectSchool = $("#schoolCode").val();
				pageCnt = 0;
				isEnd = false;
				if(selectSchool.trim().length != 0) {
					$("div#newsarea").empty();
					searchNews("first");
				} else {
					alert("학교를 선택해주세요.");
					return false;
				}
				return false;
			});
			
			$("div#newsarea p.subject").click(function() {
				alert("학교 검색");
			});
			/* $(window).on("scroll", function() {
				var scrollHeight = $(document).height();
				var scrollPosition = $(window).height() + $(window).scrollTop();		

				$("#scrollHeight").text(scrollHeight);
				$("#scrollPosition").text(scrollPosition);
				$("#bottom").text(scrollHeight - scrollPosition);
				
				if (scrollPosition == scrollHeight && pageCnt < 5) {
					searchNews("append");
				} else {
					
				}
			}); */
			/* $(window).scroll(function () { 
				   if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10) {
				      //Add something at the end of the page
						if(pageCnt < 5 && pageCnt != 0)
							searchNews("append");
				   }
				}); */
			//학교 이름 검색
			$("#newsSearch").keydown(function(e) {
				var $schoolCate = $("#schoolCate").val();
				var $keyword = $(this).val();
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
											$("#newsSearch").val($(this).text());
											$("#schoolScrollUl").css("display", "none");
											$("#schoolCode").val($(this).attr("data-code"));
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
			
			$("h3.newsH3C").click(function() {
				console.log("학교이름 클릭");
				var schoolCate = $("#schoolCate").val();
				var schoolCode = $("#schoolCode").val();
				var url = "${root}/schoolinfo/schooldetail?schoolCate="+schoolCate+"&schoolCode="+schoolCode;
				$(location).attr("href", url);
			});
		});
	</script>
<%@ include file="../template/sidebar.jsp" %>