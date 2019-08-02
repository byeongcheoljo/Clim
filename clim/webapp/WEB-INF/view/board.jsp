<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Clim | 자유게시판</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/board.css">
  </head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
    <main>
            <div id="boardSection">
                <div id="boardBg">
                <div id="searchWrap">
                    <form action="" method="">
                            <input class="search_write_input" name="" type="text" placeholder="글내용,#태그,@작성자 검색">
                            <button class="fas fa-search search_write_btn pointer_common" type="submit"></button>
                    </form>
                </div>
                <div id="boardWriteWrap">
                    <form action="" method="">
                        <button id="boardWriteBtn">글쓰기</button>
                    </form>
                </div><!--//boardWriteBtn-->
                <div id="boardWrap">
                </div><!--//boardWrap-->
                <div id="topClickBox">
                    <a class="arrow_click_btn fas fa-arrow-up"></a>
                </div>
                </div><!--//boardBg-->
            </div><!--//boardSection-->
        <div id="boardPopupBg"></div>


        <div id="boardPopupBox">
        </div><!--//boardPopupBox-->

    </main>
<c:import url="/WEB-INF/template/footer.jsp"/>
<!--boardTmp (보드 리스트 불러오기)-->
<script type="text/template" id="boardTmp">
    <@ _.each(boards,function(board){ @>
    <div class="post_view_box">

        <div class="post_view_top">
            <a class="post_view_nickname pointer_common" href=""><@=board.nickname@></a>
            <span class="post_view_data"><@=board.view@></span>
        </div>

        <div class="post_view_tags">
            <ul>
				<%--
                <@ _.each(post.tags,function(tag){@>
                <li class="post_view_tag"><a href="">#<@=tag@></a></li>
                <@})@>
                --%>
            </ul>
        </div>

        <div class="post_view_contents"><@=board.contents@></div>

        <div class="post_view_bottom">
            <button class="post_view_like">
                <div class="like_view_icon far fa-thumbs-up pointer_common"></div>
                <span class="like_view_count fontsize_common"><@=board.like@></span>
            </button>

            <div class="post_view_comments">
                <div class="comment_view_icon far fa-comments pointer_common"></div>
                <span class="comment_view_count fontsize_common"><@=board.comment@></span>
            </div>

            <div class="post_view_click">
                <div class="click_view_icon fas fa-eye"></div>
				<%-- 좋아요
                <span class="click_view_count fontsize_common"><@=board.click@></span>
                --%>
            </div>
        </div>
    </div><!--//post_view_box-->
    <@ })@>
</script>

<!--boardDetailTmp 게시글 하나 누르면 뜨는 템플릿-->
<script type="text/template" id="boardDetailTmp">

        <div class="post_popup_top">
            <a class="post_popup_nickname pointer_common" href=""><@=boardDetail.nickname@></a>
            <sapn class="post_popup_data"><@=boardDetail.data@></sapn>

            <form action="" method="">
                <button class="post_update_btn">수정</button>
            </form>

            <form action="" method="">
                <button class="post_delete_btn">삭제</button>
            </form>



            <div class="post_popup_click">
                <span class="click_popup_count fontsize_common">· 조회수 <@=boardDetail.click@></span>
            </div>

            <img data-postno="1" class="post_popup_siren_icon" src="/img/siren_icon.png">
        </div>

        <div class="post_popup_tags">
            <ul>
                <@ _.each(boardDetail.tags,function(tag){ @>
                <li class="post_popup_tag"><a href="">#<@=tag@></a></li>
                <@})@>
            </ul>
        </div>

        <div class="post_popup_contents"><@=boardDetail.contents@>
        </div>

        <div class="post_popup_bottom">
            <button class="post_popup_like">
                <div class="post_popup_icon far fa-thumbs-up pointer_common"></div>
                <span class="post_popup_count"><@=boardDetail.like@></span>
            </button>

        </div>
        <div class="post_popup_write_form">
            <form action="" method="">
                <div id="commentWriteInputForm">
                    <input class="comment_write_input" name="" type="text" placeholder="댓글을 남겨주세요.">
                </div>
                <button class="comment_write_btn">등록</button>
            </form>
        </div>


        <div class="post_popup_comments">
            <ul>
            </ul>
            <div class="comment_paginate_box">
                <span>Paginate 자리</span>
            </div>
        </div>

        <div id="reportPopupWrap">
            <form id="reportForm" action="" method="">
                <div class="report_popup_top">신고하기</div>
                <div class="report_popup_content">
                    <ul>
                        <li>
                            <span class="content_report_common"><label for="reportContentInput">신고 내용</label></span>
                            <textarea id="reportContentInput" placeholder="글자수는 300자로 제한됩니다."></textarea>
                            <span id="reportContentCounter">(0 / 최대 300자)</span>
                        </li>

                    </ul>
                </div>

                <div class="report_popup_bottom">
                    <button class="report_write_btn">신고접수</button>
                </div>
            </form>
        </div>
</script>




<!--commentTmp 댓글 템플릿-->
<script type="text/template" id="commentTmp">
        <@_.each(comments,function(comment){ @>
        <li class="post_popup_comment">
            <div class="comment_popup_top">
                <a class="comment_popup_nickname" href=""><@=comment.nickname@></a>
                <span class="comment_popup_data"><@=comment.data@></span>

            </div>
            <div class="comment_popup_content"><@=comment.contents@></div>
            <div class="comment_popup_bottom">
                <button class="comment_popup_like">
                    <div class="comment_popup_icon far fa-thumbs-up pointer_common"></div>
                    <span class="comment_popup_count"><@=comment.like@></span>
                </button>
            </div>
        </li>
        <@})@>
</script>


<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    //게시판 글
    const boardTmp = _.template($("#boardTmp").html());
    //게시글 디테일
    const boardDetailTmp = _.template($("#boardDetailTmp").html());
    //댓글
    const commentTmp = _.template($("#commentTmp").html());


    let page =1;

    //ajax를 여러번 호출하는 것을 막는 변수
    let flag = true;

    function getBoardList(){
        if(true){
            //바로 flag를 false로
            flag = false;
            const $boardLoader = $("<div class='board_loader'>");
            $("#boardWrap").append($boardLoader);
            $.ajax({
                url:"/ajax/boardList/"+page,
                dataType:"json",
                error:function(){
                    alert("board ajax 에러, board ajax를 확인하세요.");
                },
                success:function (json) {
                    console.log(json);
                    $boardLoader.remove();
                    $("#boardWrap").append(boardTmp({"boards":json}));
                    //완료후 다시 flag를 true로
                    flag = true;
                }//success end
            });//$.ajax() end
        }//if end
    }//getBoardList() end

    //댓글 불러오기
    function getCommentList() {
        let $postPopupCommentsUl= $(".post_popup_comments ul");
        $.ajax({
            url:"/ajax/comment.json",
            dataType:"json",
            error:function () {
              alert("comment ajax 오류입니다.");
            },
            success:function (json) {
                console.log(json);
                $postPopupCommentsUl.append(commentTmp({"comments":json}));
            }
        })//$.ajax end
    }

    //게시글 디테일 불러오기
    /*
    $("#boardWrap").on("click",".post_view_box",function () {
        $("#boardPopupBg").fadeIn(100);
        $.ajax({
            url:"/ajax/board.json",
            dataType:"json",
            error:function(){

            },
            success:function(json){
                console.log(json);
                console.log(json.contents);
                $("#boardPopupBox").html(boardDetailTmp({"boardDetail":json}));
            }
        });
    });
    */


    //최초 한 번 호출
    getBoardList();
    //getCommentList();


    /*무한스크롤링*/
    let $window = $(window);
    let $document = $(document);

    $(window).scroll(function () {
        let sTop = $window.scrollTop();
        let $dHeight = $document.height();
        let $wHeight = $window.height();

        if($dHeight<=$wHeight+sTop+30){

            //getBoardList();
        }//if end
    });//scroll() end

    //스크롤 내려가면 topClickBox 생김
    $(window).scroll(function () {
        if($(this).scrollTop() > 50){
            $("#topClickBox").fadeIn();
        }else{
            $("#topClickBox").fadeOut();
        }
    })
    //topClickBox 누르면 맨 위로 올라감
    $("#topClickBox").click(function () {
        $('html,body').animate({scrollTop:0},400);
        return false;
    })

    //내용 클릭시 팝업창(게시글) 켜기
    $("#boardWrap").on("click",".post_view_contents",function(){
        $("#boardPopupBg").fadeIn(100);
        $("#boardPopupBox").fadeIn(100);
    })
    //댓글 아이콘 클릭시 팝업창(게시글) 켜기
    $("#boardWrap").on("click",".post_view_comments",function () {
        $("#boardPopupBg").fadeIn(100);
        $("#boardPopupBox").fadeIn(100);
    })


    //팝업창(게시글) 끄기
    $("#boardPopupBg").click(function () {
        $("#boardPopupBox").fadeOut(100);
        $("#boardPopupBg").fadeOut(100);
    });

    //좋아요 버튼
    $(".post_popup_like").click(function () {
        $(".post_popup_icon").toggleClass("post_popup_icon_on");
    })

    //신고버튼 눌렀을때 게시글의 No를 받아서 쓰기위해서 #reportForm 게시글No가 필요합니다.
    let postNo;
    //신고하기 누르면 팝업창
    $("#boardPopupBox").on("click",".post_popup_siren_icon",function () {
        postNo = this.dataset.postno;
        $("#reportPopupWrap").css("display","block");

    })

    //신고버튼을 누르면
    $("#reportForm").submit(function (e) {
        e.preventDefault();
        const reportContent = $("#reportContentInput").val();
        //ajax로 넘기면 됩니다

        //1.유저번호와 2.게시글(postNo) 3.신고내용 3개 필요


    })

    //신고하기에서 textarea 실시간 카운팅
    $("#reportContentInput").keyup(function (e){
        var content = $(this).val();
        $('#reportContentCounter').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅

        if (content.length > 300){
            alert("최대 300자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 300));
            $("#reportContentCounter").html("(300 / 최대 300자)");
        }
    });




</script>
</body>
</html>