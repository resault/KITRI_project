<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/own/admin_header.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	alert('현재 신고된 내역이 존재하지 않습니다.');
	
	
});
</script>

<section>
   <div class="table-responsive-lg">
      <table class="table" id="reportlistTop" >
         <thead>
            <tr>
               <th>신고코드</th>
               <th>글번호</th>
               <th>제목</th>
               <th>내용</th>
               <th>신고시각</th>
            </tr>
         </thead>

         <tbody id="reportlist"></tbody>

      </table>
   </div>
</section>
<%@ include file="/WEB-INF/views/template/own/admin_sidebar.jsp"%>