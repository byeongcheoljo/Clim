<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>movieDetail</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/movieDetail.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main id="content">
    <div class="movie_info_section">
        <div class="movie_poster_wrap">
            <img id="moviePoster" class="movie_poster" src="/poster/aladin.jpg" alt="포스터">
        </div>
        <div class="movie_info_wrap">
        	
            <div id="movieTitle" class="movie_title"><strong>${movie.title} <span><img id="watchingRate" class="movie_watching_rate" src="/img/12세.png"></span></strong></div>
            <div class="movie_avg_box">
                <!-- <span>예상평점: 4.5</span> -->
                <span class="avg_score">평점: 5</span>
                <div class="starRev">
                    <span class="starR1 on">별1_왼쪽</span>
                    <span class="starR2 on">별1_오른쪽</span>
                    <span class="starR1 on">별2_왼쪽</span>
                    <span class="starR2 on">별2_오른쪽</span>
                    <span class="starR1 on">별3_왼쪽</span>
                    <span class="starR2 on">별3_오른쪽</span>
                    <span class="starR1 on">별4_왼쪽</span>
                    <span class="starR2 on">별4_오른쪽</span>
                    <span class="starR1 on">별5_왼쪽</span>
                    <span class="starR2">별5_오른쪽</span>
                </div>
                <!--
                <@
                var end = bookmark.score*2;
                for(var i=1; i<=10; i++){
                if(i%2==1) {@>
                <span class="productListItemStar_starR1 <@if(i<=end){@>on<@}@>">별1_왼쪽</span>
                <@} else {@>
                <span class="productListItemStar_starR2 <@if(i<=end){@>on<@}@>">별1_오른쪽</span>
                <@}} @>
                -->
            </div>
            <div id="pubDate" class="movie_pub_date">개봉일: ${movie.opendate}</div>
            <div id="director">
	            <a href="">감독:
		            <c:forEach var="director" items="${directors}">
		            	${director.name},
		            </c:forEach>
	            </a>
           	</div>
            <div id="actor">
            	<a href="">출연진:
	            	<c:forEach var="actor" items="${actors}">
	            		${actor.name},
	            	</c:forEach>
            	</a>
            </div>
            <div id="genre">
	            <a href="">장르:
	            	<c:forEach var="genre" items="${genres}">
	            		${genre.genre},
	            	</c:forEach>
	            </a>
            </div>
            <div id="runtime">상영시간: ${movie.runtime}분</div>
            <div id="climAcc">끌림수: 3명</div>
            <button id="moviePlayBtn" class="movie_info_btn" title="영화재생"><i class="far fa-play-circle"></i> Play</button>
            <button id="movieAddBtn" class="movie_info_btn" title="찜하기"><i class="fas fa-plus"></i> Add</button>
            <button id="addStreamingList" class="movie_info_btn" title="스트리밍 목록추가"><i class="fas fa-plus"></i> Clim</button>
        </div>
        <div id="playPopup" class="play_popup">
            <div>영화를 보시겠습니까?</div> <!--처음볼때 -->
            <!-- <div>이어서 보시겠습니까?</div> --> <!--본적있을때 -->
            <button id="popupConfirmBtn" class="popup_btn">확인</button>
            <button id="popupCancelBtn" class="popup_btn">취소</button>
        </div>
    </div><!--//movie_info_section-->

    <div class="movie_plot_section">
        <h2>줄거리</h2>
        <p class="movie_plot">
            ${movie.contents}
        </p>
    </div><!--//movie_plot_section-->

    <div class="movie_scene_section">
        <div class="movie_scene_tab">
            <span id="moviePreview" class="movie_scene">예고편</span>
            <span id="movieSteelcut" class="movie_scene">스틸컷</span>
        </div>
        <!--예고편-->
        <div class="preview_wrap">
            <div id="playPreview" class="movie_preview">
                <!-- <iframe autoplay="none" src="https://youtu.be/yHIZFeKWd1I" width="1000" height="700" gesture="media"></iframe> -->
                <iframe width="1000" height="800" src="https://www.youtube.com/embed/yNQE9Gm54EQ" gesture="media"></iframe>
            </div>
        </div>
        <!--스틸컷-->
        <div class="steelcut_wrap">
            <div class="scene_list_box">
                <ul class="preview_list photo">
                    <li><img src="/img/lion.jpg"></li>
                    <li><img src="/img/lion2.jpg"></li>
                    <li><img src="/img/lion3.jpg"></li>
                    <li><img src="/img/lion4.jpg"></li>
                    <li><img src="/img/lion5.jpg"></li>
                    <li><img src="/img/sgh1.jpg"></li>
                    <li><img src="/img/sgh2.jpg"></li>
                </ul>
            </div>
            <div class="icon left_icon"><i class="fas fa-angle-left"></i></div>
            <div class="icon right_icon"><i class="fas fa-angle-right"></i></div>
            <div id="showSteelcut" class="movie_preview">
                <img src="/img/lion.jpg" width="1000" height="500">
            </div>
        </div>
    </div><!--//movie_scene_section-->

    <div class="movie_review_section">
        <h2>리뷰(999)</h2>
        <button id="writeReview">리뷰 작성</button>
        <!-- 리뷰 작성 popup -->
        <div class="write_review_box">
            <div class="review_title">나는 전설이다</div>
                <div class="checkStarRev">
                    <span class="starR1 on">별1_왼쪽</span>
                    <span class="starR2 on">별1_오른쪽</span>
                    <span class="starR1 on">별2_왼쪽</span>
                    <span class="starR2 on">별2_오른쪽</span>
                    <span class="starR1 on">별3_왼쪽</span>
                    <span class="starR2 on">별3_오른쪽</span>
                    <span class="starR1 on">별4_왼쪽</span>
                    <span class="starR2">별4_오른쪽</span>
                    <span class="starR1">별5_왼쪽</span>
                    <span class="starR2">별5_오른쪽</span>
                </div>
            <textarea class="review_content" placeholder="리뷰를 남겨주세요"></textarea>
            <div class="msg">리뷰작성을 해주세요</div>
            <button id="registerReviewBtn" class="popup_btn">리뷰 남기기</button>
            <div class="review_cancel_btn"><i class="far fa-times-circle"></i></div>
        </div><!-- //write_review_box -->

        <!-- 리뷰 리스트 -->
        <ul class="review_list">
            <!-- review template -->
            <div class="no_review">없어요 없어 리뷰가~</div>
        </ul>
    </div><!--//movie_review_section-->
</main>
<c:import url="/WEB-INF/template/footer.jsp"/>
<!--리뷰 템플릿-->
<script type="text/template" id="reviewListTmp">

    <li>
        <div class="review_top_box">
            <span class="nickname"><a href="">닉네임은여섯</a></span>
            <span class="review_spoiler" title="스포일러 신고"><i class="far fa-dizzy"></i></span>
            <span class="review_list_avg_score">
                <span class="starR1 on">별1_왼쪽</span>
                <span class="starR2 on">별1_오른쪽</span>
                <span class="starR1 on">별1_왼쪽</span>
                <span class="starR2 on">별1_오른쪽</span>
                <span class="starR1 on">별1_왼쪽</span>
                <span class="starR2 on">별1_오른쪽</span>
                <span class="starR1 on">별1_왼쪽</span>
                <span class="starR2 on">별1_오른쪽</span>
                <span class="starR1 on">별1_왼쪽</span>
                <span class="starR2 on">별1_오른쪽</span>
            </span>
        </div>
        <div class="review_list_content"><@=content@></div>

        <div class="review_bottom_box">
            <span class="review_regdate">2019.07.25</span>
            <span class="review_likes like far fa-thumbs-up">21 </span>
            <span class="review_likes dislike far fa-thumbs-down">15 </span>
        </div>
    </li>

</script>
<script>

    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    let reviewTmp = _.template($("#reviewListTmp").html());
    // Play 버튼
    let $moviePlayBtn = $("#moviePlayBtn");

    // 예고편, 스틸컷 tab
    let $moviePreview = $("#moviePreview");
    let $movieSteelcut = $("#movieSteelcut");
    let $previewWrap = $(".preview_wrap");
    let $steelcutWrap = $(".steelcut_wrap");

    // 예고편, 스틸컷 화살표
    let $leftIcon = $(".left_icon");
    let $rightIcon = $(".right_icon");

    let $preview = $(".preview_list li");
    let $playPreview = $("#playPreview video");
    let $showSteelcut = $("#showSteelcut img");

    // Play 버튼 누르면 Popup
    $moviePlayBtn.click(function () {
        $("#playPopup").css("display", "block");
    });

    // popup에서 확인이나 취소누르면 사라진다
    $(".popup_btn").click(function () {
        $("#playPopup").css("display", "none");
    });

    // 스틸컷 누르면 스틸컷 보여주기
    $movieSteelcut.click(function () {
        $movieSteelcut.css("color", "#F9AC1A");
        $moviePreview.css("color", "#fff");
        $previewWrap.css("display", "none");
        $steelcutWrap.css("display", "block");
        current = 0;
    });
    // 예고편 누르면 예고편 보여주기
    $moviePreview.click(function () {
        $moviePreview.css("color", "#F9AC1A");
        $movieSteelcut.css("color", "#fff");
        $previewWrap.css("display", "block");
        $steelcutWrap.css("display", "none");
    });

    current = 0; // 현재값을 0으로 초기화
    $leftIcon.click(function () {
        if (current != 0) { //현재값이 0이 아니면 이동
            current = current + 225;
            $(".preview_list li").css("left", current + "px");
        }
    });
    $rightIcon.click(function () {
        if (current != -675) { //리스트가 10개면 -((10-4) * 225)까지 이동
            current = current - 225;
            $(".preview_list li").css("left", current + "px");
        }
    });

    // li 누른게 보인다
    $preview.click(function () {
        let showSteelcut = $(this).children("img").attr("src");
        let playPreview = $(this).children("video").attr("src");
        $showSteelcut.attr("src", showSteelcut);
        $playPreview.attr("src", playPreview);
    });

    // 리뷰 작성 버튼 클릭시 popup
    let $writeReview = $("#writeReview");
    let $reviewList = $(".review_list");

    $writeReview.click(function () {
        $(".write_review_box").show();

        $(".review_content").focus();
    });

    // 리뷰 작성 popup 취소 버튼 클릭시
    $(".review_cancel_btn").click(function () {
        $(".write_review_box").hide();
    });

    //리뷰 작성 popup 리뷰남기기 버튼 클릭시
    $(".write_review_box").on("click","#registerReviewBtn",function (e) {
        let content = $(".review_content").val();
        $(".no_review").hide();

        if(content.trim().length == 0) {
            $(".msg").show();
            e.preventDefault();
        } else {
            $(".msg").hide();
            $(".write_review_box").hide();
            $reviewList.prepend(reviewTmp({"content": content}));
            $(".review_content").val("");
        }
    });
    $(".review_content").keyup(function () {
        $(".msg").hide();
    });

    // 스포일러 버튼 클릭시 블러처리
    $reviewList.on("click",".review_spoiler",function () {
        $(this).parent().next().css({"filter":"blur(3px)"});  // 다른 유저의 스포리뷰 블러처리
        // $(this).parent().parent().remove();              // 내 글을 누르면 삭제
        $(".review_spoiler").css({"color" : "#F9AC1A"});
    });

    //별 스크립트
    $(".write_review_box").on("click",'.checkStarRev span',function(){
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });

    let $movieInfoNtn = $(".movie_info_btn");
    $movieInfoNtn.click(function () {
        $(this).toggleClass("on");
    });

    $reviewList.on("click",".review_list_content",function () {
        $(this).css("display", "block");
    });

    $(".movie_plot").click(function () {
        $(this).css("display","block");
    });

    $(".review_list").on("click", ".review_likes", function () {
       let likeCount =  $(this).text();
       ++likeCount;
       $(this).text(""+likeCount).css("color", "#F9AC1A");
    });
    
</script>
</body>
</html>