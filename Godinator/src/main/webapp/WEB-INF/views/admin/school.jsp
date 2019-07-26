<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/own/admin_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
   #memberlist {
      cursor: pointer;
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
   
   #myModal {
      display: none;
   }
   
   #schoollist tr:hover {
   background-color: yellow;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	allList(); // 실행되자마자 전체 개수 조회할수도 있게해!
	
	function allList() {
    	// 시작할 때 모든 학교 리스트 다 보도록
    	 var keyword = "h_school";
           
    	 $.ajax({
             url : "${root}/school/list",
             type : "GET",
             contentType : "application/json;charset=UTF-8",
             data : "keyword="+keyword,
             dataType : "json",
             success : function(data) {
                  console.log(data + "받는거 성공");
                  if(data.schoolNames != null){
                     for(var i=0;i<data.schoolNames.length;i++){
                         var schoolCate = data.schoolNames[i].schoolCate1;
                         var schoolName = data.schoolNames[i].schoolName;
                         var phone = data.schoolNames[i].phone;
                         var address = data.schoolNames[i].schoolAddress;
                         //console.log(schoolCate + '/'+schoolName);
                           
                         var tr = $("<tr>").attr("class", "table-active");
          	    		 var td1 = $("<td>").html(schoolCate);
             			 var td2 = $("<td>").html(schoolName);
             			 var td3 = $("<td>").html(phone);
             			 var td4 = $("<td>").html(address);
             			 //var td6 = $("<td>").html('<input type="button" class="button" id="modifyBtn" value="수정">');
             			 
             			 tr.append(td1).append(td2).append(td3).append(td4);
             			 $("#schoollist").append(tr);
             			 
          			   } // for문 
          			   
          			   
          			   
                    } // if문
              }, // success function
                    
              error : function() {
                 alert('검색이 실패하였습니다.');
             }
       });
    } // allList끝  
	
	$(document).on('click', 'tr.table-active', function(){ // 동적으로 생성될때는 on으로 이거해!!
    	var a = $(this).children(); //★★★★★ 자식값 얻어가기
  		
  		var schoolCate = a[0].childNodes[0].nodeValue;
  		var schoolName = a[1].childNodes[0].nodeValue;
  		var phone = a[2].childNodes[0].nodeValue;
  		var schoolAddress = a[3].childNodes[0].nodeValue;
  		//var mento = a[4].childNodes[0].nodeValue;
  		console.log(schoolCate+'/'+schoolName+'/'+phone+'/'+schoolAddress);
  		
  		//$('input[name=schoolCate]').attr('value', a);
  		$("#schoolCate").val(schoolCate);
  		$("#schoolName").val(schoolName);
  		$("#phone").val(phone);
  		$("#schoolAddress").val(schoolAddress);
  		//$("#mento").val(mento);
  		
  		$("#hiddenInfo").attr("method","GET").attr("action","${root}/school/goModify").submit();
  		
    });
	
    $("#name").keyup(function(e) { // 검색 시
    	   reset();
    
           var $category = $("#category").val();
           var $keyword = $(this).val();
            
           if($keyword.trim().length != 0) {
                  $.ajax({
                        url : "${root}/school/searchlist",
                        type : "GET",
                        contentType : "application/json;charset=UTF-8",
                        data : "category="+$category+"&keyword="+$keyword,
                        dataType : "json",
                        success : function(data) {
                             //console.log(data.schoolNames);
                             if(data.schoolNames != null){
                                for(var i=0;i<data.schoolNames.length;i++){
                                     var schoolCate = data.schoolNames[i].schoolCate1;
                                     var schoolName = data.schoolNames[i].schoolName;
                                     var phone = data.schoolNames[i].phone;
                                     var address = data.schoolNames[i].schoolAddress;
                                     //console.log(schoolCate + '/'+schoolName);
                                     
                                     var tr = $("<tr>").attr("class", "table-active");
                     	    		 var td1 = $("<td>").html(schoolCate);
                        			 var td2 = $("<td>").html(schoolName);
                        			 var td3 = $("<td>").html(phone);
                        			 var td4 = $("<td>").html(address);
                        			 
                        			 tr.append(td1).append(td2).append(td3).append(td4);
                        			 $("#schoollist").append(tr);
                        			 //$("#schoollist").remove();
                        			 
                                  } // for문 끝
                               } // if문 끝
                                 
                               },
                         error : function() {
                            //alert('검색이 실패하였습니다.');
                        }});
           } else {
    		
           }
    }); // keyup끝
    
    function reset() {
    	$("#schoollist").empty();
    }
    
   
});   
</script>

<form class="form-inline" id="searchName" action="" style="padding-top: 50px;  margin-bottom: 0px;">
   <div class="col-9 col-12-small">
      <div class="col-2 col-4-small" style="float: right;">
         <ul class="actions">
            <li><a href="#" class="button primary icon" ><i class="fas fa-search"  id="search"></i></a></li>
            </ul>
           <div class="col-0 col-8-small" style="float: right;"></div>
          </div>
               
       <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float:  right;">
          <input type="text" name="name" id="name" value="" placeholder="학교명을 입력하세요" />
       </div>
       
       <div class="col-7 col-7-small" style="float: right;">
         <select name="category" id="category">
            <option value="name">학교명</option>
            <option value="region">지역</option>
           </select>
        </div>
    </div>
</form>
<section style="padding-top: 0px;">
   <div class="table-responsive-lg">
      <table class="table" id="schoollistTop">
         <thead>
            <tr>
               <th style="width: 160px;">학교유형</th>
               <th>학교명</th>
               <th>전화번호</th>
               <th>학교주소</th>
            </tr>
         </thead>
         
         <tbody id="schoollist"></tbody>
         
      </table>
   </div>
   <form id="hiddenInfo">
	   	<input type="hidden" name="schoolCate" id="schoolCate" value="">
	   	<input type="hidden" name="schoolName" id="schoolName" value="">
	   	<input type="hidden" name="phone" id="phone" value="">
	   	<input type="hidden" name="schoolAddress" id="schoolAddress" value="">
	   	<input type="hidden" name="adress" id="adress" value="">
	   	<input type="hidden" name="adressDetail" id="adressDetail" value="">
   </form>
</section>
<%@ include file="/WEB-INF/views/template/own/admin_sidebar.jsp"%>