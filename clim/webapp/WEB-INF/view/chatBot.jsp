<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>chatBot</title>
<c:import url="/WEB-INF/template/link.jsp"/>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/chatBot.css">
</head>
<body>
	<div id="chattingSection" class="close">
		<h1>
			<img src="/img/clim%20logo.png">
		</h1>
		<div id="guideBox">Clim 채팅 봇 "클리미"입니다. 궁금하신 사항을 알려 드립니다.</div>
		<!-- #loginBox -->
		<div id="chatList">
			<h3 class="screen_out">채팅목록</h3>
			<button class="btn" id="closeBtn">
				<i class="far fa-times-circle"></i> 접속종료
			</button>
			<div id="chatListWrap">
				<ul>
					<li>
						<div class="card_user">
							<strong>클리미</strong>
						</div>
						<div class="box_chat">
							<div class="comments">안녕하십니까?<br>고객님의 궁금증을 시워~~언 하게 풀어드릴 "클리미"입니다~!<br>무엇을도와드릴까요?</div>
						</div> <!--//box_reply-->
					</li>
				</ul>
			</div>
			<!--//#chatListWrap -->
		</div>
		<!--//#chatList -->
		<div id="inputChatBox">
			<form id="msgForm" action=" " method="post">
				<fieldset>
					<legend class="screen_out">메세지 입력폼</legend>
					<label for="msg" class="screen_out">메세지 입력</label> <input
						name="message" autocomplete="off" id="msg" type="text"
						placeholder="메세지를 입력해주세요" />
					<button id="inputBtn" class="btn" type="submit">입력</button>
				</fieldset>
			</form>
		</div>
		<!--//#inputChatBox -->
	</div>
	<!-- chat 입력 Tmp-->
	<script type="text/template" id="chatTmp">
    <li class="mine">
        <div class="card_user">
            <strong>승현</strong>
        </div>
        <div class="box_chat">
            <div class="comments"><@=msg@></div>
        </div><!--//box_reply-->
    </li>
    <li>
        <div class="card_user">
            <strong>클리미</strong>
        </div>
        <div class="box_chat">
            <div class="comments">안녕하십니까?<br>고객님의 궁금증을 시워~~언 하게 풀어드릴 "클리미"입니다~!<br>무엇을 도와드릴까요?</div>
        </div><!--//box_reply-->
    </li>
</script>
	<!-- chat 입력 Tmp-->
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		const $chatList = $("#chatList ul");
		const $chatListWrap = $("#chatListWrap");

		let chartTmp = _.template($("#chatTmp").html());

		$("form").on("submit", function() {
			let msg = $("#msg").val().trim();
			console.log(msg);
			$("#chatListWrap ul").append(chartTmp({
				"msg" : msg
			}));
			$("#msg").val("").focus();
			moveScroll();
			return false;
		});

		function moveScroll() {
			let height = $chatList.height();

			//height 증가된만큼 scroll 이동
			$chatListWrap.scrollTop(height);

		}
	</script>
</body>
</html>