<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style>
hr{
	border: 1px dashed #5a5a5a;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#userId").keyup(function() {
		var id = $("#userId").val();
		if(id.length < 5 || id.length > 10) {
			//console.log(id.length);
			cnt = 1;
			$("#idresult").css("color", "tomato");
			$("#idresult").text("아이디는 5자이상 10자이하입니다.");
		}else {
			$.ajax({
				type : "GET",
				url : "/godinator/user/idcheck",
				dataType : "json",
				data : {"checkid" : id},
				success : function(data) {
					cnt = parseInt(data.idcount);
					if(cnt == 0) {
						$("#idresult").css("color", "steelblue");
						$("#idresult").html("<strong>" + id + "</strong>는 사용 가능합니다.");
					} else {
						$("#idresult").css("color", "magenta");
						$("#idresult").html("<strong>" + id + "</strong>는 사용중입니다.");
					}
				}
			});
		}
	});
	
	// password 형식 - 정규표현식
	// 숫자, 특수문자, 영문자 포함한 8~15자리 이내의 비밀번호만 허용
	var passwordRule = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,14}$/;
	
	$("#pass").keyup(function(){
		var pass = $(this).val();
		
		 if(!passwordRule.test(pass)){
			$("#passresult").css('color', 'tomato');
			$("#passresult").html('비밀번호는 특수문자, 영문, 숫자를 포함한 8~15자리입니다.');
		} else{
			$("#passresult").css('color', 'steelblue');
			$("#passresult").html('사용 가능한 비밀번호 입니다.');
		}
	});
	
	$("#registerBtn").click(function() {
		
		if($("#userId").val() == "") {
			alert("아이디를 입력하세요");
			return;
		} else if($("#userName").val() == "") {
			alert("이름을 입력하세요");
			return;
		} else if($("#pass").val() == "") {
			alert("비밀번호를 입력하세요");
			return;
		} else if($("#pass").val() != $("#passcheck").val()) {
			alert("비밀번호를 확인하세요");
			return;
		} else if(cnt != 0) {
			alert("아이디 중복 확인을 하세요");
			return;
		}else if($("#userCate").val() =="선택하세요"){
			alert("회원구분을 선택하세요");
			return;
		}else {
			$("#memberform").attr("action", "/godinator/user/register").submit();
		}
	});
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open();
}
</script>

		<link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/register.css"/>
	
							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>회원가입</h1>
										<h4 class="subtitle">기본 인적사항을 입력해주세요!</h4>
									</header>
							<br><br>
									<!-- Content -->
									<form id="memberform" name="memberform" method="post" action="">
									<div>
										<h3 id="contentId">이름</h3>
										   <input type="text" name="userName" id="userName" />
										   <br>
									
										<h3 id="contentPwd">아이디</h3>
										   <input type="text" name="userId" id="userId" />
										   <div id="idresult"></div>
										   <br>
									
										<h3 id="contentPwd">비밀번호</h3>
										   <input type="password" name="pass" id="pass" />
										   <div id="passresult"></div>
										   <br>
									
										<h3 id="contentPwd">비밀번호 확인</h3>
										   <input type="password" name="passcheck" id="passcheck" />
										   <div id="pwdCheck"></div>
										   <br>
										

										<!-- <label for="email">이메일</label><br>
									<div id="email" class="custom-control-inline"> -->
									<input type="hidden" class="form-control" id=email name="email" placeholder="" size="25" value="${emailStr}">
									<input type="hidden" id="emailDomain" name="emailDomain" value="${emailDomain}">
									<!-- </div> -->

										   <br>
										
										<div class="form-group" align="left">
											<label for="tel">전화번호</label>
											<div id="tel" class="custom-control-inline">
											<select class="form-control" id="phone1" name="phone1">
												<option value="010">010</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="041">041</option>
												<option value="051">051</option>
												<option value="061">061</option>
											</select> _
											<input type="text" class="form-control" id="phone2" name="phone2" placeholder="1234"> _
											<input type="text" class="form-control" id="phone3" name="phone3" placeholder="5678">
											</div>
										</div>
										
										   <br> <br>
									     
										<h3 id="contentPwd">우편번호</h3>
										   <input type="text" name="zipcode" id="zipcode"/>
										   <a href="#" class="button" id="zipcodeSearchBtn" onclick="sample6_execDaumPostcode();">우편번호검색</a>
										   
									
 	   								<div id="list"> <!-- 검색 결과 리스트 출력 영역 -->
 	   								 </div>
										   <br>
										   <br>
										<h3 id="contentPwd">주소</h3>
										   <input type="text" name="address" id="address" />
										   <br>
									
										<h3 id="contentPwd">상세주소</h3>
										   <input type="text" name="addressDetail" id="addressDetail" />
										   <input type="text" id="sample6_extraAddress" placeholder="참고항목">
										   
										   <br><br>
										   <h3 id="contentPwd">회원구분</h3>
										   <select class="form-control" id=userCate name="userCate">
												<option value="선택하세요">선택하세요</option>
												<option value="s">학생</option>
												<option value="p">학부모</option>
											</select> 
									</div>
									</form>
										   <br>
									<ul class="actions">
										<!-- <li>1/4</li> -->
										<li><a href="#" class="button primary" id="registerBtn">다음페이지</a></li>
									</ul>
									
								</div>

<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>