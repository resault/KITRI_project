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
	</head>
<body style="padding: 0; margin: 0;">
	<div id="wrapper" style="padding: 0;">
		<!-- Main -->
		<div id="main" style="padding: 0; margin: 0;">
			<div class="inner">
				<%-- Content --%>
				<div style="margin-top: 3em;">
					<label style="font-size: 1.7em;">멘토와의 채팅</label>
				</div>
				<div class="col-12" style="margin-top: 5em; margin-bottom: 1em; text-align: left;">
					<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">WITH. mentorID</label>
					<hr class="major" style="margin-top: 0;"/>
				</div>
				<form method="post" action="#">
					<%-- 쪽지 --%>
					<div class="col-12" >
						<div class="box" style="height: 300px; overflow-y: auto;">
							<p>채팅내용<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
						</div>
					</div>
					<div class="row gtr-uniform">
						<div class="col-10">
							<input type="text" placeholder="내용을 입력하세요">
						</div>
						<div class="col-2">
							<ul class="actions">
								<li><input type="submit" value="전    송" class="primary" /></li>
							</ul>
						</div>
					</div>
				</form>
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