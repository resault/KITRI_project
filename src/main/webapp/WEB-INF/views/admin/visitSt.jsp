<!-- 
	1. 방문자
	2. 가장 많이 가입한 학교학생들 TOP
	3. 회원들이 학교 선택할 떄 가장 중요하게 생각하는 요소
	4. 가장 조회수가 높은 검색어 순위

 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/own/admin_header.jsp"%>
<%@ include file="/WEB-INF/views/template/own/admin_statistics.jsp"%>

<<script type="text/javascript">
$(document).ready(function(){
	
allList();
	
	function allList() {         
    	 $.ajax({
             url : "${root}/admin/upperMemberList",
             type : "GET",
             contentType : "application/json;charset=UTF-8",
             dataType : "json",
             
             success : function(data) {
                  //console.log(data + "받는거 성공");
                  //alert('총 ' + data.result + "명의 회원이 검색되었습니다.");
                  var cnt = data.result;
                  var cnt2 = data.result2;
                  infoTable(cnt, cnt2);
                  
                  if(data.members != null){
                     for(var i=0;i<data.members.length;i++){
                         var userId = data.members[i].userId;
                         var userName = data.members[i].userName;
                         var hSchoolCode = data.members[i].hSchoolCode;
                         var uSchoolCode = data.members[i].uSchoolCode;
                         var userCate = data.members[i].userCate;
                         var joinDate = data.members[i].joinDate;
                         var temp = data.members[i].temp;
                         //var temp2 = data.members[i].i2;
                         console.log("temp??"+temp);
                           
                         var tr = $("<tr>").attr("class", "table-active");
          	    		 var td1 = $("<td>").html(userId);
             			 var td2 = $("<td>").html(userName);
             			 var td3 = $("<td>").html(hSchoolCode);
             			 var td4 = $("<td>").html(uSchoolCode);
             			 var td5 = $("<td>").html(userCate);
             			 var td6 = $("<td>").html(joinDate);
             			 var td7 = "";
             			 if(temp == "r") { // 대기
             				 // <input type="button" id="mentoConfirm" value="멘토승인" style="margin-left: 80px; margin-top: 3px;margin-bottom: 3px;">
             				td7 = $("<td><input type='button' id='mentoConfirm' value='멘토승인'>").html();
             			 } else if (temp == "n") { // 아님
	            			td7 = $("<td>").html(""); // 멘토
             			 } else {
             				td7 = $("<td>").html("멘토"); 
             			 }
             			 
             			 tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
             			 $("#memberlist").append(tr);
             			 
          			   }}},
              error : function() {
                 alert('검색이 실패하였습니다.');
             }});
   		 } 
});
</script>


<section style="padding-top: 15px;">
	<div id="chart" style="width: 500px; display: inline-block;"><canvas id="myChart" width="400" height="400">방문자 통계</canvas></div>
	
	<div style="display: inline-block;">
		<table class="table" id="reportlistTop" >
		<thead>
			<tr>
				<th>순위</th>
                 <th>방문횟수</th>
                 <th>ID</th>
                 <th>이름</th>
            </tr>
		</thead>

         <tbody id="reportlist"><tr><td>하루 또 하루가 또 새로워</td></tr></tbody>

      </table>
	</div>
</section>


<script>
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: '월별 방문자 통계',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },

    // Configuration options go here
    options: {}
});
</script>

<%@ include file="/WEB-INF/views/template/own/admin_sidebar.jsp"%>