<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
										<li><a href="index.html">홈페이지</a></li>
										<li><a href="generic.html">일반</a></li>
										<li><a href="elements.html">요소</a></li>
										<li>
											<span class="opener">학교</span>
											<ul>
												<li><a href="${root}/schoolinfo">학교 목록</a></li>
												<li><a href="${root}/schoolnews/news">학교 뉴스</a></li>
												<li><a href="${root}/schoolinfo">학교 평가</a></li>
											</ul>
										</li>
									</ul>
								</nav>