<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/own/admin_header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	var schoolCode = $("#schoolCode").html();
	
	getMentoInfo(schoolCode);
	
	function getMentoInfo(schoolCode) {
		//alert('안뇽3' + schoolCode);
		
		$.ajax({
            url : "${root}/school/mentoInfo",
            type : "get",
            contentType : "application/json;charset=UTF-8",
            data : "schoolCode="+schoolCode,
            dataType : "json",
            success : function(data) {
            	console.log(data.mentoInfos);
            	
            	if(data.mentoInfos != null){
                    for(var i=0;i<data.mentoInfos.length;i++){
                        var userId = data.mentoInfos[i].userId;
                        var userName = data.mentoInfos[i].userName;
                        var joinDate = data.mentoInfos[i].joinDate;
                        var userCate = data.mentoInfos[i].userCate;
                        
                          
                        var tr = $("<tr>").attr("id", "mentoInfo2");
         	    		var td1 = $("<td>").html(userId);
            			var td2 = $("<td>").html(userName);
            			var td3 = $("<td>").html(joinDate);
            			 
            			 tr.append(td1).append(td2).append(td3);
            			 $("#mentoInfo").append(tr);
            			 
         			   }}
            	}
            });
	}
	
	$('#schoolCode').click(function() {
		alert('학교코드는 임의로 바꿀 수 없습니다.');
	});
	
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
		 //var schoolCode = $("#schoolCode").html(); // 어디 정보 바꿀지 고정정보 위해 > 주석처리 : 전역변수로 설정
		 var schoolName = $("#schoolName").html();
		 var schoolCate = $("#schoolCate").html();
		 var homePage = $("#homePage").html();
		 var phone = $("#phone").html();
		 var zipcode = $("#zipcode").html();
		 var address = $("#address").html();
		 var addressDetail = $("#addressDetail").html();
		 console.log(schoolCode+'/'+schoolName+'/'+schoolCate+'/'+homePage+'/'+phone+'/'+zipcode+'/'+address+'/'+addressDetail);
		 
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
td #schoolCode {
	background-color: lightgray;
}

#schoollistTop td:hover {
   background-color: aliceblue;
}

#schoolCode {
	background-color: #eaedef;
}
</style>

<section style="padding-top: 0px; padding-bottom: 0px;">
<div class="table-responsive-lg">
	<label><img src="${root }/resources/images/admin/manage_school.png" style="width: 100; padding-top: 20px;"></label>
	
	<div class="col-2 col-4-small" style="float: right;">
		<ul class="actions">
			<li><a href="#" id="deleteBtn" class="button primary icon"><i class="far fa-trash-alt"></i></a></li>
		</ul>
	</div>
	<div style="float: right;"><button type="button" id="modifyBtn" style="margin-right: 10px;">수 정</button></div>
	
    <table class="table" id="schoollistTop" >
         <thead>
            <tr>
               <th>학교코드</th>
               <th>학교명</th>
               <th>학교구분</th>
            </tr>
         </thead>
         <tbody class="userInfoTable">
         	<tr>
         		<td contenteditable="false" id="schoolCode" >${schoolCode }</td>
         		<td contenteditable="true" id="schoolName">${schoolName }</td>
         		<td contenteditable="true" id="schoolCate">${schoolCate }</td>
         	</tr>
         </tbody>
      </table>
      <table class="table" id="schoollistTop" >
         <thead>
            <tr>
               <th>홈페이지</th>
               <th>전화번호</th>
               <th>우편번호</th>
               <th colspan="2">주소</th>
            </tr>
         </thead>
         <tbody class="userInfoTable">
         	<tr>
         		<td id="homePage" contenteditable="true">${homePage }</td>
         		<td id="phone" contenteditable="true">${phone }</td>
         		<td id="zipcode" contenteditable="true">${zipcode }</td>
         		<td id="address" contenteditable="true">${address }</td>
         		<td id="addressDetail" contenteditable="true">${addressDetail }</td>
         	</tr>
         </tbody>
    </table>
</div>

<div>
	<label><img src="${root }/resources/images/admin/mentor_list.png" style="width: 100; padding-top: 20px;"></label>
	<table class="table">
         <thead>
            <tr>
               <th>ID</th>
               <th>이름</th>
               <th>승인날짜</th>
            </tr>
         </thead>
         <tbody id="mentoInfo"></tbody>
   	</table>
</div>
</section>
<%-- 
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
--%>
<%@ include file="/WEB-INF/views/template/own/admin_sidebar.jsp"%>