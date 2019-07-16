<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 바로 위에는 section 끝 -->	
	</div>
</div>

<div id="sidebar">
	<div class="inner">
		<section id="mainPage" class="alt">
			<span>고디네이터</span>
		</section>
		
		<!-- my own -->
		<nav id="admin">`
			<header class="major"><h2>Admin</h2></header>
			<div class="adminBtn" id="adminMemberBtn" style="width: 40px; display: inline-block; margin-right: 40px;"><img src="${root }/resources/images/admin/member.png" style="width: 60px;"></div>
			<div class="adminBtn" id="adminSchoolBtn" style="width: 40px; display: inline-block; margin-right: 40px;"><img src="${root }/resources/images/admin/school.png" style="width: 60px;"></div>
			<div class="adminBtn" id="adminReportBtn" style="width: 40px; display: inline-block; margin-right: 40px;"><img src="${root }/resources/images/admin/warning.png" style="width: 60px;"></div>
			<div class="adminBtn" id="adminStatisticsBtn" style="width: 40px; display: inline-block;"><img src="${root }/resources/images/admin/statistics.png" style="width: 60px;"></div>
		</nav>
		
		<nav id="menu">
			<header class="major"><h2>Menu</h2></header>
			<ul>
				<c:if test="${not empty userInfo}">
					<li>
					<span class="opener">마이페이지</span>
					<ul>
						<li><a href="${root}/jinro/geomsa">진로검사</a></li>
						<li><a href="${root}/">모교 평가</a></li>
					</ul>
					</li>
				</c:if>
				<li>
					<span class="opener">학교 정보</span>
					<ul>
						<li><a href="${root}/searchschool/viewsearch">학교 검색</a></li>
						<li><a href="${root}/schoolnews/viewnews">학교 뉴스 검색</a></li>
					</ul>
				</li>
				<li>
					<span class="opener" id = "community">커뮤니티</span>
					<ul id ="communityMenu">
						<li><a href="${root}/board/list?boardCategory=1&pg=1&key=&word=">홍보게시판</a></li>
						<li><a href="${root}/board/list?boardCategory=2&pg=1&key=&word=">고등학교 게시판</a></li>
						<li><a href="${root}/board/list?boardCategory=3&pg=1&key=&word=">대학교 게시판</a></li>
						<li><a href="${root}/board/list?boardCategory=4&pg=1&key=&word=">핫 게시물</a></li>
					</ul>
				</li>
				<li>
					<span class="opener">멘토링</span>
					<ul>
						<li><a href="${root}/mentor/findmentor">멘토 찾기</a></li>
						<li><a href="${root}/msg/msgbox">쪽지함</a></li>
						<li><a href="${root}/resume/resumelist">자소서목록</a></li>
						<li><a href="${root}/resume/editlist">첨삭목록</a></li>
					</ul>
				</li>
			</ul>
		</nav>


	</div>
</div>
</div>

<!-- Scripts -->
<script src="${root}/js/browser.min.js"></script>
<script src="${root}/js/breakpoints.min.js"></script>
<script src="${root}/js/util.js"></script>
<script src="${root}/js/main.js"></script>
<script>
	$(document).ready(function() {
		$("section#mainPage").click(function() {
			$(location).attr("href", "${root}/board/main");
		});
	});
</script>
</body>
</html>