<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

		<%-- Content --%>
			<section>
				<div style="text-align: center; margin-top: 3em;">
					<img src="${pageContext.request.contextPath}/img/error.png" style="height: 20em;"><br/><br/>
					<p>서버 문제로 에러가 발생했습니다. 나중에 다시 시도하세요.</p>
				</div>
			</section>

	</div>
</div>

<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>