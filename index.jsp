<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <c:set var="cp" value="${pageContext.request.contextPath}"/>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>MONAMI</title>
    <link rel="shortcut icon" href="${cp}/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${cp}/css/style.css" />
    <script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script type="text/javascript" src="${cp}/js/common.js"></script>
    <link href="${cp}/css/jquery.dragscroll.css" rel="stylesheet">
    <script src="${cp}/js/dragScroll.js"></script>
    <script src="${cp}/dragScroll.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${cp}/js/user.js"></script>
	<script type="text/javascript">
        $(document).ready(function(){
            $(window).scroll(function() {
                var position = $(window).scrollTop();
                if(position > 2400 && position < 3400){
                    player.play();
                }else{
                    player.pause();
                }
            });
        });
        </script>
    <script type="text/javascript">
              $(function () {
                $(document).on("click", ".find_f", function () {
                  dh = $(document).height();
                  poph = $(".find_layer").height();

                  $("#bgblack").height(dh).show();
                  $(".findlayer")
                    .show()
                    .animate({ top: $(document).scrollTop() + 50 + "px" }, 100);
                });
                $("#bgblack,.btnx").click(function () {
                  $("#bgblack").height(dh).hide();
                  $(".find_layer").hide();
                });
              });
    </script>
	<style>
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
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
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
								<li>
									<a href="#">ENG</a>
								</li>
							</ul>
						</div>
						<div class="sns">
							<ul>
								<li>
									<a href="https://www.facebook.com/monami1960" target="_blank">
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
					<a href="${cp}/jungmin/usermodify.jsp">MYPAGE</a>&nbsp;
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
								<a href="index.jsp">HOME</a>
							</li>
							<li>
								<a href="${cp}/kyungchul/sitemap.jsp">SITE MAP</a>
							</li>
							<li>
								<a href="${cp}/doyoon/Inquiry.jsp">CONTACT US</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="gnb">
				<div class="conwrap">
					<h1>
						<a href="${cp}/index.jsp">
							<img src="${cp}/images/logo.jpeg" alt="${cp}/images/logo.jpeg"></a>
					</h1>
					<div class="nav">
						<ul>
							<li>
								<a href="${cp}/kyungchul/ceo.jsp">모나미소개</a>
								<ul>
									<li>
										<a href="${cp}/kyungchul/ceo.jsp">CEO 메시지</a>
									</li>
									<li>
										<a href="${cp}/kyungchul/ceo.jsp">회사정보</a>
									</li>
									<li>
										<a href="${cp}/kyungchul/history.jsp">회사연혁</a>
									</li>
									<li>
										<a href="${cp}/geunseok/investment.jsp">투자정보</a>
									</li>
									<li>
										<a href="${cp}/geunseok/ci.jsp">CI</a>
									</li>
									<li>
										<a href="http://recruit.monami.co.kr/" target="_blank">채용정보</a>
									</li>
									<li>
										<a href="${cp}/geunseok/location.jsp">찾아오시는 길</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="${cp}/jungmin/pen/penpage.jsp">모나미제품</a>
								<ul>
									<li>
										<a href="${cp}/jungmin/pen/penpage.jsp">펜</a>
									</li>
									<li>
										<a href="${cp}/jungmin/marker/markerpage.jsp">마카</a>
									</li>
									<li>
										<a href="${cp}/sanghoon/lightpen.jsp">형광펜</a>
									</li>
									<li>
										<a href="${cp}/doyoon/A_main1.jsp">미술용품</a>
									</li>
									<li>
										<a href="${cp}/doyoon/E_main1.jsp">기타</a>
									</li>
									<li>
										<a href="${cp}/jungmin/cataloguepage.jsp">카탈로그</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="${cp}/news/NewsBoardList.bo">NEWS &amp; VIDEO</a>
								<ul>
									<li>
										<a href="${cp}/news/NewsBoardList.bo">보도자료</a>
									</li>
									<li>
										<a href="${cp}/board/Videolist.bo">동영상자료</a>
									</li>
									<c:if test="${loginUser.user_id=='tjtkdgns9369'}">
									<li>
										<a href="/jungmin/news_manegement.jsp">등록</a>
									</li>
									</c:if>
								</ul>
							</li>
							<li>
								<a href="https://www.monamimall.com/w/artcontest/info/artContestInfo.do?trackingCd=monami" target="_blank">모나미 미술대회</a>
								<ul>
									<li>
										<a href="https://www.monamimall.com/w/artcontest/info/artContestInfo.do?trackingCd=monami" target="_blank">미술대회 소개</a>
									</li>
									<li>
										<a href="https://www.monamimall.com/w/artcontest/award/award.do?trackingCd=monami"
                          target="_blank">수상작 발표</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="${cp}/doyoon/FAQ.jsp">고객지원</a>
								<ul>
									<li>
										<a href="${cp}/doyoon/FAQ.jsp">자주묻는질문</a>
									</li>
									<li>
										<a href="${cp}/doyoon/Inquiry.jsp">문의하기</a>
									</li>
									<c:if test="${loginUser.user_id=='tjtkdgns9369'}">
									<li>
										<a href="${cp}/inquiry/InquiryList.mo">문의사항</a>
									</li>
									</c:if>
									<li>
										<a href="${cp}/event/EventList.bo">이벤트</a>
									</li>
									<li>
										<a href="find_f">모나미 패밀리샵 찾기</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="http://mpms.monami.com" target="_blank">기업 구매 / 개발</a>
								<ul class="hovermenu">
									<li><a href="http://mpms.monami.com" target="_blank">기업 및 단체 구매</a></li>
									<li><a href="${cp}/geunseok/industry.jsp">산업용 맞춤 제품개발</a></li>
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
							<a href="${cp}/product/ProductList.pd?keyword">
								<img src="${cp}/images/btn_search.gif" alt="" />
							</a>
						</div>
					</div>
					<div class="allmenu" style="display: none;">
						<div class="menubox">
							<h2>모나미소개</h2>
							<ul>
								<li><a href="${cp}/kyungchul/ceo.jsp">CEO 메시지</a></li>
								<li><a href="${cp}/kyungchul/company.jsp">회사정보</a></li>
								<li><a href="${cp}/kyungchul/history.jsp">회사연혁</a></li>
								<li><a href="${cp}/geunseok/investment.jsp">투자정보</a></li>
								<li><a href="${cp}/geunseok/ci.jsp">CI</a></li>
								<li><a href="http://recruit.monami.co.kr/" target="_blank">채용정보</a></li>
								<li><a href="${cp}/geunseok/location.jsp">찾아오시는 길</a></li>
							</ul>
						</div>
						<div class="menubox">
							<h2>모나미제품</h2>
							<ul>
								<li><a href="${cp}/jungmin/pen/penpage.jsp">펜</a></li>
                   				<li><a href="${cp}/jungmin/marker/markerpage.jsp">마카</a></li>
                    			<li><a href="${cp}/sanghoon/lightpen.jsp">형광펜</a></li>
                    			<li><a href="${cp}/doyoon/A_main1.jsp">미술용품</a></li>
                    			<li><a href="${cp}/doyoon/E_main1.jsp">기타</a></li>
                    			<li><a href="${cp}/jungmin/cataloguepage.jsp">카탈로그</a></li>
							</ul>
						</div>
						<div class="menubox">
							<h2>NEWS &amp; VIDEO</h2>
								<ul>
									<li><a href="${cp}/news/NewsBoardList.bo">보도자료</a></li>
                                    <li><a href="${cp}/board/Videolist.bo">동영상자료</a></li>
                               		<c:if test="${loginUser.user_id == 'tjtkdgns9369'}">
	                                    <li><a href="${cp}/jungmin/news_manegement.jsp">등록</a></li>
                                	</c:if>
								</ul>
						</div>
						<div class="menubox">
							<h2>모나미 미술대회</h2>
							<ul>
								<li><a href="https://www.monamimall.com/w/artcontest/info/artContestInfo.do?trackingCd=monami" target="_blank">미술대회 소개</a></li>
								<li><a href="https://www.monamimall.com/w/artcontest/award/award.do?trackingCd=monami" target="_blank">수상작 발표</a></li>
							</ul>
						</div>
						<div class="menubox">
							<h2>고객지원</h2>
							<ul>
								<li><a href="${cp}/doyoon/FAQ.jsp">자주묻는질문</a></li>
								<li><a href="${cp}/doyoon/Inquiry.jsp">문의하기</a></li>
								<c:if test="${loginUser.user_id=='tjtkdgns9369'}">
									<li>
										<a href="${cp}/inquiry/InquiryList.mo">문의사항</a>
									</li>
								</c:if>
								<li><a href="${cp}/event/EventList.bo">이벤트</a></li>
								<li><a class="find_f">모나미 패밀리샵 찾기</a></li>
							</ul>
						</div>
						<div class="menubox">
							<h2><a href="http://mpms.monami.com/promotion/" target="_blank">기업 구매 / 개발</a></h2>
							</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    <!-- 헤더 끝 -->
    <!-- 바디 상단 이미지 시작-->
    <div id="visual">
		<div class="textarea">
			<h3>
				어쩌면 삶은<br>
				인생이라는 종이 위에<br>
				써 내려가는<br>
				펜의 기록 같습니다.<br>
			</h3>
			<p>
				그중에서도 지우고 싶지 않은 기록이 있습니다.<br>
				모나미는 언제나 당신의 행복한 기록과 함께 합니다.
			</p>
		</div>
	</div>
    <!-- 바디 상단 이미지 끝  -->
	
    <!-- 본문 시작  -->
    <div id="container">
		<div id="contents">
			<div class="new">
				<div class="conwrap">
					<div class="tit">
						<h2>NEW<br>ARRIVALS</h2>
						<p>가장 먼저 만나는 설레는 기다림</p>
					</div>
					<div class="toparea">
						<div class="box new1">
							<a href="#">
								<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/main/file1_16401333121j15oonmzn.jpg" alt="" width="392" height="205">
								<div class="ondiv">
									<div class="align">
										<div class="cate">BALLPOINT PEN</div>
										<div class="name">FX ZETA C3</div>
										<div class="plus">
										<div></div><div></div></div>
									</div>
								</div>
							</a>
						</div>
						<div class="box new2">
							<a href="#">
								<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/main/file1_1636692836t0wc4zcp10.jpg" alt="" width="786" height="360">
								<div class="ondiv">
									<div class="align">
										<div class="cate">NOTE</div>
										<div class="name">지퀀스</div>
										<div class="plus">
										<div></div><div></div></div>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="btmarea">
						<div class="box new3">
							<a href="#">
								<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/main/file1_1636692267mqgt626cbz.jpg" alt="" width="392" height="292">
								<div class="ondiv">
									<div class="align">
										<div class="cate">HIGHLIGHTER</div>
										<div class="name">에센티 트윈</div>
										<div class="plus">
										<div></div><div></div></div>
									</div>
								</div>
							</a>
						</div>
						<div class="box new4">
							<a href="#">
								<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/main/file1_16366855229ga65wy5mb.jpg" alt="" width="450" height="439">
								<div class="ondiv">
									<div class="align">
										<div class="cate">BALLPOINT PEN</div>
										<div class="name">제니스</div>
										<div class="plus">
										<div></div><div></div></div>
									</div>
								</div>
							</a>
						</div>
						<div class="box new5">
							<a href="#">
								<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/main/file1_1629263969hla59mlwz0.jpg" alt="" width="314" height="292">
								<div class="ondiv">
									<div class="align">
										<div class="cate">SHARP</div>
										<div class="name">클리키</div>
										<div class="plus">
										<div></div><div></div></div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>	
			<div class="product" id="our_product">	
				<div class="tit">
					BEST PRODUCT
				</div>
				<p class="tit_btm">언제 어디서나 생활 속에 함께하는 모나미</p>
				<div class="p_tabs">
					<ul>
						<li class="on"><a href="${cp}/jungmin/pen/penpage.jsp">펜</a></li>
						<li><a href="index002.jsp">마카</a></li>
						<li><a href="index003.jsp">형광펜</a></li>
						<li><a href="index004.jsp">미술용품</a></li>
					</ul>
				</div>
				<div class="p_lists">
					<ul class="wrapper_ul" style="width: 5680px;">
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/1_file6_1642574225zxvl14frbt.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">153 어흥이</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2010152034_file6_1639639980jngius8r6i.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">FX ZETA C3</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2010030001_file6_1635127393stijdjvr99.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">제니스7</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2040048012_file6_1583298386d4wy0fw22t.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">만년필</div>
									<div class="name">153 네오 만년필 EF</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2011000001_file6_15820789024x1nayhgws.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">플립3</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2011000012_file6_1620349565gom4im08o3.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">FLIP3 형광</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2010207014_file6_1597798381k1ar11akrd.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">프리미엄펜</div>
									<div class="name">153 네오 아트</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2016010001_file6_1594946058soa8elphio.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">프리미엄펜</div>
									<div class="name">153 네온</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2016009001_file6_15858719673zblr2z1hq.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">153 아로마</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/ 2040012000_file6_1581983504aiqk5l95cs.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">프리미엄펜</div>
									<div class="name">60주년 프러스펜 3000 데스크펜 스페셜 에디션</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2010011003_file6_1603239769a8bxyplq27.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">153 클립</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2012000001_file6_158208613198boosjtl0.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">FX multi 700</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2010000003_file6_15759536886i29q2a2ud.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">프리미엄펜</div>
									<div class="name">153 스마트펜</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2110000001_file6_15740631264g0err5skc.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">만년필</div>
									<div class="name">라인 만년필</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/8801067279536_file6_1552954140c5bul606gc.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">FX 153</div>
									<div class="name">FX 153</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2011071003_file6_1556070896zlny1by73y.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">프리미엄펜</div>
									<div class="name">153 네이처</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2010129001_file6_1584059663fxku9xz5t3.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">FX ZETA</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2013129005_file6_1543815651bwz2foqzla.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">유성볼펜</div>
									<div class="name">153 야미 </div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/	2015321003_file6_153800521194eznh2ta7.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">프리미엄펜</div>
									<div class="name">153 블라썸</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="thum">
									<img src="https://dfrkkcv2hg1jc.cloudfront.net/data/product/2040048001_file6_1519117090gwwh3ty7fi.jpg" alt="" width="266" height="390">
								</div>
								<div class="info">
									<div class="cate">만년필</div>
									<div class="name">153 네오 만년필 F</div>
								</div>
							</a>
						</li>					
					</ul>
				</div>
				<div class="p_info">
					<div class="wrap">
						<span class="arr1"><img src="${cp}/images/p_arr1.gif" alt=""></span>
						<span class="arr2"><img src="${cp}/images/p_arr2.gif" alt=""></span>
						<div class="ds">
							<div><img src="${cp}/images/p_cursor.gif" alt=""></div>
							DRAG &amp; SCROLL
						</div>
					</div>
				</div>
			</div>
	<script>
		var $container = $(".product");
		var $scroller = $(".p_lists");
		var $wrapper = $(".wrapper_ul");
	
		$(window).load(function(){
	
			li = $(".p_lists ul li");
			lilen = li.length;
			liw = lilen*(li.width()+18);
			$(".p_lists ul").width(liw);
	
		});
	
		for (var i = 0; i < 0; i++) {
			$wrapper.append('<li>'+ i +'</li>')
		}
		bindDragScroll($container, $scroller);
	
	</script>
	
	<script type="text/javascript">
	$(function(){
	
		idxNum = 0;
		$(".btn_play a").click(function(){
			var idx = $(this).data("idx");
			dh = $(document).height();
			$("#bgblack").height(dh).show();
			$(".vod_pop").show().animate({top:$(document).scrollTop()+100+"px"},100);
			$(".vod_area").html("<iframe src='video.php?idx="+idx+"' frameborder='0' scrolling='no' width='100%' height='620'></iframe>");
	
		})
		$("#bgblack").click(function(){
	
			$("#bgblack").hide();
			$(".vod_pop").hide();
			$(".vod_area").html("");
	
		})
	})
	</script>
		<div class="video">
			<video loop="" class="bgvid" id="player">
				<source src="${cp}/images/monami_brand_web_60.mp4" type="video/mp4">
					<source src="http://dfrkkcv2hg1jc.cloudfront.net/data/video/monami_brand_web_60.ogv" type="video/ogv">
			</video>
		</div>
		<div class="vod_pop">
			<div class="vod_area"></div>
		</div>	
		<div class="bbs">
			<div class="conwrap">
				<div class="news">
					<div class="tit">
						<h2>MONAMI NEWS</h2>
						<a href="${cp}/news/NewsBoardList.bo">MORE</a>
					</div>
					<ul class="news_lists">
						<li class="first">
							<div class="thum">
								<a href="${cp}/news/NewsBoardList.bo"><img src="https://dfrkkcv2hg1jc.cloudfront.net/data/board/bodo/b_file_1642552727243drophj1.jpg" width="164" height="116"></a>
							</div>
							<div class="txt">
								<a href="#">
									<div class="sbj">모나미, 호랑이의 해 임인년(壬寅年)맞아 ‘15..</div>
									<p>
										모나미, 호랑이의 해 임인년(壬寅年)맞아 ‘153 어흥이’ 에디션 출시- 다양한 패턴의 호랑이를 은증착 효과와 비..
									</p>
									<span class="date">2022-01-19</span>
								</a>
							</div>
						</li>
						<li>
							<a href="#">- 모나미, 한국적인 아름다움 담은 라이브칼라 60색 에디션 2종 출시 </a>
							<span class="date">2022-01-14</span>
						</li>
						<li>
							<a href="#">- 모나미, ‘공부왕찐천재 홍진경’과 협업한 문구세트 출시</a>
							<span class="date">2022-01-10</span>
						</li>
						<li>
							<a href="#">- 모나미, 공부 필수템 3색 볼펜 ‘FX ZETA C3’ 출시</a>
							<span class="date">2021-12-22</span>
						</li>
					</ul>
				</div>
				<div class="inquiry">
					<div class="tit">
						<h2>INQUIRY</h2>
					</div>
					<p>언제나 소중한 의견에 귀 기울이겠습니다.<br>궁금한 사항은 문의하세요.</p>
					<a href="#">INQUIRY NOW</a>
				</div>
				<div class="shop">
					<div class="tit">
						<h2>FAMILY SHOP</h2>
					</div>
					<p>패밀리샵은 모나미와 함께 협력하는 문구<br>소매 매장입니다. 주변 패밀리샵을 찾아보세요.</p>
					<a class="#">FIND SHOP</a>
				</div>
			</div>
		</div>
		<div class="fam_links">
			<ul>
				<li><a href="#" target="_blank"><img src="${cp}/images/fam_img1.jpeg" alt="모나미 몰"></a></li>
				<li><a href="#" target="_blank"><img src="${cp}/images/fam_img6.jpg" alt="모나르떼"></a></li>
				<li><a href="#" target="_blank"><img src="${cp}/images/fam_img5.jpg" alt="모나미 스테이션"></a></li>
				<li><a href="#" target="_blank"><img src="${cp}/images/fam_img2.jpg" alt="모나미 미술대회"></a></li>
			</ul>
		</div>
	</div>
    <!-- 본문 끝 -->
    <!-- 푸터 시작 -->
    <div id="footer">
		<div class="foot">
			<div class="foot_top">
				<h1><img src="${cp}/images/foot_logo.jpeg" alt="로고"></img></h1>
				<ul class="fm">
					<li>
						<a href="#">회사소개</a>
					</li>
					<li>
						<a href="#">개인정보처리방식</a>
					</li>
					<li>
						<a href="#">이메일무단수집거부</a>
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
</html>