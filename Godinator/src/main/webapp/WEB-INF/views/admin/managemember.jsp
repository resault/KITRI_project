<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/own/admin_header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	var userid = '${userId }';
	
	viewBoardInfo(userid);
	
	function viewBoardInfo(userid){
		$.ajax({
            url : "${root}/member/board",
            type : "get",
            contentType : "application/json;charset=UTF-8",
            data : "userid="+userid,
            dataType : "json",
            success : function(data) {
            	console.log(data.boards);
            	
            	if(data.boards != null){
                    for(var i=0;i<data.boards.length;i++){
                        var date = data.boards[i].date;
                        var subject = data.boards[i].subject;
                        var content = data.boards[i].content;
                          
                        var tr = $("<tr>").attr("id", "boardInfo");
         	    		var td1 = $("<td>").html(date);
            			var td2 = $("<td>").html(subject);
            			var td3 = $("<td>").html(content);
            			 
            			 tr.append(td1).append(td2).append(td3);
            			 $("#boardInfo").append(tr);
            			 
         			   }}
            	}
            });
	}
	
	$('#deleteBtn').click(function() {
		confirm('삭제하시겠습니까?');
		//var userid = '${userId }';
		
		$.ajax({
            url : "${root}/member/delete",
            type : "get",
            contentType : "application/json;charset=UTF-8",
            data : "userid="+userid,
            dataType : "json",
            error : function() { // 왜 에러로 갔을 때 성공이냐면 js에서 문제나는거고 DB에서는 삭제가 됨
                alert('해당하는 회원의 정보가 삭제되었습니다.');
                location.href = "view";
            }});
	});
	
	
});
</script>

<style>
#schoolCode {
	background-color: lightgray;
}

.userInfoTable {
	background-color: #e7f9df;
}
</style>


<section style="padding-top: 0px; padding-bottom: 0px;">
<div class="table-responsive-lg">
	<label><img src="${root }/resources/images/admin/manage_member.png" style="width: 100; padding-top: 20px;"></label>
	
	<div class="col-2 col-4-small" style="float: right;">
		<ul class="actions">
			<li><a href="#" id="deleteBtn" class="button primary icon"><i class="far fa-trash-alt"></i></a></li>
		</ul>
	</div>
	
    <table class="table" id="memberlistTop" >
         <thead>
            <tr>
               <th>ID</th>
               <th>이름</th>
               <th>회원구분</th>
               <th>고등학교</th>
               <th>대학교</th>
            </tr>
         </thead>
         <tbody class="userInfoTable">
         	<tr>
         		<td id="userid">${userId }</td>
         		<td>${userName }</td>
         		<td>${userCate }</td>
         		<td>${hSchoolCode }</td>
         		<td>${uSchoolCode }</td>
         	</tr>
         </tbody>
      </table>
      <table class="table" id="memberlistTop" >
         <thead>
            <tr>
               <th>연락처</th>
               <th>이메일</th>
               <th>주소</th>
               <th>가입일</th>
            </tr>
         </thead>
         <tbody class="userInfoTable">
         	<tr>
         		<td>${phone1 }</td>
         		<td>${email }</td>
         		<td>${address }</td>
         		<td>${joinDate }</td>
         	</tr>
         </tbody>
    </table>
</div>

<div>
	<label><img src="${root }/resources/images/admin/manage_member_board.png" style="width: 100; padding-top: 20px;"></label>
	<div class="col-2 col-4-small" style="float: right;">
		<ul class="actions">
			<li><a href="#" id="deleteBoardBtn" class="button primary icon"><i class="far fa-trash-alt"></i></a></li>
		</ul>
	</div>
	<table class="table">
         <thead>
            <tr>
               <th style="width: 218px;">게시일</th>
               <th style="width: 218px;">제목</th>
               <th>내용</th>
            </tr>
         </thead>
         <tbody id="boardInfo"></tbody>
   	</table>
</div>
</section>
<%@ include file="/WEB-INF/views/template/own/admin_sidebar.jsp"%>