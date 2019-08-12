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
            <img id="moviePoster" class="movie_poster" src="/posters${movie.poster}" alt="포스터">
            <span>
           		<c:choose>
      				<c:when test="${movie.movieRating=='전체관람가'}">
        				<img id="watchingRate" class="movie_watching_rate" src="/img/전체.png">
      				</c:when>
      				<c:when test="${movie.movieRating=='12세이상관람가'}">
       					<img id="watchingRate" class="movie_watching_rate" src="/img/12세.png">
      				</c:when>
      				<c:when test="${movie.movieRating=='15세이상관람가'}">
       					<img id="watchingRate" class="movie_watching_rate" src="/img/15세.png">
      				</c:when>
      				<c:otherwise>
       					<img id="watchingRate" class="movie_watching_rate" src="/img/19세.png">
     				</c:otherwise>
           		</c:choose>
     		</span>
        </div>
        <div class="movie_info_wrap">
            <div id="movieTitle" class="movie_title"><strong>${movie.title} </strong></div>
            <div class="movie_avg_box">
                <span class="avg_score">${movieScore/2}</span>
                <div class="starRev">
                    <c:forEach var="i" begin="1" end="10">
                	<c:choose>
                		<c:when test="${i%2==1}">
                   			<span class="starR1 ${i<=movieScore ? 'on' : '' }">별1_왼쪽</span>
                   		</c:when>
                   		<c:otherwise>
                    		<span class="starR2 ${i<=movieScore ? 'on' : '' }">별1_오른쪽</span>
                    	</c:otherwise>
                    </c:choose>
                </c:forEach>
                </div>
            </div>
            <div id="pubDate" class="movie_pub_date">개봉일: ${movie.opendate}</div>
            <div id="director">감독:
            	<c:forEach var="director" items="${directors}" varStatus="status">
	            	<a href="">${director.name}</a>
            		<c:if test="${!status.last}">
						,
					</c:if>
	            </c:forEach>
           	</div>
            <div id="actor">출연진:
            	<c:forEach var="actor" items="${actors}" varStatus="status">
            		<a href="">${actor.name}</a>
					<c:if test="${!status.last}">
						,
					</c:if>
            	</c:forEach>
            </div>
            <div id="genre">장르:
	            <c:forEach var="genre" items="${genres}" varStatus="status">
	            	<a href="">${genre.genre}</a>
					<c:if test="${!status.last}">
						,
					</c:if>
            	</c:forEach>
            </div>
            <div id="runtime">상영시간: ${movie.runtime}분</div>
            <div id="climAcc">끌림수: ${movie.climed}명</div>
            <div class="movie_info_btn_box">
	            <button id="moviePlayBtn" class="movie_info_btn" title="영화재생"><i class="far fa-play-circle"></i> Play</button>
	           	<button id="movieAddBtn" class="movie_info_btn add_movie ${1==1 && bookMarkCheck == 1 ? 'on' : ''  }" title="찜하기"><i class="fas fa-plus"></i> Add</button>
	            <button id="addStreamingList" class="movie_info_btn add_stream ${1==1 && climBookMarkCheck == 1 ? 'on' : ''  }" title="스트리밍 목록추가"><i class="fas fa-plus"></i> Clim</button>
        	</div>
        </div>
        <div id="playPopup" class="play_popup">
            <div>영화를 보시겠습니까?</div> <!--처음볼때 -->
            <!-- <div>이어서 보시겠습니까?</div> --> <!--본적있을때 -->
            <button id="popupConfirmBtn" class="popup_btn"><a href=""></a>확인</button>
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
                ${trailer.src}
            </div>
        </div>
        <!--스틸컷-->
        <div class="steelcut_wrap">
            <div class="scene_list_box">
                <ul class="preview_list photo">
                	<c:forEach var="steelCut" items="${steelCuts}">
                		<li><img src="/stealCut${steelCut.src}"></li>
                	</c:forEach>
                </ul>
            </div>
            <div class="icon left_icon"><i class="fas fa-angle-left"></i></div>
            <div class="icon right_icon"><i class="fas fa-angle-right"></i></div>
            <div id="showSteelcut" class="movie_preview">
                <img src="" width="1000" height="500">
            </div>
        </div>
    </div><!--//movie_scene_section-->

    <div class="movie_review_section">
        <h2>리뷰(${movie.cnt})</h2>
        <button id="writeReview">리뷰 작성</button>
        <!-- 리뷰 작성 popup -->
        <div class="write_review_box">
            <div class="review_title">${movie.title}</div>
                <div class="checkStarRev">
                <c:forEach var="i" begin="1" end="10">
                	<c:choose>
                		<c:when test="${i%2==1}">
                   			<span class="starR1 ${i<=scoreCount ? 'on' : '' }">별1_왼쪽</span>
                   		</c:when>
                   		<c:otherwise>
                    		<span class="starR2 ${i<=scoreCount ? 'on' : '' }">별1_오른쪽</span>
                    	</c:otherwise>
                    </c:choose>
                </c:forEach>
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
            <textarea class="review_content" placeholder="리뷰를 남겨주세요"></textarea>
            <div class="msg">리뷰작성을 해주세요</div>
            <button id="registerReviewBtn" class="popup_btn">리뷰 남기기</button>
            <div class="review_cancel_btn"><i class="far fa-times-circle"></i></div>
        </div><!-- //write_review_box -->

        <!-- 리뷰 리스트 -->
        <ul class="review_list">
            <!-- review template -->
        </ul>
		<!--//paginate-->
     </div><!--//movie_review_section-->
</main>
<c:import url="/WEB-INF/template/footer.jsp"/>
<!--리뷰 템플릿-->
<script type="text/template" id="reviewListTmp">
<@if(reviews.length==0) {@>
	<div class="no_review">없어요 없어 리뷰가~</div>
<@} else {@>
	<@_.each(reviews, function(review, index){@>
    	<li>
			<div class="review_box">
        		<div class="review_top_box">
           			<span class="nickname"><a href=""><@=review.nickname@></a></span>
					
					<@if(review.memberNo==2) {@>
          			<span class="review_spoiler <@if(review.checkSpoiler) {@>on<@}@>" data-name="<@=review.memberNo@>" data-no="<@=review.no@>" title="스포일러 신고">
						<i class="far fa-dizzy"></i>
					</span>
					<@}@>

            		<span class="review_list_avg_score">
						<@ var end = review.score @>
						<@ for(i=1; i<=10; i++) { @>
							<@if(i%2==1) { @>
                				<span class="starR1 <@if(i<=end){@>on<@}@>">별1_왼쪽</span>
							<@} else {@>
                				<span class="starR2 <@if(i<=end){@>on<@}@>">별1_오른쪽</span>
							<@}@>
						<@}@>
            		</span>
        		</div>
        		<div class="review_list_content <@if(review.checkSpoiler) {@>on<@}@>"><@=review.contents@></div>
        		<div class="review_bottom_box">
            		<span class="review_regdate"><@=moment(review.regdate).format("YYYY-MM-DD")@></span>
            		<span class="review_likes <@if(review.checkLike) {@>on<@}@> like far fa-thumbs-up" data-name="<@=review.memberNo@>" data-no="<@=review.no@>" data-emotion="L"><@=review.like@></span>
            		<span class="review_likes <@if(review.checkDisLike) {@>on<@}@> dislike far fa-thumbs-down" data-name="<@=review.memberNo@>" data-no="<@=review.no@>" data-emotion="D"><@=review.dislike@></span>
        		</div>
			</div>
    	</li>
	<@})@>
<@}@>
<@=paginate@>
</script>
<script src="/js/moment-with-locales.js"></script>
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
    
    function showFirstSteelcut(){
    	let firstSteelCut = $(".preview_list").eq(0).find("img").attr("src");
        //alert(firstSteelCut);
        $("#showSteelcut img").attr("src",firstSteelCut);
    }
    showFirstSteelcut();
    
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
    
    let page = 1;
    // 리뷰 리스트 불러오기~
    function getReviewList() {
		$.ajax({
			url: "/ajax/movie/${movie.no}/review/page/"+page,
			dataType: "json",
			type: "get",
			error: function () {
				alert("Error");
			}, //error end
			success: function (json) {
				//console.log(json);
				$reviewList.empty().prepend(reviewTmp({"reviews": json.reviews, "paginate": json.paginate}));
				
			} //success end
		}); //ajax() end
	}//getReviewList() end
	getReviewList();
	
	$(".review_list").on("click",".paginate a",function (e) {
		e.preventDefault();
		page = this.dataset.no;
		getReviewList();
	});
	
 	//리뷰 작성 popup 리뷰남기기 버튼 클릭시
    $(".write_review_box").on("click","#registerReviewBtn",function (e) {
    	
        let content = $(".review_content").val();
        if(content.trim().length == 0) {
            $(".msg").show();
            e.preventDefault();
        } else {
        	$(".msg").hide();
            $(".write_review_box").hide();
        	$.ajax({
            	url: "/ajax/movie/{movieNo}/review",
            	dataType: "json",
            	data: {
            		movieNo: ${movie.no},
            		contents: content,
            		score: checkedStar,
            		memberNo: 2 //${loginMember.no}
            	},
            	type: "POST",
            	error: function () {
            		alert("서버 점검중입니다.");
    			}, // error end
            	success: function(json) {
    				//console.log(json);
    				$(".msg").hide();
    	            $(".write_review_box").hide();
    				getReviewList();
    				$(".review_content").val("");
    				$(".checkStarRev").parent().children('span').removeClass('on');
    			}// success end
            }); //ajax() end
        }
    });
	
    $(".review_content").keyup(function () {
        $(".msg").hide();
    });

    // 스포일러 버튼 클릭시 블러처리
    $reviewList.on("click",".review_spoiler",function () {
    	
    	let no = this.dataset.no;
    	let reviewMemberNo = this.dataset.name;
        //console.log(no);
        //console.log(reviewMemberNo);
        
    	let type="";
        if(1 != reviewMemberNo) {
        	
        	type = "post";
        	$.ajax({
            	url: "/ajax/movie/${movie.no}/spoiler",
            	dataType: "json",
            	type: type,
            	data:{
          			type: 'S',
               		reporterNo: 2, //loginMember
               		postNo: no
            	},
            	error: function () {
    				alert("에러입니다 학생");
    			},
    			success: function (json) {
    				getReviewList();
    			}
            }); //ajax() end
        	$(this).addClass("on");
            $(this).parent().next().css({"filter":"blur(3px)"});
            $(this).parent().next().addClass("on");
            
        } else { // loginMember == reivew.memberNo
        	// 내 글을 누르면 삭제
        	type = "get";
        	$.ajax({
            	url: "/ajax/movie/${movie.no}/spoiler",
            	dataType: "json",
            	type: type,
            	data: {
               		no: no
            	},
            	error: function () {
    				alert("에러입니다 학생!!!!!!!!!!");
    			},
    			success: function (json) {
    				$(this).parent().parent().remove();
    				getReviewList();
    			}
            }); //ajax() end
        }
    }); // review_spoiler click() end

    let checkedStar;
    //별 스크립트
    $(".write_review_box").on("click",'.checkStarRev span',function(){
    	
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
		checkedStar = $(".checkStarRev .on").length;
        
        return false;
    });
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
    let $addMovie = $(".add_movie");
    $addMovie.click(function () {
    	let type;
       	let url;
       	let bookmarkType = 'B';
       	if(!$addMovie.hasClass("on")) {
       		type = "post";
       		url = "/ajax/movie/${movie.no}/bookmark";
       		$addMovie.addClass("on");
       	} else{
       		type= "delete";
       		url = "/ajax/movie/${movie.no}/bookmark";
       		$addMovie.removeClass("on");
       	}
       	
   		$.ajax({
              	url: url,
              	type: type,
              	dataType: "json",
              	data:JSON.stringify({
              		memberNo: 2, //${loginMember.no}
              		movieNo: ${movie.no},
              		type: bookmarkType	
              	}),
                headers: {'Content-Type': 'application/json'},
              	error: function () {
              		alert("에러다");
              	},
              	success: function (json) {
              		if(type=="post") {
              			alert("찜 합니다~");
              		} else {
              			alert("찜 취소합니다~");
              		}
      			}
           });// ajax end
    }); // addMovie click() end
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
    let $addStream = $(".add_stream");
    $addStream.click(function () {
    	
    	let type;
       	let url;
       	let climType = 'S';
       	
       	if(!$addStream.hasClass("on")) {
       		type = "post";
       		url = "/ajax/movie/{movieNo}/bookmark";
       		$addStream.addClass("on");
       	} else {
       		type= "delete";
       		url = "/ajax/movie/{movieNo}/bookmark";
       		$addStream.removeClass("on");
       	}
    	//console.log(type);
    	//console.log(url);
    	$.ajax({
           	url: "/ajax/movie/{movieNo}/bookmark",
           	dataType: "json",
           	type: type,
           	data:JSON.stringify({
           		memberNo: 2, //${loginMember.no}
           		movieNo: ${movie.no},
           		type: climType
           	}),
           	headers: {'Content-Type': 'application/json'},
           	error: function () {
           		alert("에러다");
           	},
           	success: function (json) {
           		if(type=="post") {
          			alert("스트리밍 구독합니다~");
          		} else {
          			alert("스트리밍 구독 취소합니다~");
          		}
   			}
        });// ajax end
    }); // addStream click() end
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $reviewList.on("click",".review_list_content",function () {
        $(this).css("display", "block");
    });

    $(".movie_plot").click(function () {
        $(this).css("display","block");
    });

    $(".review_list").on("click", ".review_likes", function () {
    	$this = $(this);
    	let postNo = this.dataset.no;
    	let memberNo = this.dataset.name;
    	let emotion = this.dataset.emotion;
    	
    	if ($this.hasClass("on")) {
    		$.ajax({
    	     	   
        	    url:"/ajax/movie/{movieNo}/like",
        	    dataType:"json",
        	    type:"get",
        	    data:{
        		    memberNo: memberNo,
        		    postNo: postNo,
        		    emotion: emotion,
        		    type: 'M'
        	    },
        	    error: function () {
    				alert("좋아요 에러");
    		    },
    		    success: function () {
    		    	$this.removeClass("on");
    		    	getReviewList();
    		    }
           }); //ajax() end
    	} else {
    		$.ajax({
    	     	   
        	    url:"/ajax/movie/{movieNo}/like",
        	    dataType:"json",
        	    type:"post",
        	    data:{
        		    memberNo: memberNo,
        		    postNo: postNo,
        		    emotion: emotion,
        		    type: 'M'
        	    },
        	    error: function () {
    				alert("좋아요 에러");
    		    },
    		    success: function () {
    		    	$this.addClass("on");
    		    	getReviewList();
    		    }
           }); //ajax() end
    	} // if ~ else () end
    });
    
</script>
</body>
</html>
