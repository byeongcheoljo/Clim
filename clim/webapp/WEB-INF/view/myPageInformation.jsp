<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>myPageInformationPage</title>
<c:import url="/WEB-INF/template/link.jsp"/>
<link rel="stylesheet" href="/css/myPageInformation.css">
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<main id="content">
	<ul id="headerNavMypage">
		<li id="nicknameHeaderMypage">닉네임</li>
		<li>홈</li>
		<li>찜</li>
		<li>커뮤니티</li>
		<li class="header_myPage_tabbed">정보수정</li>
		<li>FAQ</li>
		<li>결제</li>
	</ul>
	<div id="myPageInformationWrap">


		<form id="information" action="/user/info/${no}" method="post">
		<input type="hidden" name="no" value="${loginMember.no}">
			<h2>개인정보 수정</h2>
			<p>
				<strong>e-mail</strong> ${loginMember.email}
			</p>
			<p>
				<strong>닉네임</strong> ${loginMember.nickname}
			</p>
			<p>
				<strong>비밀번호</strong> <input id="newPwd" type="password"
					class="pwd check" name="pwd" placeholder="변경할 비밀번호를 입력해주세요." />
			</p>
			<div class="pwd msg"></div>
			<p>
				<strong>비밀번호 확인</strong> <input id="newPwdCheck" type="password"
					class="pwd" name="pwdCheck" placeholder="위와 동일한 비밀번호를 입력해주세요." />
			</p>
			<div class="pwd_check msg"></div>
		
		<button class="information_btn change" type="submit">변경</button>
		<button class="information_btn cancel" type="reset">취소</button>
		</form>

	</div>
	<script>
		$("#headerNavMypage li").click(function() {
			//4px solid #F9AC1A
			$("li").removeClass('header_myPage_tabbed');
			$(this).addClass('header_myPage_tabbed');
		});

		let $information = $("#information");

		let $newPwd = $("#newPwd");
		let $newPwdCheck = $("#newPwdCheck");

		const $newPwdMsg = $(".pwd");
		const $newPwdCheckMsg = $(".pwd_check");

		const pwdExp = /^[\w]{8,}$/;

		$information.submit(function() {
			
// 			if (!testPwCheck()) {
// 				console.log(!testPwCheck())
// 				console.log("zz2");
				
// 			}
			
// 		 	if (!testPw()) {
// 		 		//console.log(!testPw())
// 		 		console.log("zz1");
// 				return false;
// 			}
		 	testPwCheck();
		 	testPw();
			console.log("abc");
			
			
		});

		function testPw() {
			let pw1 = $newPwd.val().trim();
			if (pw1 == ''  | pw1 == ' ') {
				$newPwdMsg.removeClass("ok")
						.text("비밀번호에 공백 또는 빈칸은 들어갈 수 없습니다.");
				return false;
			}
			if (!pwdExp.test(pw1)) {
				$newPwdMsg.removeClass("ok").text("비밀번호를 다시 설정해주세요.");
				return false;
			} else {
				$newPwdMsg.addClass("ok").text("좋은 비밀번호네요!");
			}
		}

		function testPwCheck() {
			let pw1 = $newPwd.val().trim();
			let pw2 = $newPwdCheck.val().trim();
			if (!pwdExp.test(pw2)) {
				$newPwdCheckMsg.removeClass("ok").text("비밀번호를 다시 설정해주세요.");
				return false;
			}
			if (pw1 != pw2) {
				$newPwdCheckMsg.removeClass("ok").text("비밀번호가 일치하지않습니다.");
				return false;
			} else {
				$newPwdCheckMsg.addClass("ok").text("비밀번호가 일치합니다");
			}
		}

		$newPwd.keyup(testPw);
		$newPwdCheck.keyup(testPwCheck);
		
	
		
	</script>
</body>
</html>