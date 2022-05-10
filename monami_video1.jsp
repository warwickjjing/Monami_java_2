<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MONAMI</title>
    <link rel="shortcut icon" href="${cp}/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${cp}/css/news_video.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script type="text/javascript" src="${cp}/js/common.js"></script>
    <script type="text/javascript">
      $(function () {
        $(document).on("click", ".find_f", function () {
          dh = $(document).height();
          poph = $(".find_layer").height();

          $("#bgblack").height(dh).show();
          $(".find_layer")
            .show()
            .animate({ top: $(document).scrollTop() + 50 + "px" }, 100);
        });
        $("#bgblack,.btnx_").click(function () {
          $("#bgblack").height(dh).hide();
          $(".find_layer").hide();
        });
      });
    </script>
    <script>
        function youtubeFullscreen(url){
                window.open(url,"","fullscreen,scrollbars")
        }
        </script>
        <style>
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 2500px; 
            background-color: black; 
            z-index:1001; 
            opacity:.80; 
            filter: alpha(opacity=80); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 70%; 
            left: 25%; 
            width: 50%; 
            height: 50%; 
            padding: 16px; 
            z-index:1002; 
            overflow: auto; 
        } 

/* The Modal (background) */
.modal , .modal1{
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.login , .join{
	background-color: #fefefe;
	margin: 5px auto; /* 15% from the top and centered */
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
	height: 500px;
	position: relative;
	margin: 0 auto;
	position: relative;
}
.join{
	height:700px;
	margin: -30px auto;
	overflow:scroll;
}

a {
	color: #333;
	text-decoration: none;
}

input {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	cursor: text;
	margin: 0em;
	font: 400 13.3333px Arial;
	padding: 1px 0px;
	border-width: 2px;
	border-style: inset;
	border-color: initial;
	border-image: initial;
}

.modal h2 , .modal1 h2{
	font-size: 30px;
	text-align: center;
	padding: 30px;
	padding-bottom: 10px;
}

.inner_login {
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -145px 0 0 -160px;
}

.screen_out {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	line-height: 0;
	text-indent: -9999px;
}

body, button, input, select, td, textarea, th {
	font-size: 13px;
	line-height: 1.5;
	-webkit-font-smoothing: antialiased;
}


fieldset{
	padding-left: 10px;
	padding-right: 10px;
	border:0;
}
img{
	border: 0;
}
.close {
	position: absolute;
	right: 5px;
	top: 0;
	color: #000;
	font-size: 20px;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

.login .box_login , .join .box_join{
	margin: 35px 0 0;
	border-radius: 3px;
	background-color: #fff;
	box-sizing: border-box;
	border-radius: 3px
}

.login .inp_text ,.join .inp_text{
	position: relative;
	width: 100%;
	margin: 0;
	padding: 18px 19px 19px;
	box-sizing: border-box;
	border:1px solid #ddd;
}
div#zipcode{
	width:60%;
	float:left;
}
.login .inp_text+.inp_text , .join .inp_text+.inp_text{
	border-top: 1px solid #ddd;
}

#loginForm #joinForm{
	width: 100%;
}

.inp_text input {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 13px;
	color: #000;
	border: none;
	outline: 0;
	-webkit-appearance: none;
	background-color: transparent;
}
.btn_ck, .btn_zip{
	color:#fff;
	background-color:#000;
	padding: 10px 30px;
    margin: 5px;
    border: none;
    border-radius: 3px;
    cursor:pointer;
}
input.btn_zip{
	margin-left:20px;
	margin-top:2px;
	padding:15px 30px;
}
.btn_login, .btn_join{
	margin: 20px 0 0;
	width: 100%;
	height: 48px;
	border-radius: 3px;
	border:none;
	font-size: 16px;
	color: #fff;
    background: #c40f39;
    cursor:pointer;
}

.login_append {
	overflow: hidden;
	padding: 15px 0 0;
}

.inp_chk {
	display: inline-block;
	position: relative;
	margin-bottom: -1px;
}

.login_append .inp_chk {
	float: left;
}

.inp_chk .inp_radio {
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
	width: 18px;
	height: 18px;
	border: none;
}

.inp_chk .lab_g {
	display: inline-block;
	margin-right: 19px;
	color: #909090;
	font-size: 13px;
	line-height: 19px;
	vertical-align: top;
	font-family: "Montserrat", sans-serif;
}

.inp_chk .ico_check {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 1px 4px 0 0;
	background-position: -60px 0;
	color: #333;
}

.inp_chk .txt_lab {
	vertical-align: top;
	padding-left:20px;
	font-family: "Montserrat", sans-serif;
	color: #909090;
	font-size: 13px;
}

.login_append .txt_find {
	float: right;
	color: #777;
}
.login_append .txt_find .link_find {
	font-size: 13px;
}
</style>
<body>
<c:set var='cp' value="${pageContext.request.contextPath }"/>
<c:if test="${not empty param.login}">
		<script>alert("로그인 실패! 다시 시도해 주세요!");</script>
	</c:if>
<div class="popup_buttons">
    <a class="popup_button" href="">
      <div class="popup_button-txt">예약하기</div>
    </a>
    <a class="popup_button-close" onclick="jQuery(this).parent().hide(); return false" href="#">예약하기 버튼 닫기</a>
  </div>
  <div id="header">
    <div class="head">
      <div class="head_top">
        <div class="conwrap">
          <div class="links">
            <div class="lang">
              <div class="this_lang">
                <a>KOR</a>
              </div>
              <ul>
                <li><a href="http://www.monami.com/en/">ENG</a></li>
              </ul>
            </div>
            <div class="sns">
              <ul>
                <li>
                  <a href="#https://www.facebook.com/monami1960" target="_blank">
                    <img src="${cp}/images/sns_facebook.gif" alt="페이스북" />
                  </a>
                </li>
                <li>
                  <a href="https://www.instagram.com/monami_official/" target="_blank">
                    <img src="${cp}/images/sns_insta.gif" alt="인스타" />
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="topmenu">
            <ul>
            	<c:choose>
           			<c:when test="${loginUser.user_id!=null}" >
            	<li><span>${loginUser.user_id} 님 환영합니다.</span>&nbsp;&nbsp;
					<a href="${cp}/jungmin/usermodify.mo">MYPAGE</a>&nbsp;
					<a href="${cp}/user/UserLogoutOk.us">LOGOUT</a></li>
					</c:when>
							<c:otherwise>
							<li><a class="join_click"
								onclick="document.getElementById('id02').style.display='block'">JOIN</a>
								<!-- The Modal -->
								<div class="modal1" id="id02">
									<div class="join">
										<span
											onclick="document.getElementById('id02').style.display='none'"
											class="close">&times;</span>
										<h2>
											<img src="${cp}/images/logo.jpeg">
										</h2>
										<div id="result">&nbsp;</div>
										
										<form method="post" id="joinForm" name="joinForm"
											action="${cp}/user/UserJoinOk.us"   onsubmit="return sendit()">
											<fieldset>
												<legend class="screen_out">회원가입 정보 입력폼</legend>
												<div class="box_join">
													<div class="inp_text">
														<input
															type="text" id="user_id" name="user_id" placeholder="ID">
													</div>
													<input type="button" value="중복검사" class="btn_ck" onclick="checkId()">
													<div class="inp_text">
														<label for="user_pw" class="screen_out">비밀번호</label> <input
															type="password" id="user_pw" name="user_pw"
															placeholder="Password">
													</div>
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_name" class="screen_out">이름</label> <input
															type="text" id="user_name" name="user_name"
															placeholder="이름">
													</div>
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_dob" class="screen_out">생년월일</label> <input
															type="txt" id="user_dob" name="user_dob"
															placeholder="생년월일 (예:19950427)">
													</div>
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text" id="zipcode">
														<label for="user_zipcode" class="screen_out">우편번호</label> <input
															type="txt" id="sample6_postcode" name="user_zipcode"
															placeholder="우편번호">
													</div>
													<input type="button"  class="btn_zip"onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_addr" class="screen_out">주소</label> <input
															type="txt" id="sample6_address" name="user_addr"
															placeholder="주소">
													</div>
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_addrdetail" class="screen_out">상세주소</label> <input
															type="txt" id="sample6_detailAddress" name="user_addrdetail"
															placeholder="상세주소">
													</div>
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_addretc" class="screen_out">참고항목</label> <input
															type="txt" id="sample6_extraAddress" name="user_addretc"
															placeholder="참고항목">
													</div>
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_phone" class="screen_out">핸드폰 번호</label>
														<input type="tel" id="user_phone" name="user_phone"
															placeholder="핸드폰 번호">
													</div>
												</div>
												<button type="submit" class="btn_join">회원가입</button>
												
											</fieldset>
										</form>

									</div>
								</div></li>
							<li><a
								onclick="document.getElementById('id01').style.display='block'">LOGIN</a>
							
								<!-- The Modal -->
								<div class="modal" id="id01">
									<div class="login">
										<span
											onclick="document.getElementById('id01').style.display='none'"
											class="close">&times;</span>
										<h2>
											<img src="${cp}/images/logo.jpeg">
										</h2>
											
										<form method="post" id="loginForm"
											action="${cp}/user/UserLoginOk.us">
											
											<fieldset>
												<legend class="screen_out">로그인 정보 입력폼</legend>
												<div class="box_login">
													<div class="inp_text">
													 <label for="user_id1" class="screen_out">아이디</label> <input
															type="text" id="user_id1" name="user_id1" placeholder="ID"> 
													</div> 
													<div class="nbsp">&nbsp;</div>
													<div class="inp_text">
														<label for="user_pw1" class="screen_out">비밀번호</label> <input
															type="password" id="user_pw1" name="user_pw1"
															placeholder="Password">
													</div>
												</div>
												<button type="submit" class="btn_login">로그인</button>
												<div class="login_append">
													<div class="inp_chk">
														<!-- 체크시 checked 추가 -->
														<input type="checkbox" id="keepLogin" class="inp_radio"
															name="keepLogin">
															<span class="txt_lab"
															style="display: inline-block">로그인 상태 유지</span>
														
													</div>
													<span class="txt_find"> <a
														href="${cp}/jungmin/idsearch.mo" class="link_find">아이디</a> / <a
														href="${cp}/jungmin/pwsearch.mo" class="link_find">비밀번호 찾기</a>
													</span>
												</div>

											</fieldset>
										</form>

									</div>
								</div></li>
								</c:otherwise>
								
								</c:choose>
                    <li>
                        <a href="http://www.monami.com/index.php">HOME</a>
                    </li>
                    <li>
                        <a href="${cp}/sitemap.html">SITE MAP</a>
                    </li>
                    <li>
                        <a href="http://www.monami.com/customer/inquiry.php">CONTACT US</a>
                    </li>
                </ul>
            </div>
        </div>
        </div>
        <div class="gnb">
            <div class="conwrap">
            <h1>
                <a href="#"><img src="./images/logo.jpeg" alt="" /></a>
            </h1>
            <div class="nav">
                <ul>
                    <li>
                        <a href="./about/ceo.html">모나미소개</a>
                    <ul>
                        <li>
                            <a href="./about/ceo.html">CEO 메시지</a>
                        </li>
                        <li>
                            <a href="./about/company.html">회사정보</a>
                        </li>
                        <li>
                            <a href="./about/history.html">회사연혁</a>
                        </li>
                        <li>
                            <a href="#">투자정보</a>
                        </li>
                        <li>
                            <a href="#">CI</a>
                        </li>
                        <li>
                            <a href="#">채용정보</a>
                        </li>
                        <li>
                            <a href="#">찾아오시는 길</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">모나미제품</a>
                    <ul>
                        <li>
                            <a href="#">펜</a>
                        </li>
                        <li>
                            <a href="#">마카</a>
                        </li>
                        <li>
                            <a href="#">형광펜</a>
                        </li>
                        <li>
                            <a href="#">미술용품</a>
                        </li>
                        <li>
                            <a href="#">기타</a>
                        </li>
                        <li>
                            <a href="#">카탈로그</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="monami_news1.jsp">NEWS & VIDEO</a>
                    <ul >
                        <li>
                            <a href="monami_news1.html">보도자료</a>
                        </li>
                        <li>
                            <a href="monami_video1.html">동영상자료</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">모나미 미술대회</a>
                    <ul>
                        <li>
                            <a href="#">미술대회 소개</a>
                        </li>
                        <li>
                            <a href="#">수상작 발표</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">고객지원</a>
                    <ul>
                        <li>
                            <a href="#">자주묻는질문</a>
                        </li>
                        <li>
                            <a href="#">문의하기</a>
                        </li>
                        <li>
                            <a href="#">이벤트</a>
                        </li>
                        <li>
                            <a class="find_f">모나미 패밀리샵 찾기</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">기업 구매 / 개발</a>
                    <ul class="hovermenu">
                        <li><a href="#">기업 및 단체 구매</a></li>
                        <li><a href="#">산업용 맞춤 제품개발</a></li>
                    </ul>
                </li>
                </ul>
            </div>
            <div class="search">
                <div class="btn_all">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="nav_search">
                <input type="text" name="" id="" />
                <a href="${cp}/search.html">
                    <img src="${cp}/images/btn_search.gif" alt="" />
                </a>
                </div>
            </div>
            <div class="allmenu" style="display: none;">
                <div class="menubox">
                    <h2>모나미소개</h2>
                    <ul>
                        <li><a href="./about/ceo.html">CEO 메시지</a></li>
                        <li><a href="./about/company.html">회사정보</a></li>
                        <li><a href="./about/history.html">회사연혁</a></li>
                        <li><a href="#">투자정보</a></li>
                        <li><a href="#">CI</a></li>
                        <li><a href="#" target="_blank">채용정보</a></li>
                        <li><a href="#">찾아오시는 길</a></li>
                    </ul>
                </div>
                <div class="menubox">
                    <h2>모나미제품</h2>
                    <ul>
                        <li><a href="#">펜</a></li>
                        <li><a href="#">마카</a></li>
                        <li><a href="#">형광펜</a></li>
                        <li><a href="#">미술용품</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">카탈로그</a></li>
                    </ul>
                </div>
                <div class="menubox">
                    <h2>NEWS &amp; VIDEO</h2>
                    <ul>
                        <li><a href="#">보도자료</a></li>
                        <li><a href="#">동영상자료</a></li>
                    </ul>
                </div>
                <div class="menubox">
                    <h2>모나미 미술대회</h2>
                    <ul>
                        <li><a href="#" target="_blank">미술대회 소개</a></li>
                        <li><a href="#" target="_blank">수상작 발표</a></li>
                    </ul>
                </div>
                <div class="menubox">
                    <h2>고객지원</h2>
                    <ul>
                        <li><a href="#">자주묻는질문</a></li>
                        <li><a href="#">문의하기</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a class="find_f">모나미 패밀리샵 찾기</a></li>
                    </ul>
                </div>
                <div class="menubox">
                <h2><a href="#" target="_blank">기업 구매 / 개발</a></h2>
                </div>
            </div>
        </div>
        </div>
    </div>
    </div>
    <!-- 헤더 끝 -->
    <!-- 본문 시작  -->
    <div id="container">
        <div class="contents">
            <div class="pagetitle pn5">
                <h2>
                    " NEWS &amp; VIDEO "
                </h2>
                <p> 모나미는 늘 밝고 새로운 미래를 그려나갑니다.</p>
            </div>
            <div class="pagetabs">
                <ul class="m5">
                    <li>
                        <a href="monami_news1.html">보도자료</a>
                    </li>
                    <li class="on">
                        <a href="#">동영상자료</a>
                    </li>
                </ul>
            </div>
            <h3 class="title1">
                MONAMI
                <span>VIDEO</span>
            </h3>
            <div class="bbs_gall">
                <ul>
                <c:choose>
                	<c:when test="${boardList.size()>0 and boardList != null}">
		            <c:forEach var="board" items="${boardList}">
		            	<c:choose>
                		<c:when test="${boardList.size()-last_idx eq 0}"><!-- 첫번째 동영상 -->
                			<li data-idx="${last_idx}">
                			<p>
                            <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                <div class="thumarea">
                                    <img src="${cp}/images/${board.video_img}" alt="" width="335" height="188">
                                    <div class="btn_play"></div>
                                </div>
                                <div class="txtarea">
                                    <div class="sbj">${board.video_title}</div>
                                    <div class="date">${board.created_at}</div>
                                </div>
                            </a>
                        </p>
                        <div id="light" class="white_content">
                            <!--유투브소스 -->
                                <object width="560" height="315">
                                    <param name="movie" value="${board.video_content}">
                                </param>
                                    <param name="allowFullScreen" value="true">
                                </param>
                                    <param name="allowscriptaccess" value="always">
                                </param>
                                <embed src="${board.video_content}" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true">
                                </embed>
                            </object>
                            
                            <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기
                            </a>
                        </div>
		                    	<div id="fade" class="black_overlay">
		
		                    	</div>
                    		</li>
                		</c:when>
                		<c:otherwise><!-- 첫번째가 아닌 동영상 -->
                			<li data-idx="${board.video_idx}">
                        		<a href="${board.video_content}">
	                            	<div class="thumarea">		
	                                	<img src="${cp}/images/${board.video_img}" alt="" width="335" height="188"/>				<div class="btn_play"></div>
	                            	</div>
	                            	<div class="txtarea">
	                                	<div class="sbj">${board.video_title}</div>
	                                	<div class="date">${board.created_at}</div>
	                            	</div>
                        		</a>
                    		</li>
                		</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	</c:when>
                </c:choose>
                </ul>
            </div>
            <div class="vod_pop">
                <div class="vod_area">
                </div>
            </div>
            <div class="paging">
            	<c:if test="${page>1}">
	                <a href="${cp}/board/Videolist.mo?page=${page-1}" class="page_prev">
                    	<img src="${cp}/images/page_prev.gif" alt="">
                	</a>
				</c:if>
                
                <c:if test="${page>1}">
                	<a href="monami_video${page-1}">&lt;</a>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
                	<c:choose>
                		<c:when test="${i==page}">
                			<strong>${i}</strong>
                		</c:when>
                		<c:otherwise>
                			
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                
                
<!--                 <strong>1</strong> -->
<!--                 <a href="monami_video2.html">2</a> -->
<!--                 <a href="monami_video3.html">3</a> -->
<!--                 <a href="monami_video4.html">4</a> -->
<!--                 <a href="monami_video5.html">5</a> -->
                
                
                <c:if test="${page<totalPage}">
	                <a href="${cp}/board/Videolist.mo?page=${page+1}" class="page_next">
        	            <img src="${cp}/images/page_next.gif" alt="">
    	            </a>
				</c:if>
            </div>
            <div class="btn_top" style="cursor:pointer;" onclick="window.scrollTo(0,0);">
                <a>
                    <img src="${cp}/images/btn_top.gif" alt="페이지 상단으로">
                </a>
            </div>
        </div>
    </div>
    <!-- 본문 끝 -->
    <!-- 푸터 시작 -->
    <div id="footer">
        <div class="foot">
          <div class="foot_pop" style="display: none;">
            <div class="privacy" style="display: none;">
              <div class="title">개인정보 취급방침</div>
              <div class="textarea">
                <textarea readonly="readonly">'㈜모나미'는 (이하 '회사'는) 정보주체의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
        ＊ ㈜모나미의 개인정보 처리방침은 다음과 같은 내용을 담고 있습니다.
        
        1. 수집하는 개인정보 항목 및 수집방법 
        회사는 제품 문의, 제안사항, 불만사항 접수 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. 
        - 필수항목 : 이름, 이메일
        - 선택항목 : 연락처
        (단, 정보주체의 기본적 인권 침해의 우려가 있는 민감한 인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록,건강상태 및 성생활 등의 개인정보는 수집하지 않습니다.) 
        또한, 서비스 이용 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
        - 개인정보 추가 수집에 대해 별도 동의를 받는 경우 
        - 수집방법 : 홈페이지 ’문의하기(Contact Us)’ 서비스를 통한 수집
        
        2. 개인정보 수집 및 이용목적
        회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
        이용목적 : 질의자가 문의한 답변 전달, 본인의 의사표시 사항 처리, 불만사항 처리, 기타 원활한 의사소통 경로 확보 (이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.)
        
        3. 개인정보의 제공 및 공유
        회사는 정보주체들의 개인정보를 개인정보의 수집목적 및 이용목적에서 고지한 범위내에서 사용하며, 정보주체의 사전 동의 없이는 범위를 초과하여 이용하거나 원칙적으로 정보주체의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. 
        - 정보주체들이 사전에 동의한 경우
        - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
        
        4. 개인정보의 보유 및 이용기간
        정보주체 개인정보는 원칙적으로, 개인정보의 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, ‘회사’ 내부 방침 또는 정보주체로부터 개인정보 수집 시 동의 받은 개인정보 보유/이용기간, 관련법령의 규정 내에서 개인정보를 처리/보유합니다. 일정기간 동안 보존해야 하는 정보에 대해 아래와 같은 사유로 인하여 보존하고 있습니다.
        - 보존항목 : (필수) 이름, 이메일, 제목, 내용 / (선택) 연락처, 첨부파일 
        - 보유근거 : 정보주체 동의
        - 보유 및 이용기간 : 3년
        
        5. 개인정보의 파기절차 및 방법
        회사는 원칙적으로 개인정보수집 및 이용목적이 달성된 후에는 해당정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
        - 파기절차 
         : 정보주체가 서비스 신청, 문의상담 등을 위하여 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정기간 저장된 후 파기되어집니다.
         : 동 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. 
        - 파기방법 
         : 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
         : 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각합니다. 
        
        6. 정보주체 및 법정대리인의 권리와 그 행사방법
        정보주체는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 삭제를 요청할 수 있습니다.
        혹은 개인정보보호책임자에게 서면, 전화 또는 이메일로 정정을 요청하시면, 본인 확인 절차 후에 조치하겠습니다. 
        정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
        권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
        
        7. 개인정보 자동 수집장치의 설치,운영 및 그 거부에 관한 사항
        당사는 쿠키를 사용하지 않습니다. 
        
        8. 개인정보 보호책임자 및 담당부서 안내  
        회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 
        - 개인정보담당부서 
          : 부서명 : 마케팅팀
          : 전화번호 : 080-022-0153 / 031-216-0153 
          : 이메일 : help2@monami.com 
        - 개인정보보호책임자
          : 성명 : 신동호 팀장
          : 전화번호 : 080-022-0153
          : 이메일 : dhshin@monami.com 
        
        귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 정보주체들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. 
        개인분쟁조정위원회 (http://www.1336.or.kr)
        정보보호마크인증위원회 (http://www.eprivacy.or.kr)
        대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr)
        경찰청 사이버테러대응센터 (http://www.ctrc.go.kr) 
        
        9. 고지의 의무
        현 개인정보 처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 ‘공지사항’을 통해 고지할 것입니다. 
        개인정보취급방침 시행일자 : 2018년 08월 02일 
         </textarea>
              </div>
              <div class="btn_close"><a>CLOSE</a></div>
            </div>
            <div class="email" style="display: none;">
              <div class="title">이메일무단수집거부</div>
              <div class="textarea">
                본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반시정 보통신망법에 의해 형사 처벌됨을 유념하시기 바랍니다.
        <br><br>
        <div class="tit">시행일</div>
        
        본 이메일 무단 수집 거부 정책은 2017년 11월부터 시행합니다.
              </div>
              <div class="btn_close"><a>CLOSE</a></div>
            </div>
          </div>
          <div class="foot_top">
            <h1><img src="/images/foot_logo.jpeg" alt="로고"></img></h1>
            <ul class="fm">
              <li>
                <a href="/about/ceo.html">회사소개</a>
              </li>
              <li>
                <a class="privacy_pop">개인정보처리방식</a>
              </li>
              <li>
                <a class="email_pop">이메일무단수집거부</a>
              </li>
            </ul>
          </div>
          <div class="foot_btm">
            <div class="info">
              <div class="tit">INFO</div>
              <address>
                ADDRESS : 경기도 용인시 수지구 손곡로 17 <span>l</span> TEL :
                031-216-0153 <span>l</span>
                FAX : 031-270-5154
              </address>
              <p class="copy">
                COPYRIGHT(C) 2017 MONAMI.CO.,LTD. ALL RIGHTS RESERVED.
              </p>
            </div>
            <div class="cc">
              <div class="tit">CUSTOMER CENTER</div>
              <div class="cc_tel">080-022-0153</div>
            </div>
            <div class="fam_site">
              <a>FAMILY SITE</a>
              <ul>
                <li>
                  <a href="#" target="_blank">모나미몰</a>
                </li>
                <li>
                  <a href="#" target="_blank">모나르떼</a>
                </li>
                <li>
                  <a href="#" target="_blank">모나미 컨셉스토어</a>
                </li>
                <li>
                  <a href="#" target="_blank">주식회사 항소</a>
                </li>
                <li>
                  <a href="#" target="_blank">모나미 스테이션</a>
                </li>
                <li>
                  <a href="#" target="_blank">모나미 미술대회</a>
                </li>
                <li>
                  <a href="#" target="_blank">모나미 기업서비스</a>
                </li>
                <li>
                  <a href="#" target="_blank">모나미코스메틱</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <!-- 푸터 끝 -->
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>const cp = "${pageContext.request.contextPath}"</script>
<script src="${cp}/js/user.js"></script>
</html>