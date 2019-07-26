<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	
	
	$('#deleteBtn').click(function() {
		confirm('삭제하시겠습니까?');
		var schoolCode = $("#schoolCode").val();
		
		$.ajax({
            url : "${root}/school/delete",
            type : "get",
            contentType : "application/json;charset=UTF-8",
            data : "schoolCode="+schoolCode,
            dataType : "json",
            error : function() { // 왜 에러로 갔을 때 성공이냐면 js에서 문제나는거고 DB에서는 삭제가 됨
                alert('해당하는 학교의 정보가 삭제되었습니다.');
                location.href = "main";
            }});
		
	});
	
	$('#modifyBtn').click(function() {
		//$("#memberform").attr("action", "${root}/school/modify").submit();
		 var schoolCode = $("#schoolCode").val(); // 어디 정보 바꿀지 고정정보 위해
		 var schoolName = $("#schoolName").val();
		 var schoolCate = $("#schoolCate").val();
		 var homePage = $("#homePage").val();
		 var phone = $("#phone").val();
		 var zipcode = $("#zipcode").val();
		 var address = $("#address").val();
		 var addressDetail = $("#addressDetail").val();
		
		$.ajax({
            url : "${root}/school/modify",
            type : "get",
            contentType : "application/json;charset=UTF-8",
            data : "schoolCode="+schoolCode+"&schoolName="+schoolName+"&schoolCate="+schoolCate+"&homePage="+homePage // & 표시 유의할것!!!
            	  +"&phone="+phone+"&zipcode="+zipcode+"&address="+address+"&addressDetail="+addressDetail,
            dataType : "json",
            error : function() {
            	alert('해당하는 학교의 정보가 수정되었습니다.');
                location.href = "main";
            }});
		 
	});
});
</script>

<style>
#schoolCode {
	background-color: lightgray;
}
</style>

<section>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
			<!--input type="hidden" name="act" value="register"-->
			<div class="form-group" align="left">
				<label for="name">학교코드</label>
				<input type="text" id="schoolCode" name="schoolCode" value="${schoolCode }" readonly="readonly">
			</div>
			<div class="form-group" align="left">
				<label for="">학교명</label>
				<input type="text" id="schoolName" name="schoolName" value="${schoolName}" >
				<div id="idresult"></div>
			</div>
			<div class="form-group" align="left">
				<label for="">학교분류</label>
				<!-- 
				<select id="emaildomain" name="emaildomain">
					<option value="자율고등학교">자율고등학교</option>
					<option value="특수목적고등학교">특수목적고등학교</option>
					<option value="특성화고등학교">특성화고등학교</option>
					<option value="일반고등학교">일반고등학교</option>
				</select>
				-->
				<input type="text" id="schoolCate" name="schoolCate" value="${schoolCate}">
			</div>
			<div class="form-group" align="left">
				<label for="">홈페이지</label>
				<input type="text" id="homePage" name="homePage" value="${homePage }">
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
				<input type="text" id="phone" name="phone" value="${phone}">
				</div>
			</div>
			
			<div class="form-group" align="left">
				<label for="">주소</label><br>
				<div style="display: inline-block;"><input type="text" id="zipcode" name="zipcode" value="${zipcode}"style="width: 528.645766px;"></div>
				<div style="display: inline-block;"><input type="text" id="address" name="address" value="${address}" style="width: 528.645766px;"></div>
				<div style="display: inline-block;"><input type="text" id="addressDetail" name="addressDetail" value="${addressDetail}"style="width: 528.645766px;"></div>
			</div>
			
			<div class="form-group" align="center" style="padding-top: 25px;">
				<button type="button" id="modifyBtn">수정</button>
				<button type="button" id="deleteBtn">삭제</button>
			</div>
		</form>
	</div>
</div>
</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>