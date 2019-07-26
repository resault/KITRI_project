<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	//alert('호!!');
	$('#middleschool').click(function() {
		alert('중학생용 클릭!');
		location.href = "${root }/view/admin/geomsa_middle.jsp";
	});
	
	$('#highschool').click(function() {
		alert('고등학생용 클릭!');
		location.href = "${root }/view/admin/geomsa_high.jsp";
	});
});
</script>

<section style="padding-top: 0px; padding-bottom: 10px;">
	<!--<img src="${root }/resources/images/admin/jinro_geomsa.png" style="width: 100; padding-top: 20px; float: center; margin-left: 200px;"> -->
	<img src="${root }/resources/images/admin/geomsa_info.JPG" style="width: 100; padding-top: 20px; float: center; margin-left: 200px;" >
	<img src="${root}/resources/images/admin/geomsa_content.JPG" style="width: 1000px !important; margin-left: 200px;  margin-top: 20px;" id="highschool">
</section>
<div style="margin-top: 10px;">
	<img src="${root}/resources/images/admin/geomsa_middle_school.png" style="width: 400px !important; margin-left: 215px;" id="middleschool">
	<img src="${root}/resources/images/admin/geomsa_high_school.png" style="width: 400px !important; margin-left: 80px;" id="highschool">
</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>