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
                  console.log(data.members + "받는거 성공");
                  //alert('총 ' + data.result + "명의 회원이 검색되었습니다.");
                  
                  if(data.members != null){
                     for(var i=0;i<data.members.length;i++){
                         var rownum = data.members[i].rownum;
                         var visitCnt = data.members[i].visitCnt;
                         var visitUserId = data.members[i].visitUserId;
                         var userName = data.members[i].userName;
                           
                         var tr = $("<tr>").attr("class", "table-active");
          	    		 var td1 = $("<td>").html(rownum);
             			 var td2 = $("<td>").html(visitCnt);
             			 var td3 = $("<td>").html(visitUserId);
             			 var td4 = $("<td>").html(userName);
             			 
             			 tr.append(td1).append(td2).append(td3).append(td4);
             			 $("#reportlist").append(tr);
             			 
          			   }}},
              error : function() {
                 alert('검색이 실패하였습니다.');
             }});
   		 } 
});
</script>


<section style="padding-top: 15px;">
	<div id="chart" style="width: 400px; "><canvas id="myChart" width="400" height="400">방문자 통계</canvas></div>
	
	<div>
		<table class="table" id="reportlistTop" style="margin-top: 30px;">
		<thead>
			<tr>
				<th>순위</th>
                 <th>방문횟수</th>
                 <th>ID</th>
                 <th>이름</th>
            </tr>
		</thead>

         <tbody id="reportlist"></tbody>

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