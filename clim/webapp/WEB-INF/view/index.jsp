<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Clim | Main</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/preview.css">
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<main id="main">
	<div id="heroContentSection" class="index_section">
		<ul>
			<li class="hero_content_card" data-pageno="1"><img
				src="/img/hero1.JPG" /></li>
			<li class="hero_content_card" data-pageno="2"><img
				src="/img/hero2.JPG" /></li>
			<li class="hero_content_card" data-pageno="3"><img
				src="/img/hero1.JPG" /></li>
			<li class="hero_content_card" data-pageno="4"><img
				src="/img/hero2.JPG" /></li>
		</ul>
		<div id="heroContentPaging">
			<div class="hero_content_num hero_on" data-page="1"></div>
			<div class="hero_content_num" data-page="2"></div>
			<div class="hero_content_num" data-page="3"></div>
			<div class="hero_content_num" data-page="4"></div>
		</div>
		<!-- //heroContentPaging -->
	</div>
	<!-- //heroContentSection -->
	<div id="hotSection" class="index_section">
		<span>HOT 클리머</span>
		<ul id="streamBox">
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
			<li class="hot_streaming_card"><img class="streaming_thumbnail"
				src="/img/bumbleb.jpg" />
				<div class="streaming_info">
					<div class="streaming_tit">[SF]범블비 함께 봐요!</div>
					<div class="streaming_user">woodykim</div>
					<div class="streaming_cnt">
						<i class="fas fa-user-friends"></i> 100
					</div>
				</div>
				<div class="streaming_icon">LIVE</div></li>
		</ul>
		<!-- //streamBox end -->
		<div class="move_btn stream_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn stream_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- //hotSection end --> <c:if test="${loginMember!=null }">
		<!-- 구독중인 끌리머의 스트리밍 -->
		<div id="userStreamSection" class="index_section">
			<span>${loginMember.nickname}님의 클리머</span>
			<ul id="userStreamBox">
			</ul>
			<!-- //userStreamBox end -->
			<div class="move_btn userstream_move_prev">
				<i class="fas fa-angle-left"></i>
			</div>
			<div class="move_btn userstream_move_next">
				<i class="fas fa-angle-right"></i>
			</div>
		</div>
		<!-- //userStreamSection(구독중인 끌리머 방송 구역 끝) end -->


		<!-- 이어보기 구역 -->
		<!-- //userStreamSection end -->
		<div id="continueSection" class="index_section">
			<span>이어보기</span>
			<ul id="continueBox">
			</ul>
			<!-- //continueBox end -->
			<div class="move_btn continue_move_prev">
				<i class="fas fa-angle-left"></i>
			</div>
			<div class="move_btn continue_move_next">
				<i class="fas fa-angle-right"></i>
			</div>
		</div>
		<!-- //continueSection(이어보기 구역 끝) -->
	</c:if> <!-- //continueSection end --> <!--  
	<div id="heroImg">
		<img src="/img/hero3.jpg" />
	</div>-->
	<div id="climContentSection" class="index_section">
		<span>끌림작</span>
		<ul id="climBox">
			<!-- //끌림작 1~6위 -->
			<li>
				<ul>
					<c:forEach items="${climedList}" var="climed" begin="0" end="5">
						<li class="clim_card" data-movieNo="${climed.no }"><img
							src="/stealCut${climed.recSteal }" />
							<div class="recommend_special_name">${climed.title}(<fmt:formatDate
									value="${climed.opendate}" pattern="YYYY" />
								)
							</div>
							<div class="top_border border_box"></div>
							<div class="right_border border_box"></div>
							<div class="bottom_border border_box"></div>
							<div class="left_border border_box"></div></li>
					</c:forEach>

				</ul>
			</li>
			<!-- //끌림작 1~6위 끝 -->
			<!-- //끌림작 7위~12위 -->
			<li>
				<ul>
					<c:forEach items="${climedList }" var="climed" begin="6" end="11">
						<li class="clim_card" data-movieNo="${climed.no }"><img
							src="/stealCut${climed.recSteal }" />
							<div class="recommend_special_name">${climed.title}(<fmt:formatDate
									value="${climed.opendate}" pattern="YYYY" />
								)
							</div>
							<div class="top_border border_box"></div>
							<div class="right_border border_box"></div>
							<div class="bottom_border border_box"></div>
							<div class="left_border border_box"></div></li>
					</c:forEach>

				</ul>
			</li>
			<!-- //끌림작 7~12위 끝 -->
			<!-- //끌림작 13위~18위 -->
			<li>
				<ul>
					<c:forEach items="${climedList }" var="climed" begin="12" end="17">
						<li class="clim_card" data-movieNo="${climed.no }"><img
							src="/stealCut${climed.recSteal }" />
							<div class="recommend_special_name">${climed.title}(<fmt:formatDate
									value="${climed.opendate}" pattern="YYYY" />
								)
							</div>
							<div class="top_border border_box"></div>
							<div class="right_border border_box"></div>
							<div class="bottom_border border_box"></div>
							<div class="left_border border_box"></div></li>
					</c:forEach>
				</ul>
			</li>
			<!-- //끌림작 13~18위 끝 -->
			<!-- //끌림작 19위~24위 -->
			<li>
				<ul>
					<c:forEach items="${climedList }" var="climed" begin="18" end="23">
						<li class="clim_card" data-movieNo="${climed.no }"><img
							src="/stealCut${climed.recSteal }" />
							<div class="recommend_special_name">${climed.title}(<fmt:formatDate
									value="${climed.opendate}" pattern="YYYY" />
								)
							</div>
							<div class="top_border border_box"></div>
							<div class="right_border border_box"></div>
							<div class="bottom_border border_box"></div>
							<div class="left_border border_box"></div></li>
					</c:forEach>
				</ul>
			</li>
			<!-- //끌림작 18~24위 끝 -->
			<!-- //끌림작 25위~30위 -->
			<li>
				<ul>
					<c:forEach items="${climedList }" var="climed" begin="24" end="29">
						<li class="clim_card" data-movieNo="${climed.no }"><img
							src="/stealCut${climed.recSteal }" />
							<div class="recommend_special_name">${climed.title}(<fmt:formatDate
									value="${climed.opendate}" pattern="YYYY" />
								)
							</div>
							<div class="top_border border_box"></div>
							<div class="right_border border_box"></div>
							<div class="bottom_border border_box"></div>
							<div class="left_border border_box"></div></li>
					</c:forEach>
				</ul>
			</li>
			<!-- //끌림작 25~30위 끝 -->
		</ul>
		<!-- //climBox end -->
		<div class="move_btn clim_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn clim_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- //climContentSection end --> <!-- 중간 히어로이미지 구역 -->
	<div id="heroImg">
		<img src="/img/hero3.jpg" />
	</div>
	<!-- //중간 히어로이미지 구역 끝 --> <!-- 추천작1 -->
	<div class="recommend_section index_section">
		<span>추천작1</span>
		<ul class="recommend_box">
			<c:forEach items="${recOne}" var="one">
				<li class="recommend_card" data-movieNo="${one.no }"><img
					src="/poster${one.poster }" />
					<div class="top_border border_box"></div>
					<div class="right_border border_box"></div>
					<div class="bottom_border border_box"></div>
					<div class="left_border border_box"></div></li>
			</c:forEach>
		</ul>
		<!-- //recommend_box -->
		<div class="move_btn recommend_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn recommend_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- //recommend_section end --> <!-- 추천작1 끝 --> <!-- 추천작 2 -->
	<div class="recommend_section index_section">
		<span>추천작2</span>
		<ul class="recommend_box">
			<c:forEach items="${recTwo}" var="two">

				<li class="recommend_card" data-movieNo="${two.no }"><img
					src="/poster${two.poster }" />
					<div class="top_border border_box"></div>
					<div class="right_border border_box"></div>
					<div class="bottom_border border_box"></div>
					<div class="left_border border_box"></div></li>
			</c:forEach>
		</ul>
		<div class="move_btn recommend_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn recommend_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- 추천작 2 끝 --> <!-- 추천착3 -->
	<div class="recommend_section index_section">
		<span>추천작3</span>
		<ul class="recommend_box">
			<c:forEach items="${recThree}" var="three">

				<li class="recommend_card" data-movieNo="${three.no }"><img
					src="/poster${three.poster }" />
					<div class="top_border border_box"></div>
					<div class="right_border border_box"></div>
					<div class="bottom_border border_box"></div>
					<div class="left_border border_box"></div></li>

			</c:forEach>
		</ul>
		<div class="move_btn recommend_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn recommend_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!--추천작3 끝--> <!-- 추천작4 구역 -->
	<div class="recommend_special_section index_section">
		<span>추천작4</span>
		<ul class="recommend_special_box">
			<li class="recommend_special_card recommend_card_rank1"><img
				src="/stealCut/lioonking.jpg" />
				<div class="recommend_special_name">Lionking(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
			<li class="recommend_special_card recommend_card_rank2"><img
				src="/stealCut/alaaladin.jpg" />
				<div class="recommend_special_name">Aladin(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
			<li class="recommend_special_card recommend_card_rank3"><img
				src="/stealCut/realSteel.jpg" />
				<div class="recommend_special_name">RealSteel(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
			<li class="recommend_special_card recommend_card_rank4"><img
				src="/stealCut/spidermanReal.jpg" />
				<div class="recommend_special_name">Spiderman(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
			<li class="recommend_special_card recommend_card_rank5"><img
				src="/stealCut/toystory.jpg" />
				<div class="recommend_special_name">Toystory(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
			<li class="recommend_special_card recommend_card_rank6"><img
				src="/stealCut/reallion.jpg" />
				<div class="recommend_special_name">Lionking(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
			<li class="recommend_special_card recommend_card_rank7"><img
				src="/stealCut/aenabelll.jpg" />
				<div class="recommend_special_name">Aenabel(2019)</div>
				<div class="top_border border_box"></div>
				<div class="right_border border_box"></div>
				<div class="bottom_border border_box"></div>
				<div class="left_border border_box"></div></li>
		</ul>
	</div>
	<!-- //추천작4 구역 끝 --> <!-- 장르 1 -->
	<div class="recommend_section index_section">
		<span>장르1</span>
		<ul class="recommend_box">
			<c:forEach items="${recOne}" var="one">

				<li class="recommend_card" data-movieNo="${one.no }"><img
					src="/poster${one.poster }" />
					<div class="top_border border_box"></div>
					<div class="right_border border_box"></div>
					<div class="bottom_border border_box"></div>
					<div class="left_border border_box"></div></li>
			</c:forEach>
		</ul>
		<!-- //recommend_box -->
		<div class="move_btn recommend_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn recommend_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- //recommend_section end --> <!-- 장르 1 끝 --> <!-- 장르 2 -->
	<div class="recommend_section index_section">
		<span>장르2</span>
		<ul class="recommend_box">
			<c:forEach items="${recTwo}" var="two">

				<li class="recommend_card" data-movieNo="${two.no }"><img
					src="/poster${two.poster }" />
					<div class="top_border border_box"></div>
					<div class="right_border border_box"></div>
					<div class="bottom_border border_box"></div>
					<div class="left_border border_box"></div></li>
			</c:forEach>
		</ul>
		<div class="move_btn recommend_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn recommend_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- 장르 2 끝--> <!-- 장르 3 -->
	<div class="recommend_section index_section">
		<span>장르3</span>
		<ul class="recommend_box">
			<c:forEach items="${recThree}" var="three">

				<li class="recommend_card" data-movieNo="${three.no }"><img
					src="/poster${three.poster }" />
					<div class="top_border border_box"></div>
					<div class="right_border border_box"></div>
					<div class="bottom_border border_box"></div>
					<div class="left_border border_box"></div></li>
			</c:forEach>
		</ul>
		<div class="move_btn recommend_move_prev">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="move_btn recommend_move_next">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>
	<!-- 장르 3 --> </main>
	<div class="trailer_bg">
		<div class="bg_close_btn">
			<i class="far fa-times-circle"></i>
		</div>
		<div id="previewSection"></div>
	</div>
	<c:import url="/WEB-INF/template/footer.jsp" />
	<script src="/js/moment-with-locales.js"></script>
	<script type="text/template" id="trailerTmp">
		<div id="movieInformationWrap">
				<div id="movieTitle">
					<strong><@=movie.title@>(<@=moment(movie.opendate).format('YYYY')@>)</strong>
				</div>
				<ul id="movieInformationBox">
				<@if(${loginMember!=null}){@>
				<button data-no =<@=movie.no@> class="preview_btn book_mark <@if(movie.bookmarkCheck){@>on<@}@>" >BookMark</button>
				<@}@>	
					<li>평균 평점 <span><i class="fas fa-star"></i> <@=movie.score@></span> <span
						id="age">${movie.movieRating }</span></li>
					<li>상영시간 <span><@=movie.runtime@>분</span></li>
					<li>감독
						<div id="director">
						<@_.each(directors,function(director){@>
						<span><a href="/search/director/<@=director.no@>"> <@=director.name@></a></span>
						<@});@>
						</div>
					</li>
					<li>배우
						<div id="actor">
						<@_.each(actors,function(actor){@>
							<span><a href="/search/actor/<@=actor.no@>"><@=actor.name@></a></span>
						<@});@>
						</div>
					</li>
					<li>줄거리
						<p id="trailerContents"><@=movie.contents@></p>
					</li>
					<button class="preview_btn play">Play</button>
					<button class="preview_btn detail">Detail</button>
				</ul>
			</div>
			<div id="previewWrap"><@=movie.src@></div>
	</script>

	<script type="text/template" id="userStreamTmp">
    <@_.each(streams,function(stream){@>
    <li class="user_streaming_card">
        <div class="streaming_img">
            <img class="streaming_poster" src="/poster/<@=stream.poster@>"/>
            <img class="streaming_thumbnail" src="/img/<@=stream.thumbnail@>"/>
        </div>
        <div class="streaming_info">
            <div class="streaming_tit">[<@=stream.genre@>]<@=stream.tit@></div>
            <div class="streaming_user"><@=stream.nickname@></div>
            <div class="streaming_cnt"><i class="fas fa-user-friends"></i> <@=stream.cnt@></div>
        </div>
        <div class="streaming_icon">LIVE</div>
    </li>
    <@})@>
</script>

	<!--이어보기 -->
	<!-- 140px 이기 때문에  -->
	<script type="text/template" id="continueTmp">
    <@ _.each(movies,function(movie){
        let total = movie.runtime;
        let myTime = movie.currentTime;

        let gage = Math.ceil(myTime/total*100);

		
        let realGage = gage * 1.4;
    @>
    <li class="continue_card">
        <img src="/poster/<@=movie.poster@>"/>
        <div class="movie_gage">
            <div class="movie_gage_total"></div>
            <div class="movie_gage_now" style="width:<@=realGage@>px"></div>
        </div>
    </li>
    <@})@>
</script>

	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		let flag = true;
		
		
		connect();

		const $heroContentSectionUl = $("#heroContentSection Ul");
		const $heroContentNum = $(".hero_content_num");
		let heroMove = 0;

		const $streamMovePrev = $(".stream_move_prev");
		const $streamMoveNext = $(".stream_move_next");
		const $streamBox = $("#streamBox");
		let hotMove = 0;

		const continueTmp = _.template($("#continueTmp").html());

		const $continueBox = $("#continueBox");
		const $continueMovePrev = $(".continue_move_prev");
		const $continueMoveNext = $(".continue_move_next");
		let continueMove = 0;

		const $climBox = $("#climBox");
		const $climCard = $(".clim_card");
		const $climMovePrev = $(".clim_move_prev");
		const $climMoveNext = $(".clim_move_next");
		let climMove = 0;
		const $trailerBg = $(".trailer_bg");
		const $bgCloseBtn = $(".bg_close_btn");

		const $recommendBox = $(".recommend_box")
		const $recommendCard = $(".recommend_card");
		const $recommendMovePrev = $(".recommend_move_prev");
		const $recommendMoveNext = $(".recommend_move_next");
		let recommendMove = 0;

		const $userStreamTmp = _.template($("#userStreamTmp").html());
		const $userStreamBox = $("#userStreamBox");
		const $userstreamMovePrev = $(".userstream_move_prev");
		const $userstreamMoveNext = $(".userstream_move_next");
		let userStreamMove = 0;
		const $previewSection = $("#previewSection");
		const $trailerTmp = _.template($("#trailerTmp").html());

		/* heroScript */
		$heroContentNum.on("click", function() {
			$heroContentNum.removeClass("hero_on");
			$(this).addClass("hero_on");
			let pageNum = this.dataset.page;
			if (flag) {
				flag = false;
				heroMove = (-(pageNum - 1) * 1100);
				$heroContentSectionUl.css("left", heroMove);
				flag = true;
			}
		})// $heroContentNum click() end

		setInterval(function() {
			let cnt = $("#heroContentSection li").length;

			let nowPosition = $heroContentSectionUl.css("left");
			let testStr = nowPosition.split("px");
			let realPosition = parseFloat(testStr);
			//console.log(realPosition);
			let test = Math.abs(parseFloat(testStr) / 1100) + 1;

			// let absPosition = Math.abs(parseFloat(testStr));

			if (flag) {
				flag = false;
				if (realPosition <= (-1100 * (cnt - 1))) {
					heroMove = 0;
					$heroContentNum.removeClass("hero_on");
					$heroContentNum.eq(0).addClass("hero_on");
				} else {
					heroMove -= 1100;
					$heroContentNum.removeClass("hero_on");
					$heroContentNum.eq(test).addClass("hero_on");
				}
				$heroContentSectionUl.css("left", heroMove);
				flag = true;
			}

		}, 10000); // 10초마다 hero 변경

		/* hotScript */
		$streamMovePrev.on("click", function() {
			if (flag) {
				flag = false;
				if (hotMove == 0) {
					hotMove = -2450;
				} else {
					hotMove += 350;
				}
				$streamBox.css("left", hotMove);
				flag = true
			}
		})
		$streamMoveNext.on("click", function() {
			if (flag) {
				flag = false;
				if (hotMove == -2450) {
					hotMove = 0;
				} else {
					hotMove -= 350;
				}
				$streamBox.css("left", hotMove);
				flag = true
			}
		})

		/* userStreamScript
		function userStream() {
			$.ajax({
				url : "ajax/userClim.json",
				error : function() {
					//alert("에러!");
				},
				success : function(json) {
					$userStreamBox.css("width", json.length * 550);
					$userStreamBox.html($userStreamTmp({
						"streams" : json
					}));
				}//success() end
			});//$.ajax() end
		}// userStream() end 로그인 유저의 이어보기목록 얻어와 userStreamBox width재설정
		userStream();

		$userstreamMovePrev.on("click", function() {

			let cardCntStr = $userStreamBox.css("width");

			let cardCntStr2 = cardCntStr.split("px");

			let cardPosition = parseFloat(cardCntStr2);

			if (flag) {
				flag = false;
				if (userStreamMove == 0) {
					userStreamMove = -cardPosition + 1100;
				} else {
					userStreamMove += 550;
				}
				$userStreamBox.css("left", userStreamMove);
				flag = true;
			}

		})
		$userstreamMoveNext.on("click", function() {
			let cardCntStr = $userStreamBox.css("width");

			let cardCntStr2 = cardCntStr.split("px");

			let cardPosition = parseFloat(cardCntStr2);

			if (flag) {
				flag = false;
				if (-cardPosition + 1100 == userStreamMove) {
					userStreamMove = 0;
				} else {
					userStreamMove -= 550;
				}
				$userStreamBox.css("left", userStreamMove);
				flag = true;
			}
		})

		/* continueScript */

		function mainContinue() {
			$.ajax({
				url : "/ajax/member/${loginMember.no}/continue",
				dataType : "json",
				error : function() {
					//alert("에러!");
				},
				success : function(json) {
					$continueBox.css("width", json.length * 210);
					$continueBox.html(continueTmp({
						"movies" : json
					}));
				}//success() end
			});//$.ajax() end
		}// mainContinue() end 로그인 유저의 이어보기목록 얻어와 continueBox width재설정
		mainContinue();

		$continueMovePrev.on("click", function() {

			let cardCntStr = $continueBox.css("width");

			let cardCntStr2 = cardCntStr.split("px");

			let cardPosition = parseFloat(cardCntStr2);

			if (flag) {
				flag = false;
				if (continueMove == 0) {
					continueMove = -cardPosition + 1050;
					// console.log(continueMove);
				} else {
					continueMove += 210;
				}
				$continueBox.css("left", continueMove);
				flag = true;
			}
		})
		$continueMoveNext.on("click", function() {

			let cardCntStr = $continueBox.css("width");

			let cardCntStr2 = cardCntStr.split("px");

			let cardPosition = parseFloat(cardCntStr2);

			if (flag) {
				flag = false;
				if (-cardPosition + 1050 == continueMove) {
					continueMove = 0;
				} else {
					continueMove -= 210;
				}
				$continueBox.css("left", continueMove);
				flag = true;
			}
		})

		/* climContentScript */

		$climMovePrev.on("click", function() {
			if (flag) {
				flag = false;
				if (climMove == 0) {
					climMove = -4400;
				} else {
					climMove += 1100;
				}
				$climBox.css("left", climMove);
				flag = true;
			}
		})
		$climMoveNext.on("click", function() {
			if (flag) {
				flag = false;
				if (climMove == -4400) {
					climMove = 0;
				} else {
					climMove -= 1100;
				}
				$climBox.css("left", climMove);
				flag = true;
			}
		})
		
		/* 1초이상 호버해야 bg나옴 1초전에 마우스 떠나면 실행안함 */
		let timer;
		let timer2;
		let timer3;
		let timer4;
		let timer5;
		let movieNo;
		$climCard.on("mouseenter", function() {
			$this = $(this);
			movieNo = this.dataset.movieno;
			timer = setTimeout(function() {
				$trailerBg.fadeIn(100);
				trailer();
			}, 2000);

			timer2 = setTimeout(function() {
				// console.log($(this).children('.top_border'));
				$this.children('.top_border').css({
					width : "297px",
					border : "1.5px solid #F9AC1A"
				});
			}, 0);
			timer3 = setTimeout(function() {
				$this.children('.right_border').css({
					height : "187px",
					border : "1.5px solid #F9AC1A"
				});
			}, 500);
			timer4 = setTimeout(function() {
				$this.children('.bottom_border').css({
					width : "297px",
					border : "1.5px solid #F9AC1A"
				});
			}, 1000);
			timer5 = setTimeout(function() {
				$this.children('.left_border').css({
					height : "187px",
					border : "1.5px solid #F9AC1A"
				});
			}, 1500);
		}).on("mouseleave", function() {
			clearTimeout(timer);
			clearTimeout(timer2);
			clearTimeout(timer3);
			clearTimeout(timer4);
			clearTimeout(timer5);

			$(".clim_card .border_box").css({
				width : "0",
				height : "0",
				border : "transparent"
			});

		}); // 2초 시간 체크 하기 mouseenter, mouseleave감지

		$bgCloseBtn.on("click", function() {
			$(this).parent().fadeOut(100);
		})

		/* recommendScript */

		$recommendMovePrev.on("click", function() {
			let nowLeft = $(this).prev().css("left");

			let res = nowLeft.split("px");

			if (res[0] == 0) {
				recommendMove = 0;
			}

			recommendMove = res[0];

			recommendMove = Number(recommendMove);

			if (flag) {
				flag = false;
				recommendMove += 210;

				$(this).prev().css("left", recommendMove);
				flag = true;
			}
		}); // $recommendMovePrev click() end

		$recommendMoveNext.on("click", function() {
			let nowLeft = $(this).prev().prev().css("left");

			let res = nowLeft.split("px");

			if (res[0] == 0) {
				recommendMove = 0;
			}

			recommendMove = res[0];

			recommendMove = Number(recommendMove);
			if (flag) {
				flag = false;
				recommendMove -= 210;

				$(this).prev().prev().css("left", recommendMove);
				flag = true;
			}
		}); // $recommendMoveNext click() end

		
		$recommendBox.on("mouseenter", ".recommend_card", function() {
			$this = $(this);

			movieNo = this.dataset.movieno;
			timer = setTimeout(function() {
				$trailerBg.fadeIn(100);
				trailer();
			}, 2000);

			timer2 = setTimeout(function() {
				// console.log($(this).children('.top_border'));
				$this.children('.top_border').css({
					width : "154px",
					border : "1.5px solid #F9AC1A"
				});
			}, 0);
			timer3 = setTimeout(function() {
				$this.children('.right_border').css({
					height : "234px",
					border : "1.5px solid #F9AC1A"
				});
			}, 500);
			timer4 = setTimeout(function() {
				$this.children('.bottom_border').css({
					width : "154px",
					border : "1.5px solid #F9AC1A"
				});
			}, 1000);
			timer5 = setTimeout(function() {
				$this.children('.left_border').css({
					height : "234px",
					border : "1.5px solid #F9AC1A"
				});

			}, 1500);
		}).on("mouseleave", ".recommend_card", function() {
			clearTimeout(timer);
			clearTimeout(timer2);
			clearTimeout(timer3);
			clearTimeout(timer4);
			clearTimeout(timer5);

			$(".recommend_card .border_box").css({
				width : "0",
				height : "0",
				border : "transparent"
			});

		}); // 2초 시간 체크 하기 mouseenter, mouseleave감지

		$(".recommend_special_box").on("mouseenter", ".recommend_special_card",
				function() {
					// $(this).css("border","3px solid yellow");
					$this = $(this);
					let cardWidth = $this.css("width");
					let cardHeight = $this.css("height");

					// console.log($(this).children('.top_border'));
					movieNo = this.dataset.movieno;
					timer = setTimeout(function() {
						$(document).ready(function(ev){
							$("#previewWrap iframe")[6].src += "&autoplay=1";
							ev.preventDefault();
						});
						
						$trailerBg.fadeIn(100);
						trailer();
					}, 2000);

					timer2 = setTimeout(function() {
						// console.log($(this).children('.top_border'));
						$this.children('.top_border').css({
							width : cardWidth,
							border : "1.5px solid #F9AC1A"
						});
					}, 0);
					timer3 = setTimeout(function() {
						$this.children('.right_border').css({
							height : cardHeight,
							border : "1.5px solid #F9AC1A"
						});
					}, 500);
					timer4 = setTimeout(function() {
						$this.children('.bottom_border').css({
							width : cardWidth,
							border : "1.5px solid #F9AC1A"
						});
					}, 1000);
					timer5 = setTimeout(function() {
						$this.children('.left_border').css({
							height : cardHeight,
							border : "1.5px solid #F9AC1A"
						});
					}, 1500);
				}).on("mouseleave", ".recommend_special_card", function() {
			clearTimeout(timer);
			clearTimeout(timer2);
			clearTimeout(timer3);
			clearTimeout(timer4);
			clearTimeout(timer5);

			$(".recommend_special_card .border_box").css({
				width : "0",
				height : "0",
				border : "transparent"
			});

		}); // 2초 시간 체크 하기 mouseenter, mouseleave감지

		function trailer() {
			$("#headerSubscribeSlideWrap").css("display", "none");
			$("#headerSubscribeList").css("display", "block");
			console.log(movieNo);
			$.ajax({
				url : "/ajax/movie/"+ movieNo +"/trailer",
				dataType : "json",
				type : "GET",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					$previewSection.empty().append($trailerTmp({"movie" : json.movie,"directors" : json.directors,"actors" : json.actors}));
				}//success end
			});// ajax end
		}
		
		$(".trailer_bg").on("click",".book_mark",function(){
			let no = this.dataset.no;
			let type = "POST";
			let $bookmarkBtn = $(this);
			if($(this).hasClass("on")){
				type = "DELETE";
			}
			$.ajax({
				url:"/ajax/movie/"+no+"/bookmark/${loginMember.no}",
				type:type,
				dataType:"json",
				error:function(){
					alert("bookmark add 에러");
				},
				success:function(json){
					$bookmarkBtn.toggleClass("on");
				}
			})
		});//click end
		
	</script>
</body>
</html>