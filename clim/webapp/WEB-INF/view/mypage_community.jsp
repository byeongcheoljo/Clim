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
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main id="main">
	<div id="tabSectionUserPage">
        <ul id="headerNavMypage">
            <li id="nicknameHeaderMypage">닉네임</li>
            <li class="header_myPage_tabbed">홈</li>
            <li>찜</li>
            <li>커뮤니티</li>
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
    <@ _.each(contents, function(content){@>
    <li class="mypage_community_card">
        <div class="content_num"><@=content.no@></div>
        <div class="content_tit"><@=content.tit@></div>
        <div class="content_date"><@=content.date@></div>
    </li>
    <@ }) @>
    <div class="paginate">페 이 지 네 이 트</div>
</script>
<script type="text/template" id="replyBoxTmp">
    <@ _.each(replies, function(reply){
    let replyContent = reply.tit;
    if(replyContent.length>33){
        replyContent = reply.tit.substring(0,32)+"…";
    }
    @>
    <li class="mypage_community_card">
        <div class="content_tit"><@=replyContent@></div>
        <div class="content_date"><@=reply.date@></div>
    </li>
    <@ }) @>
    <div class="paginate">페 이 지 네 이 트</div>
</script>
<script type="text/template" id="commentBoxTmp">
    <@ _.each(comments, function(comment){
    let commentContent = comment.tit;
    if(commentContent.length>33){
    commentContent = comment.tit.substring(0,32)+"…";
    }@>
    <li class="mypage_community_card">
        <div class="content_tit"><@=commentContent@></div>
        <div class="contnet_movie"><@=comment.movie@></div>
        <div class="content_date"><@=comment.date@></div>
    </li>
    <@ }) @>
    <div class="paginate">페 이 지 네 이 트</div>
</script>
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
            url: "ajax/member/{memberNo}/boards/page/"+page,
            error: function () {
                alert("에러!");
            },
            success: function (json) {
                $mywriteContentBox.html(contentBoxTmp({"contents": json}));
            }//success() end
        });//$.ajax() end
    }
    mywriteContent();
    
    $mywriteContentTab.on("click",function(){
    	
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
            url:"ajax/member/{memberNo}/boards/page/"+page,
            error:function(){
                alert("에러!");
            },
            success:function(json){
                $mywriteReplyBox.html(replyBoxTmp({"replies":json}));
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
            url:"ajax/member/{memberNo}/boards/page/"+page,
            error:function(){
                alert("에러!");
            },
            success:function(json){
                $mywriteCommentBox.html(commentBoxTmp({"comments":json}));
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