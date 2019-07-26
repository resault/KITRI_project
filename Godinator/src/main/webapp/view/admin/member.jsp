<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<!-- modal 되는 link
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
-->
<style>

table th, table td {
	text-align: center;
}

#infoTable {
	/* border: 1px solid #444444; */
}

#memberlist {
   cursor: pointer;
   background-color: aliceblue;
   
}

#searchText {
   width: 130px;
   box-sizing: border-box;
   border: 2px solid #ccc;
   border-radius: 4px;
   font-size: 16px;
   background-color: white;
   background-image: url('');
   background-position: 10px 10px;
   background-repeat: no-repeat;
   padding: 12px 20px 12px 40px;
   -webkit-transition: width 0.4s ease-in-out;
   transition: width 0.4s ease-in-out;
}

#searchText {
   width: 100%;
}

#memberlist tr:hover {
	background-color: lightgray;
}

</style>

<script type="text/javascript">
//참고 : http://demo.webslesson.info/bootstrap-crud-php/ 

$(document).ready(function(){
	
	allList();
	
	function allList() {
    	 var keyword = "member";
           
    	 $.ajax({
             url : "${root}/member/list",
             type : "GET",
             contentType : "application/json;charset=UTF-8",
             data : "keyword="+keyword,
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
                         var temp = data.members[i].i1;
                         var temp2 = data.members[i].i2;
                          //console.log(schoolCate + '/'+schoolName);
                           
                         var tr = $("<tr>").attr("class", "table-active");
          	    		 var td1 = $("<td>").html(userId);
             			 var td2 = $("<td>").html(userName);
             			 var td3 = $("<td>").html(hSchoolCode);
             			 var td4 = $("<td>").html(uSchoolCode);
             			 var td5 = $("<td>").html(userCate);
             			 var td6 = $("<td>").html(joinDate);
             			 var td7 = $("<td><input type='button' id='mentoConfirm' value='멘토승인'>").html();
            			 //var td7 = $(temp).html();
             			 
             			 tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
             			 $("#memberlist").append(tr);
             			 
          			   }}},
              error : function() {
                 alert('검색이 실패하였습니다.');
             }});
   		 } // allList끝 
   		 
   		 
   		 
   	 	$(document).on('click', 'tr.table-active', function(){
   			/* confirm('멘토로 저장하시겠습니까?');
   			
   			var a = $(this).children();
   	  		var id = a[0].childNodes[0].nodeValue;
   	  		console.log(a+'/'+id);
   	  		
	   	  	$.ajax({
	            url : "${root}/member/mentor",
	            type : "GET",
	            contentType : "application/json;charset=UTF-8",
	            data : "id="+id,
	            dataType : "json",
	            error : function() {
	                alert('멘토로 수정되었습니다.');
	                location.href = "";
	            }
	         }); */
   	  		
   	 		var a = $(this).children();	
   	 		var memberid = a[0].childNodes[0].nodeValue;
   	 		alert(memberid);
   	 		
   	 	$("#memberid").val(memberid);
   	    $("#hiddenInfo").attr("method","GET").attr("action","${root}/member/goModify").submit();
   	 		
	   }); 
   		 
   		function infoTable(cnt, cnt2) {
   			console.log('회원인원수 : ' + cnt + '/' + cnt2 + ' 잘 받았심다');
   			
   			var tr = $("<tr>").attr("class", "table-active2");
   			//var tr2 = $("<tr>").attr("style", "margin-bottom: 0px;");
	    	var td1 = $("<td>").html(cnt);
	    	var td2 = $("<td>").html(cnt2);
	    	
	    	tr.append(td1).append(td2);
	    	$("#infoTable").append(tr);
   		} 
   		 
   	
});

</script>
<form class="form-inline" action="" style="padding-top: 50px; margin-bottom: 0px;">
<div class="col-9 col-12-small">
               
               <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float: right;">
                  <input type="email" name="demo-email" id="demo-email" value="" placeholder="ID나 이름을 입력하세요." style="margin-bottom: 50px;"/>
               </div>
               <div class="col-7 col-7-small" style="float: right;">
                   <select name="school-cate2" id="school-cate2">
                     <option value="0">이름</option>
                     <option value="1">ID</option>
                  </select>
               </div>
            </div>
</form>
	<table id="infoTable">
		<thead style="text-align: center;">
		<tr>
			<th>총 회원수</th>
			<th>멘토 수</th>
	</table>
<section>
   <div class="table-responsive-lg">
      <table class="table" id="memberlistTop" >
         <thead>
            <tr>
               <th>ID</th>
               <th>이름</th>
               <th>고등학교</th>
               <th>대학교</th>
               <th>회원구분</th>
               <th>가입일</th>
               <th>비고</th>
            </tr>
         </thead>

         <!-- 잠시 임시!<img src="/images/crowns.png" width="30" height="30"> -->
         <tbody id="memberlist">
         </tbody>

      </table>
   </div>
</section>
<form id="hiddenInfo"><input type="hidden" name="memberid" id="memberid" value=""></form>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>