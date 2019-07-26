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
		<script>
			$(function(){
				$('#checkAll').click(function(){
					$('.resume').attr('checked', 'checked');
					return false;
				});
			});
		</script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo">Mentoring</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<%-- Content --%>
								<section>
									<header class="main">
										<label style="font-size: 3em;">자소서 작성</label>
									</header>
									
									<!-- Form -->

									<form method="post" action="#">
										<div class="row gtr-uniform">
											<%-- 학교정보 --%>
											<div class="row gtr-uniform" style="margin: 0">
												<div class="col-2" style="padding-left: 0; width: 10em;">
													 <select name="school-cate" id="school-cate" >
														<option value="0">- 대분류 -</option>
														<option value="1">고등학교</option>
														<option value="2">대학교</option>
													</select>
												</div>
												<div class="col-2" style="padding-left: 1em; width: 10em;">
													 <select name="school-cate" id="school-cate" >
														<option value="0">- 소분류 -</option>
													</select>
												</div>
												<div class="col-2" style="width: 14em; padding-left: 1em; "> 
													 <input type="text" readonly="readonly" placeholder="학교명"/>
												</div>
											</div>
											<div class="col-12" style="margin-top: 3em; margin-bottom: 1em; text-align: right;">
												<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">mentorID</label>
												<hr class="major" style="margin-top: 0;"/>
											</div>
											<%-- 자소서 --%>
											<div class="col-12">
												<textarea name="subject" id="subject" placeholder="제목을 입력하세요" rows="1"></textarea>
											</div>
											<div class="col-12">
												<textarea name="content" id="content" placeholder="내용을 입력하세요" rows="20"></textarea>
											</div>
											<%-- 버튼 --%>
											<div class="col-12">
												<div style="float: right;">
													<ul class="actions">
														<li><input type="submit" value="저    장" class="primary" /></li>
														<li><input type="reset" value="취    소" /></li>
													</ul>
												</div>
											</div>
										</div>
									</form>

								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="index.html">Homepage</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

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