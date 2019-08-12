<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
		 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	
</style>
<script>
history.forward();
$(function(){
	var cate1;
	var cate2;
	<%-- 학교 분류 select 변경 이벤트 처리 --%>
	$('#schoolCate1').change(function(){
		if($(this).val() == 'h') {
			$('#hcate2').css('display', '');
			$('#ucate2').css('display', 'none');
			$('#majorDiv').css('display', 'none');
		} else {
			$('#hcate2').css('display', 'none');
			$('#ucate2').css('display', '');
			$('#majorDiv').css('display', '');
		}
		$('#schoolName').val('');
	});
	$('#hcate2, #ucate2').change(function(){
		$('#schoolName').val('');
	});
	
	<%-- 학교 검색창 활성화 --%>
	$('#schoolName').click(function(){
		cate1 = $('#schoolCate1 option:selected').val();
		cate2 = (cate1 == 'h') ? $('#hcate2 option:selected').val() : $('#ucate2 option:selected').val();
		$('#myModal').css("display", "block");
		$('#srcName').focus();
		return false;
	});
	
	<%-- 학교 검색 --%>
	$('#srcName').keyup(function(e){
		if(e.keyCode == 27){
			modalClose();
		} else {
			var srcName = $(this).val().trim();
			if(srcName != '') {
				var param = JSON.stringify({'srcName' : srcName, 'cate1' : cate1, 'cate2' : cate2});
				$.ajax({
					url: '${root}/resume/srcschool',
					contentType : 'application/json; charset=UTF-8',
					type: 'POST',
					dataType : 'json',
					data : param,
					success: function(response){
						var list = '';
						var cnt = response.length;
						if(cnt != 0) {
							for(var i=0;i<cnt;i++) {
								var school = response[i];
								list += '<tr class="school" data-code="' + school.bSchoolCode + '" data-name="' + school.bSchoolName + '" data-cate1="' + school.bSchoolCate1 + '" data-cate2="' + school.bSchoolCate2 + '" >';
								list += '	<td>' + school.bSchoolName + '</td>';
								list += '	<td>' + ((school.bSchoolCate2 != undefined) ? school.bSchoolCate2 : '') + '</td>';
								list += '</tr>';
							}
						} else {
							list = '<tr><td>검색결과가 없습니다.</td></tr>';
						}
						$('#schoolList').html(list);
					}
				});
			}
		}
		return false;
	});
	
	<%-- #### 학교선택 #### --%>
	$(document).on('click', '.school', function(){
		var cate1 = $(this).attr('data-cate1');
		var cate2 = ($(this).attr('data-cate2') != 'undefined') ? $(this).attr('data-cate2') : '0';
		if(cate1 == 'h') {
			$('#hcate2').val(cate2).prop("selected", true);
		} else {
			$('#ucate2').val(cate2).prop("selected", true);
		}
		$('#schoolName').val($(this).attr('data-name'));
		$('#bSchoolName').val($(this).attr('data-name'));
		$('#bSchoolCode').val($(this).attr('data-code'));
		$('#bSchoolCate1').val($(this).attr('data-cate1'));
		$('#bSchoolCate2').val(cate2);
		modalClose();
		return false;
	});
	
	<%-- #### 저장 #### --%>
	$('#saveBtn').click(function(){
		if($('#schoolName').val() == ''){
			alert('학교를 선택하세요.');
		} else if($('#boardSubject').val() == ''){
			alert('제목을 입력하세요.');
		} else if($('#majorDiv').css('display') != "none" && $('#major option:selected').val() == '0'){
			alert('전공을 선택하세요.');
		} else if($('#boardContent').val() == ''){
			alert('내용을 입력하세요.');
		}  else {
			if(confirm('저장 완료된 자소서는 삭제할 수 없습니다. 작성한 자소서를 저장하시겠습니까?')) {
				if($('#bSchoolCate1').val() == 'u') {
					$('#bSchoolCate2').val($('#bSchoolCate2').val() + '||' + $('#major').val());
				}
				var param = $('form').serialize();
				$.ajax({
					url: '${root}/resume/writeresume',
					type: 'POST',
					data: param,
					success: function(response) {
						if(response == '2') {
							alert('자소서 저장이 완료되었습니다. 목록 페이지로 이동합니다.');
							location.href = '${root}/resume/resumelist';
						} else {
							alert('서버 문제로 인하여 자소서 저장에 실패하였습니다. 나중에 다시 시도하세요.');
						}
					}
				});
			}
		}
		return false;
	});

	<%-- #### 취소 #### --%>
	$('#cancleBtn').click(function(){
		if(confirm('자소서 작성을 취소하시겠습니까?')) {
			history.back();
		} else {
			return false;
		}
	});
	
	<%-- #### function #### --%>
	function modalClose(){
		$('#myModal').css('display', 'none');
		$('#srcName').val('');
		$('#schoolList').empty();
	}
	
	
	<%-- #### 기타 화면상 기능 #### --%>
	<%-- 마우스 커서 변경 --%>
	$('#schoolName').css('cursor', 'pointer');
	
	<%-- 모달창 종료 --%>
	$('#close').click(function(){
		modalClose();
	});
	$(document).keyup(function(e){
		if(e.keyCode == 27){
			modalClose();
		}
	});
	
	<%-- 모달창 tr 색상 변경 --%>
	$(document).on('mouseover', '.school', function(){
		$(this).css('background-color', 'lightgrey').css('cursor', 'pointer');
	});
	$(document).on('mouseout', '.school', function(){
		$(this).css('background-color', '');
	});
});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">자소서 작성</label>
			</header>
			
			<!-- Form -->

			<form method="post" action="#"  id="mentorForm">
				<input type="hidden" id="bSchoolName" name="bSchoolName">
				<input type="hidden" id="bSchoolCode" name="bSchoolCode">
				<input type="hidden" id="bSchoolCate1" name="bSchoolCate1">
				<input type="hidden" id="bSchoolCate2" name="bSchoolCate2">
				<input type="hidden" id="mentorId" name="mentorId" value="${mentor}">
				<div class="row gtr-uniform">
					<%-- 학교정보 --%>
					<div class="row gtr-uniform" style="margin: 0">
						<div class="col-2" style="padding-left: 0; width: 10em;">
							 <select name="schoolCate1" id="schoolCate1" >
								<option value="h">고등학교</option>
								<option value="u">대학교</option>
							</select>
						</div>
						<div class="col-2" style="padding-left: 1em; width: 10em;">
							<select name="hcate2" id="hcate2">
								<option value="0">- 전체 -</option>
								<option value="특수목적고등학교">특수목적고등학교</option>
								<option value="일반고등학교">일반고등학교</option>
								<option value="자율고등학교">자율고등학교</option>
								<option value="특성화고등학교">특성화고등학교</option>
							</select>
							<select name="ucate2" id="ucate2" style="display: none;">
								<option value="0">- 전체 -</option>
								<option value="대학교">대학교</option>
								<option value="전문대학">전문대학</option>
								<option value="사이버대학">사이버대학</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div class="col-2" id="majorDiv" style="padding-left: 1em; width: 10em; display: none;">
							<select name="major" id="major">
								<option value="0">- 전공 -</option>
								<option value="인문·사회">인문·사회</option>
								<option value="자연·공학">자연·공학</option>
								<option value="의학">의학</option>
								<option value="예술·체육">예술·체육</option>
								<option value="교육">교육</option>
							</select>
						</div>
						<div class="col-2" style="width: 14em; padding-left: 1em; "> 
							 <input type="text" readonly="readonly" id="schoolName" name="schoolName" placeholder="학교명"/>
						</div>
					</div>
					<div class="col-12" style="margin-top: 3em; margin-bottom: 1em; text-align: right;">
						<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">mentor ID : ${mentor}</label>
						<hr class="major" style="margin-top: 0;"/>
					</div>
					<%-- 자소서 --%>
					<div class="col-12">
						<textarea style="resize: none;" name="boardSubject" id="boardSubject" placeholder="제목을 입력하세요" rows="1"></textarea>
					</div>
					<div class="col-12">
						<textarea style="resize: none;" name="boardContent" id="boardContent" placeholder="내용을 입력하세요" rows="20"></textarea>
					</div>
					<%-- 버튼 --%>
					<div class="col-12">
						<div style="float: right;">
							<ul class="actions">
								<li><input type="submit" id="saveBtn" value="저    장" class="primary" /></li>
								<li><input type="reset" id="cancleBtn" value="취    소" /></li>
							</ul>
						</div>
					</div>
				</div>
			</form>
		</section>
		<div id="myModal" class="modal">
	      <!-- Modal content -->
	      <div class="modal-content">
	      	<div style="border-bottom: solid; padding-bottom: 0.7em;  margin-bottom: 0.5em;">
	        	<div class="close" id="close" style="float: right;">&times;</div>
	      		<div style="float: left; margin-left: 0.5em;">
					<input type="text" id="srcName" placeholder="학교명"/>
				</div>
	      		<div style="clear: both;"></div>
        	</div>                                                               
	        <div style=" height: 350px; overflow-y: auto">
	        	<table>
	        		<tbody id="schoolList">
					</tbody>
	        	</table>
	        </div>
	      </div>
	    </div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>