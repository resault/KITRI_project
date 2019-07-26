<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<%-- font-awesome --%>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<style type="text/css">
			.far, .fas {
				vertical-align: center;
				font-size: 1.3em;
			}
		</style>
		<script type="text/javascript">
		$(function(){
			$('.mentor').click(function(){
				location.href="/template/chat.jsp";
				return false;
			});
		});
		</script>
	</head>
<body style="padding: 0; margin: 0;">
	<div id="wrapper" style="padding: 0;">
		<!-- Main -->
		<div id="main" style="padding: 0; margin: 0;">
			<div class="inner">
				<%-- Content --%>
				<div style="margin-top: 3em;">
					<label style="font-size: 1.7em;">접속중인 멘토</label>
				</div>
				<div class="row gtr-uniform" style="margin-top: 2em;">
					<div class="col-2 col-12-small">
					</div>
					<div class="col-10 col-12-small">
						<div class="col-2 col-12-small" style="padding-left	: 0; float: right;">
							<ul class="actions">
								<li><a href="#" class="button primary icon"><i class="fas fa-search"></i></a></li>
								<li><a href="#" class="button"><i class="fas fa-redo"></i></a></li>
							</ul>
						</div>
						<div class="col-2" style="padding-left: 0.5em; width: 15em; padding-right: 1em; float: right;">
							<input type="text" name="searchMentor" id="searchMentor" value="" placeholder="검색어를 입력하세요"/>
						</div>
						<div class="col-6" style="padding-left: 0.5em; float: right;">
							 <select name="school-cate2" id="school-cate2">
								<option value="0">ID</option>
								<option value="1">모교</option>
							</select>
						</div>
						<div style="clear: both;">
						</div>
					</div>
				</div>
				<%-- 학교 분류 --%>
				<div class="row gtr-uniform" style="margin: 0 0 2em 0;">
					<div class="col-2" style="padding-left: 0; width: 10em;">
						 <select name="school-cate1" id="school-cate1" >
							<option value="">- 대분류 -</option>
							<option value="1">고등학교</option>
							<option value="2">대학교</option>
						</select>
					</div>
					<div class="col-2" style="width: 10em; padding-left: 0; margin-left: 1em;"> 
						 <select name="school-cate2" id="school-cate2">
							<option value="">- 소분류 -</option>
						</select>
					</div>
				</div>
				<%-- 멘토 목록 --%>
				<div style="height: 300px; overflow-y: auto; border: thin solid;">
					<table class="alt" style="text-align: center;">
						<tbody>
							<tr class="mentor">
								<td>1</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>2</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>3</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>4</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>1</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>2</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>3</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>4</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>1</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>2</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>3</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>4</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr>
								<td>1</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>2</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>3</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>4</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>1</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>2</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>3</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
							<tr class="mentor">
								<td>4</td>
								<td>userID</td>
								<td>ㅇㅇ고등학교</td>
								<td>특목고</td>
								<td>ㅇㅇ대학교</td>
								<td>이공계</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>

</body>
</html>