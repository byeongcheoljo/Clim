<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티탭</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/mypageCommunity.css"/>
    <link rel="stylesheet" href="/css/mypage_home_tab.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main id="main">
	<div id="tabSectionUserPage">
        <ul id="headerNavMypage">
            <li id="nicknameHeaderMypage">${member.nickname }</li>
            <li>홈</li>
            <li>찜</li>
            <li class="header_myPage_tabbed">커뮤니티</li>
            <li>정보수정</li>
            <li>FAQ</li>
        </ul>
    </div><!-- //tabSectionUserPage -->

    <div id="communitySection">
        <div id="communityTabWrap">
            <ul>
                <li id="mywriteContentTab" class="community_tab_on">내가 작성한 글</li>
                <li id="mywriteReplyTab">내가 작성한 댓글</li>
                <li id="mywriteCommentTab">리뷰</li>
            </ul>
        </div>
        <div id="communityContentWrap">
            <ul id="mywriteContentBox">
            </ul>
            <ul id="mywriteReplyBox">
            </ul>
            <ul id="mywriteCommentBox">
            </ul>
        </div>
    </div>
<c:import url="/WEB-INF/template/footer.jsp"/>
</main>
<script type="text/template" id="contentBoxTmp">
<@if(!empty){@>
	<li class="mypage_community_card">
        <div class="content_num content_num_top top">no</div>
        <div class="content_tit content_tit_top top">내용</div>
        <div class="content_date content_date_top top">작성시간</div>
    </li>
    <@ _.each(contents, function(content){
	let contentContent = content.contents;
	console.log(contentContent.length);
    if(contentContent.length>33){
        contentContent = contentContent.substring(0,32)+"…";
    }
	@>
    <li class="mypage_community_card">
        <div class="content_num"><@=content.no@></div>
        <div class="content_tit"><@=contentContent@></div>
        <div class="time content_date"><@=content.regdate@></div>
    </li>

    <@ }) @>
    <@=paginate@>
<@}else {@>
<div id="communityEmpty">아직 등록한 게시물이 없습니다.</div>
<@}@>
</script>
<script type="text/template" id="replyBoxTmp">
<@if(!empty){@>
	<li class="mypage_community_card">
        <div class="content_tit content_tit_top top">내용</div>
        <div class="content_date content_date_top top">작성 시간</div>
    </li>
    <@ _.each(replies, function(reply){
    let replyContent = reply.contents;
    if(replyContent.length>33){
        replyContent = reply.tit.substring(0,32)+"…";
    }
    @>
    <li class="mypage_community_card">
        <div class="content_tit"><@=replyContent@></div>
        <div class="time content_date"><@=reply.regdate@></div>
    </li>
    <@ }) @>
    <@=paginate@>
<@}else {@>
<div id="communityEmpty">아직 등록한 게시물이 없습니다.</div>
<@}@>
</script>
<script type="text/template" id="commentBoxTmp">

<@if(!empty){@>
	<li class="mypage_community_card">
        <div class="content_tit content_tit_top top">내용</div>
        <div class="contnet_movie contnet_movie_top top">영화 제목</div>
        <div class="content_date content_date_top top">작성 시간</div>
    </li>
    <@ _.each(comments, function(comment){
    let commentContent = comment.contents;
    if(commentContent.length>33){
    commentContent = comment.tit.substring(0,32)+"…";
    }@>
    <li class="mypage_community_card">
        <div class="content_tit"><@=commentContent@></div>
        <div class="contnet_movie"><@=comment.title@></div>
        <div class="time content_date"><@=comment.regdate@></div>
    </li>
    <@ }) @>
    <@=paginate@>
<@}else {@>
	<div id="communityEmpty">아직 등록한 게시물이 없습니다.</div>
<@}@>
</script>
<script src="/js/moment-with-locales.js"></script>
<script>
    _.templateSettings = {
        interpolate : /\<\@\=(.+?)\@\>/gim,
        evaluate : /\<\@([\s\S]+?)\@\>/gim,
        escape : /\<\@\-(.+?)\@\>/gim
    };
    const $communityTabWrapLi = $("#communityTabWrap li");

    const contentBoxTmp = _.template($("#contentBoxTmp").html());
    const replyBoxTmp = _.template($("#replyBoxTmp").html());
    const commentBoxTmp = _.template($("#commentBoxTmp").html());

    const $mywriteContentTab = $("#mywriteContentTab");
    const $mywriteReplyTab = $("#mywriteReplyTab");
    const $mywriteCommentTab = $("#mywriteCommentTab");

    const $mywriteContentBox = $("#mywriteContentBox");
    const $mywriteReplyBox = $("#mywriteReplyBox");
    const $mywriteCommentBox = $("#mywriteCommentBox");

    let page = 1;
    
	$mywriteContentBox.css("display", "block");
	$mywriteReplyBox.css("display", "none");
	$mywriteCommentBox.css("display", "none");
    
    function mywriteContent() {
        $.ajax({
            url: "/ajax/member/${member.no}/boards/page/"+page,
            error: function () {
                alert("에러!");
            },
            success: function (json) {
                $mywriteContentBox.html(contentBoxTmp({"contents": json.boards, "paginate":json.paginate, "empty":json.boards.length==0}));
                setTimeout(function timeChange(){
					
					$(".time").each(function() {
						
						let rTime = $(this).text(); // 댓글들 각 시간구하기
						
						let urTime = rTime.substring(0,10);
						
						let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
						
						let cTime = ""; // 바뀔 시간

						let nowDate = moment(); // 현재시간

						let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
						let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
						let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

						if (diffHours > 24) {

							cTime = raDate;
							console.log(cTime);

						} else if (diffHours > 0) {

							cTime = diffHours + "시간전";

						} else if (diffMinutes > 0) {

							cTime = diffMinutes + "분 전";

						} else if (diffSeconds >= 0) {

							cTime = "방금 전";

						}
						
						$(this).text(cTime);
					});
						
						
					},0);
            }//success() end
        });//$.ajax() end
    }
    mywriteContent();
    
    $mywriteContentTab.on("click",function(){
    	
    	$mywriteContentBox.css("display", "block");
        $mywriteReplyBox.css("display", "none");
        $mywriteCommentBox.css("display", "none");
    	page = 1;
    	
        $communityTabWrapLi.removeClass("community_tab_on");
        $(this).addClass("community_tab_on");

        mywriteContent();
    });//$mywriteContentTab.click() end

    $mywriteReplyTab.on("click",function () {
    	
    	page = 1;

        $communityTabWrapLi.removeClass("community_tab_on");
        $(this).addClass("community_tab_on");
        $mywriteContentBox.css("display", "none");
        $mywriteReplyBox.css("display", "block");
        $mywriteCommentBox.css("display", "none");
        $.ajax({
            url:"/ajax/member/${member.no}/comments/page/"+page,
            error:function(){
                alert("에러!");
            },
            success:function(json){
            	console.log(json);
                $mywriteReplyBox.html(replyBoxTmp({"replies":json.comments, "paginate":json.paginate, "empty":json.comments.length==0}));
                setTimeout(function timeChange(){
                $(".time").each(function() {
					
					let rTime = $(this).text(); // 댓글들 각 시간구하기
					
					let urTime = rTime.substring(0,10);
					
					let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
					
					let cTime = ""; // 바뀔 시간

					let nowDate = moment(); // 현재시간

					let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
					let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
					let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

					if (diffHours > 24) {

						cTime = raDate;
						console.log(cTime);

					} else if (diffHours > 0) {

						cTime = diffHours + "시간전";

					} else if (diffMinutes > 0) {

						cTime = diffMinutes + "분 전";

					} else if (diffSeconds >= 0) {

						cTime = "방금 전";

					}
					
					$(this).text(cTime);
				});
					
					
				},0);
            }//success() end
        });//$.ajax() end
    });//$mywriteReplyTab.click() end

    $mywriteCommentTab.on("click",function () {
    	
    	page = 1;

        $communityTabWrapLi.removeClass("community_tab_on");
        $(this).addClass("community_tab_on");

        $mywriteContentBox.css("display", "none");
        $mywriteReplyBox.css("display", "none");
        $mywriteCommentBox.css("display", "block");
        $.ajax({
            url:"/ajax/member/${member.no}/reviews/page/"+page,
            error:function(){
                alert("에러!");
            },
            success:function(json){
            	console.log(json);
                $mywriteCommentBox.html(commentBoxTmp({"comments":json.reviews, "paginate":json.paginate, "empty":json.reviews.length==0}));
                setTimeout(function timeChange(){
                $(".time").each(function() {
					
					let rTime = $(this).text(); // 댓글들 각 시간구하기
					
					let urTime = rTime.substring(0,10);
					
					let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
					
					let cTime = ""; // 바뀔 시간

					let nowDate = moment(); // 현재시간

					let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
					let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
					let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

					if (diffHours > 24) {

						cTime = raDate;
						console.log(cTime);

					} else if (diffHours > 0) {

						cTime = diffHours + "시간전";

					} else if (diffMinutes > 0) {

						cTime = diffMinutes + "분 전";

					} else if (diffSeconds >= 0) {

						cTime = "방금 전";

					}
					
					$(this).text(cTime);
				});
					
					
				},0);
            }//success() end
        });//$.ajax() end
    });//$mywriteCommentTab.click() end
    
    $mywriteContentBox.on("click",".paginate a",function(e) {
		e.preventDefault();
		
		//클릭한 페이지번호
		page = this.dataset.no;
    	
		mywriteContent();
    });
    $mywriteReplyBox.on("click",".paginate a",function(e) {
		e.preventDefault();
		
		//클릭한 페이지번호
		page = this.dataset.no;
    	
		mywriteContent();
    });
    
    $mywriteCommentBox.on("click",".paginate a",function(e) {
		e.preventDefault();
		
		//클릭한 페이지번호
		page = this.dataset.no;
    	
		mywriteContent();
    });

</script>
</body>
</html>