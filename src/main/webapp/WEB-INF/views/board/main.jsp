<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="hSchoolList" value="${requestScope.hSchoolList}"/>
<c:set var="uSchoolList" value="${requestScope.uSchoolList}"/>
<c:set var="hRecomList" value="${requestScope.hRecomList}"/>
<c:set var="uRecomList" value="${requestScope.uRecomList}"/>
<style>
label {
   padding-top: 1em !important;
}
section {
   padding-top: 1em !important;
}
img {
   margin: 0 auto;
}
span {
   cursor: pointer;
}
div.school { 
   margin: 0 auto;
}
</style>
</head>



                     <!-- Content -->
                     
                     <!-- 게시판 제목 -->
                        <section>
                     <!--========= table========== -->
                           <div class = "table-wrapper">
                                 <div class = "row school">
                                 <img src="${root}/img/school2.png">
                                 <div class="school-recommendation" style="margin-top: 5em; width: 100%;">
                                 <c:if test="${not empty uRecomList}">
                                 <div style="text-align: center; border: none;">
                                 	<label style="font-size: 2em;">회원님을 위한 추천 학교 목록</label>
                                 </div>
                                 <div style="width: 45%; float: left; border: none; margin: 1em; text-align: center;">
                                   <label style="font-size: 1em;">추천 고등학교</label>
                                                <table>
                                                   <thead>
                                                      <tr>
                                                      <th style="text-align: center;">학교이름</th>
                                                      <th style="text-align: center;">구분</th>
                                                      <th style="text-align: center;">홈페이지</th>
                                                      </tr>
                                                
                                                   </thead>
                                                   
                                                   <tbody>
                                                      <c:forEach var = "hSchool" items="${hRecomList}">
                                                         <tr>
                                                            <td>
                                                             <span class="recomSchoolName" data-code="${hSchool.schoolCode}" data-cate="h">${hSchool.schoolName}</span>
                                                            </td>
                                                            <td>
                                                            <span class="juris">${hSchool.schoolCate2}</span>&#9475;<span class="estab">${hSchool.estType}</span>
                                                            </td>
                                                            <td>
                                                            <span class="url" data-url="${hSchool.homePage}">
                                                               <c:choose>
                                                                   <c:when test="${fn:length(hSchool.homePage) > 29}">
                                                                        <c:out value="${fn:substring(hSchool.homePage,0,29)}"/>...
                                                                      </c:when>
                                                                   <c:otherwise>
                                                                        <c:out value="${hSchool.homePage}"/>
                                                                     </c:otherwise> 
                                                               </c:choose>
                                                            </span>
                                                            </td>
                                                         </tr>
                                                      </c:forEach>
                                                   </tbody>
                                                </table>
                                                </div>
                                                </c:if>
                                                <c:if test="${not empty uRecomList}">
                                                <div style="width: 48%; float: left; border: none; margin: 1em; text-align: center;">
                                               <label style="font-size: 1em;">추천 대학교</label> 
                                                <table>
                                                   <thead>
                                                      <tr>
                                                      <th style="text-align: center;">학교이름</th>
                                                      <th style="text-align: center;">구분</th>
                                                      <th style="text-align: center;">홈페이지</th>
                                                      </tr>
                                                
                                                   </thead>
                                                   
                                                   <tbody>
                                                      <c:forEach var = "uSchool" items="${uRecomList}">
                                                         <tr>
                                                            <td>
                                                             <span class="recomSchoolName" data-code="${uSchool.code}" data-cate="h">${uSchool.name}</span>
                                                            </td>
                                                            <td>
                                                            <span class="juris">${uSchool.type}</span>&#9475;<span class="estab">${uSchool.estType}</span>
                                                            </td>
                                                            <td>
                                                            <span class="url" data-url="${uSchool.link}">
                                                               <c:choose>
                                                                   <c:when test="${fn:length(uSchool.link) > 29}">
                                                                        <c:out value="${fn:substring(uSchool.link,0,29)}"/>...
                                                                      </c:when>
                                                                   <c:otherwise>
                                                                        <c:out value="${uSchool.link}"/>
                                                                     </c:otherwise> 
                                                               </c:choose>
                                                            </span>
                                                            </td>
                                                         </tr>
                                                      </c:forEach>
                                                   </tbody>
                                                </table>
                                                </div>
                                                </c:if>
                                 </div>
                                 </div>
                           </div>
                           
                        </section>

                  </div>
               </div>
      <script>
         $(document).ready(function() {
            $("span.ssdetail").on("click", function() {
               var $cate = $(this).attr("data-cate");
               var $code = $(this).attr("data-code");
               var url = "${root}/schoolinfo/schooldetail?schoolCate="+$cate+"&schoolCode="+$code;
                  window.open(url, "_blank"); 
               return false;
            });
            $("span.recomSchoolName").on("click", function() {
               var $cate = $(this).attr("data-cate");
               var $code = $(this).attr("data-code");
               var url = "${root}/schoolinfo/schooldetail?schoolCate="+$cate+"&schoolCode="+$code;
                  window.open(url, "_blank"); 
               return false;
            });
            $("span.url").on("click", function() {
               var url = $(this).attr("data-url");
               window.open(url, "_blank"); 
            });
         });
      </script>
<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>