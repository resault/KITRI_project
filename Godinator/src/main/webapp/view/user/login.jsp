<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<style>
a{
	text-decoration: none;
	border-bottom: none;
}

#kakao-login-btn{
	 width: 20% !important;
    
}

hr{
	border: 1px dashed #5a5a5a;
}
</style>		
	
<script type="text/javascript">
$(document).ready(function() {

	if("${msg}" != ""){
		alert("${msg}");
	}
	
		$("#moveRegister").click(function() {
				location.href="/godinator/user/moveRegister";
			});
			
			$("#loginGoBtn").click(function() {
				//alert("로그인버튼!");
					var id = $("#userId").val();
					var pwd = $("#pass").val();
					if(id == "") {
						alert("아이디를 입력해주세요");
						return;
					} else if(pwd == "") {
						alert("비밀번호를 입력해주세요");
						return;
					} else {
						$("#loginForm").attr("method", "post").attr("action", "${root}/user/login").submit();
					}
			});
	});
	
	/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>카카오톡 로그인>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>. */
	</script>
							<!-- Content -->
								<div id="loginAll">
									<header class="main">
										<label style="font-size: 3em;">로그인</label>
									</header>
									<!-- Content -->
									<form id="loginForm" name="loginForm">
									<div>
										<label style="font-size: 1em; float: left; " id="contentId">아이디</label>
										   <input type="text" style="width: 200px; float: left; margin-left: 1em;" name="userId" id="userId" value="" placeholder="아이디를 입력하세요" />
									</div>
									<div style="clear: both; margin-bottom: 1em;"></div>
										   <br>
									<div> 
										<label style="font-size: 1em; float: left; " id="contentPwd">비밀번호</label>
										   <input type="password" style="width: 200px; float: left; margin-left: 1em;" name="pass" id="pass" value="" placeholder="비밀번호를 입력하세요" />
									</div>
									<div style="clear: both; margin-bottom: 1em;"></div>
									</form>
										   <br>
									<ul class="actions">
										<li><a id="loginGoBtn" class="button">로그인</a></li>
										<li><a href="#" class="button" id="moveRegister">회원가입</a></li>
									</ul>
									<br>
										<a id="kakao-login-btn" ></a>
										<script>
										
										var token;
									    // 사용할 앱의 JavaScript 키를 설정해 주세요.
									    Kakao.init('45bb62aaacbd960790cdbac158d998e7');
									    // 카카오 로그인 버튼을 생성합니다.
									    Kakao.Auth.createLoginButton({
									      container: '#kakao-login-btn',
									      // 1 로그인 성공
									      success: function(authObj) {
									    	  
									    	  // 1-1. 사용자 정보 요청 api 호출
									    	  Kakao.API.request({
									    		 url : '/v2/user/me',
									    		 success: function(res){
							                          var userId = res.id;
							                          var userNickName = res.properties.nickname;
							                          var profile_image = res.properties.profile_image;
							                          
							                          var userEmail = "";
							                          var age = "";
							                          var gender = "";
							                          
							                          // 값 제공 동의 필요 여부 (false면 동의한 항목인 것 = 값을 얻음)
							                          var age_agree = res.kakao_account.age_range_needs_agreement;
							                          var email_agree = res.kakao_account.email_needs_agreement;
							                          var gender_agree = res.kakao_account.gender_needs_agreement;
							                          
							                          if(!email_agree){
							                             userEmail = res.kakao_account.email;
							                          }else {
							                             userEmail = "";
							                          }
							                          
							                          /* if(!age_agree){
							                             age = res.kakao_account.age_range;
							                             var idx = age.lastIndexOf("~");
							                             age = age.substring(0, idx);
							                          }else {
							                             age = 0;
							                          } */
							                          
							                          if(!gender_agree){
							                             gender = (res.kakao_account.gender == "female") ? "여" : "남";
							                          }else {
							                             gender = "여";
							                          }
							                          
							                          if(profile_image == null){
							                             profile_image = "user.png";
							                          }

									    			 
									    			 // 가입 여부 확인
									    			 $.ajax({
									    					type: 'GET',
									    					url : '${root}/user/idcheck',
									    					dataType : 'json',
									    					data : {'checkid' : userId},
									    					success : function(data){
									    						idcnt = parseInt(data.idcount);
									    						// 아이디 존재 여부 x
									    						if(idcnt == 0){
									    							alert("가입된 이력이 없습니다. 회원가입 페이지로 이동합니다.");
									    							// 로그인 처음인 경우, 회원가입 처리
													    			
													    						// 카톡 id로 로그인
													    						$("#ui").val(userId);
													    						$("#pw").val('kakao');
													    						$("#name").val(userNickName);
													    						$("#age").val(age);
													    						$("#gender").val(gender);
													    						$("#kakao_profile").val(profile_image);
													    						
													    						$("#kakaologin").attr("method","post").attr("action", "${root}/user/moveRegister").submit();
													    						
													    					}else{ // 아이디 존재 여부 o
													    						
													    						alert("카톡 바로 로그인");
												    							
												    							// 카톡 id로 로그인
												    							$("#ui").val(userId);
													    						$("#pw").val('kakao');
													    						$("#name").val(userNickName);
													    						$("#age").val(age);
													    						$("#gender").val(gender);
													    						$("#kakao_profile").val(profile_image);
													    						
													    						$("#kakaologin").attr("action", "${root}/user/login").submit();

													    					}
													    				}
									    						
									    						});
									    					},
									    					fail : function(error){
												    			 alert("정보 요청 실패");
									    						alert(JSON.stringify(error));
									    					}
									    				});
									    			 
									    		 },
									    		 fail : function(error){
									    			 alert("로그인 실패 (토큰 못 얻어옴)");
									    			 alert(JSON.stringify(error));
									    		 }
									    	  });
													        
										</script>
										
											<form id="kakaologin" method="POST">
												<input type="hidden" name="userId" id="ui"/>
												<input type="hidden" name="pass" id="pw"/>
												<input type="hidden" name="name" id="name"/>
												<input type="hidden" name="age" id="age"/>
												<input type="hidden" name="gender" id="gender"/>
												<input type="hidden" name="profile" id="kakao_profile"/>
											</form>
								<!-- 	<hr class="major" /> -->
								</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>