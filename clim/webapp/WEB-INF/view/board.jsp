<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Clim | 자유1게시판</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/paginate.css">
<link rel="stylesheet" href="/css/quill.snow.css">
<link rel="canonical" href="https://quilljs.com/standalone/full/3_full.html">
<link type="application/atom+xml" rel="alternate" href="https://quilljs.com/feed.xml" title="Quill - Your powerful rich text editor" />
<link rel="stylesheet" href="/css/boardForm.css">
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<main>
	<div id="boardSection">
		<div id="boardBg">
			<div id="searchWrap">
				<input class="search_write_input" name="searchContents" type="text"
					placeholder="글내용,#태그,@작성자 검색">
				<button class="fas fa-search search_write_btn pointer_common"
					type="button"></button>
			</div>

			<div id="boardWriteWrap">
				<button id="boardWriteBtn">글쓰기</button>

			</div>
			<!--//boardWriteBtn-->

			<div id="boardWrap"></div>
			<!--//boardWrap-->

			<div id="topClickBox">
				<a class="arrow_click_btn fas fa-arrow-up"></a>
			</div>
		</div>
		<!--//boardSection-->
		<div id="boardPopupBg"></div>

		<div id="boardPopupBox">

			<!-- 여기에 템플릿 들어감 -->

		</div>
		<!--//boardPopupBox-->



		<div id="boardForm">
			<h2>글입력</h2>
			<i id="closePopupWriteForm" class="fas fa-times-circle"></i>
			<form action="/boardWrite" id="boardWriteForm" method="post">
				<input type="hidden" name="memberNo" value="${loginMember.no}">
				<input type="hidden" id="contents" name="contents"
					value="${board.contents}">

				<fieldset>
					<div id="standalone-container">
						<div id="toolbar-container">
							<span class="ql-formats"> <select class="ql-font">
									<!-- 2) 필요한 폰트를 option으로 마크업 -->
									<option value="">기본</option>
									<option value="nanumPen">나눔펜</option>
									<option value="yeonSung">연성체</option>
									<option value="poorStory">가난한이야기체</option>
									<option value="jua">주아체</option>
							</select> <select class="ql-size">
									<option>20px</option>
									<option>28px</option>
									<option>36px</option>
									<option>48px</option>
							</select>
							</span> <span class="ql-formats">
								<button class="ql-bold"></button>
								<button class="ql-italic"></button>
								<button class="ql-underline"></button>
								<button class="ql-strike"></button>
							</span> <span class="ql-formats"> <select class="ql-color"></select>
								<select class="ql-background"></select>
							</span> <span class="ql-formats">
								<button class="ql-list" value="ordered"></button>
								<button class="ql-list" value="bullet"></button>
								<button class="ql-indent" value="-1"></button>
								<button class="ql-indent" value="+1"></button>
							</span> <span class="ql-formats">
								<button class="ql-link"></button>
								<button class="ql-image"></button>
								<button class="ql-video"></button>
							</span>
						</div>
						<div id="editor-container"></div>
					</div>
					<button id="boardFormBtn">등록</button>
				</fieldset>
			</form>

			<input class="screen_out" type="file" name="uploadImg" id="upload" />
		</div>



	</div>




	</main>
	<c:import url="/WEB-INF/template/footer.jsp" />
	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/quill.min.js"></script>



	<!--boardTmp (보드 리스트 불러오기)-->
	<script type="text/template" id="boardTmp">

    <@ _.each(boards,function(board){ @>

    <div data-boardno = "<@=board.no@>" data-memberNo="<@=board.memberNo@>" class="post_view_box">
        <div class="post_view_top">
            <a class="post_view_nickname pointer_common" href=""><@=board.nickname@></a>
            <span class="post_view_data"><@=moment(board.regdate).format("YYYY년 MM월 DD일 HH시 mm분")@></span>
        </div>

        <div class="post_view_tags">
            <ul>
                <@ _.each(board.boardTags,function(boardTag){@>
                <li class="post_view_tag">
					#<@=boardTag.tagName@>
				</li>
                <@})@>
            </ul>
        </div>
        <div class="post_view_contents">

			<@=board.contents@>

		</div>
        <div class="post_view_bottom">
            <button class="post_view_like">
                <div class="like_view_icon far fa-thumbs-up pointer_common"></div>
                <span class="like_view_count fontsize_common"><@=board.likeCount@></span>
            </button>
            <div class="post_view_comments">
                <div class="comment_view_icon far fa-comments pointer_common"></div>
                <span class="comment_view_count fontsize_common"><@=board.commentCount@></span>
            </div>
            <div class="post_view_click">
                <div class="click_view_icon fas fa-eye"><@=board.views@></div>
				<%-- 좋아요
                <span class="click_view_count fontsize_common"><@=board.click@></span>
                --%>
            </div>
        </div>
    </div><!--//post_view_box-->
    <@ })@>
</script>

	<!--boardSearchTmp (보드 리스트 검색 불러오기)-->
	<script type="text/template" id="boardSearchTmp">
    <@ _.each(boardSearchs,function(boardSearch){ @>

    <div data-boardno = "<@=boardSearch.no@>" data-memberNo="<@=boardSearch.memberNo@>" class="post_view_box">
        <div class="post_view_top">
            <a class="post_view_nickname pointer_common" href=""><@=boardSearch.nickname@></a>
            <span class="post_view_data"><@=moment(boardSearch.regdate).format("YYYY년 MM월 DD일 HH시 mm분")@></span>
        </div>

        <div class="post_view_tags">
            <ul>
                <@ _.each(boardSearch.boardTags,function(boardSearchTag){@>
                <li class="post_view_tag">#<@=boardSearchTag.tagName@> </li>
                <@})@>
            </ul>
        </div>
        <div class="post_view_contents"><@=boardSearch.contents@></div>
        <div class="post_view_bottom">
            <button class="post_view_like">
                <div class="like_view_icon far fa-thumbs-up pointer_common"></div>
                <span class="like_view_count fontsize_common"><@=boardSearch.likeCount@></span>
            </button>
            <div class="post_view_comments">
                <div class="comment_view_icon far fa-comments pointer_common"></div>
                <span class="comment_view_count fontsize_common"><@=boardSearch.commentCount@></span>
            </div>
            <div class="post_view_click">
                <div class="click_view_icon fas fa-eye"><@=boardSearch.views@></div>
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
            <sapn class="post_popup_data">
			<@=moment(boardDetail.regdate).format("YYYY년 MM월 DD일 HH시 mm분")@></sapn>
			
			<@if(${loginMember!=null&&loginMember.no>0?loginMember.no:-1}==boardDetail.memberNo){@>
            <form id="boardUpdateForm" action="/writeUpdate/<@=boardDetail.no@>", method="get">
                <%--<button class="post_update_btn">수정</button>
				<input type="hidden" value="<@=boardDetail.no@>">--%>
            </form>
            <form id="deleteBoard">
                <button form="deleteBoard" class="post_delete_btn">삭제</button>
				<input type="hidden" value="<@=boardDetail.no@>">	
            </form>
			<@}@>
            <div class="post_popup_click">
                <span class="click_popup_count fontsize_common">· 조회수 <@=boardDetail.views@></span>
            </div>
            <img class="post_popup_siren_icon" src="/img/siren_icon.png">
        </div>
        <div class="post_popup_tags">
			<%--
            <ul>
                <@ _.each(boardDetail.tags,function(tag){ @>
                <li class="post_popup_tag"><a href="">#<@=tag@></a></li>
                <@})@>
            </ul>
            --%>
        </div>

        <div class="post_popup_contents"><@=boardDetail.contents@>
        </div>

        <div class="post_popup_bottom">
            <button class="post_popup_like <@if(boardDetail.likeCheck == true){@>like_btn<@}@>">
                <div class="post_popup_icon far fa-thumbs-up pointer_common"></div>
                <span class="post_popup_count num_like"><@=boardDetail.likeCount@></span>
            </button>

        </div>
        <div class="post_popup_write_form">
            <form id="boardReplyWeiteForm">
                <div id="commentWriteInputForm">
                    <input class="comment_write_input" name="" type="text" placeholder="댓글을 남겨주세요.">
                </div>
                <button class="comment_write_btn">등록</button>
            </form>
        </div>

        <div class="post_popup_comments">


            <ul><%-- 댓글템플릿 --%>
        	<@_.each(comments,function(comment){ @>
        	<li class="post_popup_comment" data-postno=<@=comment.no@> >
           		<div class="comment_popup_top">
             	   <a class="comment_popup_nickname" href=""><@=comment.nickname@></a>
              	  <span class="comment_popup_data"><@=moment(comment.regdate).format("YYYY년 MM월 DD일 HH시 mm분")@></span>
            	</div>
            <div class="comment_popup_content"><@=comment.contents@></div>
            <div class="comment_popup_bottom">
                <button class="comment_popup_like <@if(comment.likeCommentCheck == true){@>like_btn<@}@>" data-postno="<@=comment.no@>">
                    <div class="comment_popup_icon far fa-thumbs-up pointer_common"></div>
                    <span class="comment_popup_count num_like"><@=comment.commentLikeCount@></span>
                </button>
            </div>
        	</li>
        	<@})@>
            </ul>
            <div class="comment_paginate_box">
				<span><@=paginate@></span>
            </div>
        </div>

        <div id="reportPopupWrap">
            <form id="reportForm">
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

	<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    //게시판 글
    const boardTmp = _.template($("#boardTmp").html());
    const boardSearchTmp = _.template($("#boardSearchTmp").html());
    //게시글 댓글 데티일
    const boardDetailTmp = _.template($("#boardDetailTmp").html());
    let page = 1;
    let replyPage = 1;
	let numPage = 5;
    //ajax를 여러번 호출하는 것을 막는 변수
    let flag = true;

    function getBoardList(){
    	//console.log("zzz");
		
        if(true){
            //바로 flag를 false로
            flag = false;
            const $boardLoader = $("<div class='board_loader'>");
            $("#boardWrap").append($boardLoader);
            $.ajax({
                url:"/ajax/boardList/"+page++,
                dataType:"json",
                error:function(){
                    alert("board ajax 에러, board ajax를 확인하세요.");
                },
                success:function (json) {
          			//console.log("성공");
                    //console.log(json.boards);
                    //console.log(json.boards.no);
                    console.log(json);
                    $boardLoader.remove();
                    $("#boardWrap").append(boardTmp({"boards":json.boards}));
                    //완료후 다시 flag를 true로
                    flag = true;
                }//success end
            });//$.ajax() end
        }//if end
    }//getBoardList() end
    
    //게시글 번호
   	let boardNo;
    //멤버번호
    let memberNo;
    //댓글번호
    let postNo;
    //게시글 디테일 불러오기
    $("#boardWrap").on("click",".post_view_box",function () {
    	boardNo = this.dataset.boardno;
    	memberNo = this.dataset.memberno;
    	let idx = $(this).index();
    	console.log("a:"+idx);
    	<c:choose>
		<c:when test="${loginMember ==null }">
		alert("로그인 해주세요");
		return;
		</c:when>
		<c:otherwise>
		$("#boardPopupBg").fadeIn(100);
	    $("#boardPopupBox").fadeIn(100);
    	boardDetail(idx);
		</c:otherwise>
    	</c:choose>

    });	

    
    
    
    function boardDetail(idx){
    	console.log("b:"+idx);
         $.ajax({
             url:"/ajax/boardDetail/"+boardNo+"/page/"+replyPage,
             dataType:"json",
             data:{
             	no:boardNo
             },
             error: function (xhr,error,code) {
 				alert(error);
 			},
             success:function(json){
                 //console.log(json);
                 console.log("c:"+idx);
                 $("#boardPopupBox").attr("data-idx",idx).html(boardDetailTmp({"boardDetail":json.boardDetail, "comments":json.comments, "paginate":json.paginate}));
             }
         });
	}//boardDetail() end
	
	
	//게시판 댓글 추가
	$("#boardPopupBox").on("submit","#boardReplyWeiteForm",function(e){
		e.preventDefault();
		const commentContent = $(".comment_write_input").val();
		<c:choose>
		<c:when test="${loginMember ==null }">
		alert("로그인 해주세요");
		</c:when>
		<c:otherwise>
		$.ajax({
	    	url:"/ajax/commentWrite",
	    	type:"post",
	    	data:{
	    		memberNo:${loginMember.no},
				contents : commentContent,
				boardNo : boardNo
	    	},
	    	error:function(){
	    		alert("댓글추가 에러");
	    	},
	    	success:function(){
	    		replyPage = 1;
	    		boardDetail();
			    getBoardList();
	    	}
	    });	//ajax() end
		</c:otherwise>
		</c:choose>

	});// boardReplyWeiteForm.submit() end
    
	
	//게시판 신고하기
	$("#boardPopupBox").on("submit","#reportForm", function(e){
		e.preventDefault();
		const contents = $("#reportContentInput").val();
		<c:choose>
		<c:when test="${loginMember ==null }">
		alert("로그인 해주세요");
		</c:when>
		<c:otherwise>
		$.ajax({
			url:"/ajax/boardDetail/reportWrite",
			type:"post",
			data:{
	    		no:${loginMember.no},
				reporteredNo:memberNo,
				boardNo:boardNo,
				contents:contents
			},
			error:function(){
				alert("자유게시판 신고하기 에러");
			},
			success:function(){
				alert("신고가 완료 되었습니다.");
		        $("#reportPopupWrap").css("display","none");
			}
		})//ajax end
		</c:otherwise>
		</c:choose>
		
	});
	
	//게시글 삭제하기
	$("#boardPopupBox").on("click",".post_delete_btn",function(e){
		e.preventDefault();
		
		var idx = $("#boardPopupBox").get(0).dataset.idx;
		
		console.log("d:"+idx);
		
		//const commentContent = $(".comment_write_input").val();
		console.log("게시판 댓글 삭제1"+boardNo);

		$.ajax({
	    	url:"/ajax/deleteBoard",
	    	data:JSON.stringify({
	    		no:boardNo,
	    	}),
	    	type:"DELETE",
	    	error:function(){
	    		alert("게시글삭제 에러");
	    	},
	    	headers:{'Content-Type': 'application/json'},
	    	success:function(){
	            $("#boardPopupBox").fadeOut(100);
	            $("#boardPopupBg").fadeOut(100);
	           ////// $("#boardWrap").empty();
	            
	            $(".post_view_box").eq(idx).remove();
	            
	            //console.log( $that.parents(".post_view_box"));
	           // page=1;
	            //getBoardList();
	    	}
	    });	//ajax() end
	});// boardReplyWeiteForm.submit() end

    /*무한스크롤링*/
    let $window = $(window);
    let $document = $(document);


    $(window).scroll(function () {
        let sTop = $window.scrollTop();
        let $dHeight = $document.height();
        let $wHeight = $window.height();

        if($dHeight<=$wHeight+sTop+30){
            getBoardList();
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
    //$("#boardWrap").on("click",".post_view_box",function(){
    //    $("#boardPopupBg").fadeIn(100);
     //   $("#boardPopupBox").fadeIn(100);
    //});
    
    //댓글 아이콘 클릭시 팝업창(게시글) 켜기
    $("#boardWrap").on("click",".post_view_comments",function () {
        $("#boardPopupBg").fadeIn(100);
        $("#boardPopupBox").fadeIn(100);
    });

    //팝업창(게시글) 끄기
    $("#boardPopupBg").click(function () {
        $("#boardPopupBox").fadeOut(100);
        $("#boardPopupBg").fadeOut(100);
        getBoardList();
    });
    
    //글 수정 버튼
    $("#boardPopupBox").on("click","#boardUpdateForm",function(e){
        e.stopPropagation();
    	$("#boardForm").css("display","block");
        $("#boardPopupBg").fadeOut(100);
        $("#boardPopupBox").fadeOut(100);
        return false;
    });

    //좋아요 버튼
    $(".post_popup_like").click(function () {
        $(".post_popup_icon").toggleClass("post_popup_icon_on");
    })

    //신고하기 팝업
    $("#boardPopupBox").on("click",".post_popup_siren_icon",function(){
    	$("#reportPopupWrap").css("display","block");
    });

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
    
    //댓글 페이즈 네이트 얻어오기
    $("#boardPopupBox").on("click",".paginate a",function(e){
    	e.preventDefault();
    	replyPage = this.dataset.no;
    	boardDetail();
    });

	//글작성 버튼 클릭시 팝업
	$("#boardWriteBtn").click(function () {
		<c:choose>
		<c:when test="${loginMember ==null }">
		alert("로그인 해주세요");
		</c:when>
		<c:otherwise>
	    $("#boardPopupBg").css("display","block");
	    $("#boardForm").css("display","block");
		</c:otherwise>
		</c:choose>
	});
	
	//bg 클릭시 팝업꺼짐
	$("#boardPopupBg").click(function () {
	    $("#boardPopupBg").css("display","none");
	    $("#boardForm").css("display","none");
	    getBoardList();
	});

	//창닫기 버튼 클릭시 팝업 끄기
	$("#closePopupWriteForm").click(function () {
		$("#boardPopupBg").css("display","none");
	    $("#boardForm").css("display","none");
	    getBoardList();
	});
    

	const $upload = $("#upload");
	const fileTypeExp = /^image\//;
	const $contents = $("#contents");
	$("#boardWriteForm").submit(function() {
		const contents = $(".ql-editor").html();
		if (contents.length == 0) {
			alert("내용을 입력하세요.");
			return false;
		}
		$contents.val(contents);
		return true;
	});//submit() end

	var quill = new Quill('#editor-container', {
	    modules: {
	      toolbar: {
	    	  container:'#toolbar-container',
	        //이미지 선택시 파일 업로드를 위해서
	        handlers: {
	          'image': selectLocalImage
	        }
	      }
	    },
	    theme: 'snow'
	  });


	function selectLocalImage() {
		$upload.click();
		$upload.on("change",function() {
			const file = $upload.get(0).files[0];
			console.log(file);
			if (file.size == 0) {
				alert("제대로 된 파일을 선택해주세요.");
				return;
			}//if end
			console.log(fileTypeExp.test(file.type));
			if (!fileTypeExp.test(file.type)) {
				alert("이미지만 선택해주세요.");
				return;
			}//if end
			//alert("여기에 오면 파일이 있고 사진임");
			const formData = new FormData();
			formData.append("uploadImg", file, file.name);
			formData.append("type", "B");//B는 board의 줄임말
			$.ajax({
				url : "/ajax/upload",
				processData : false,
				contentType : false,
				enctype:'multipart/form-data',
				data : formData,
				type : 'POST',
				dataType : "json",
				error : function(xhr, error, code) {
					alert("에러이미지:" + code);
				},
				success : function(result) {
					console.log(result.src);
				 const range = quill.getSelection();
		            console.log(range);
		            let idx = 0;
		            if(range!=null) {
		              idx = range.index;
		            }
		            quill.insertEmbed(idx, 'image', "/upload/"+result.src);
					$("<input type='hidden' name='uploadImg'>").val(result.src)
							.appendTo("#boardWriteForm");
				}//success end
			});//ajax end
		});//change end
	  }//selectLocalImage() end
	  
	  //Font에 대한 설정을 불러와서
	  const Font = Quill.import('formats/font');
	  //우리가 필요한 폰트를 넣고
	  Font.whitelist = ['nanumPen','yeonSung','poorStory','jua'];
	  //다시 등록
	  Quill.register(Font, true);

	  var Size = Quill.import('attributors/style/size');
	  Size.whitelist = ['20px', '28px', '36px','48px'];
	  Quill.register(Size, true);
	  

	  //게시글 좋아용
	  $("#boardPopupBox").on("click", ".post_popup_like", function(){
			<c:choose>
			<c:when test="${loginMember ==null }">
			alert("로그인해주세요");
			</c:when>
			<c:otherwise>
			$.ajax({
		      	url:"/ajax/boardLike",
		      	type:"post",
		      	dataType:"json",
		      	data:{
		    		memberNo:${loginMember.no},
		  			boardNo : boardNo
		      	},
		      	error:function(){
		      		alert("게시글좋아요 에러");
		      	},
		      	success:function(json){
		      		console.log(json);
		      		count=json.count;
					if(json.count==1) {
						$(".post_popup_like").removeClass("like_btn");
						alert("좋아요가 삭제되었습니다");
					}else {
						$(".post_popup_like").addClass("like_btn");
					}//if else end
					$(".num_like").text(json.likeTotal);
		      	}
		      });	//ajax() end
		</c:otherwise>
		</c:choose>
	  });

	  
		//댓글 좋아용
	  $("#boardPopupBox").on("click", ".comment_popup_like", function(){
		postNo = this.dataset.postno;
		$likeBtn = $(this);
		console.log($(this).attr('data-postno'));
		<c:choose>
		<c:when test="${loginMember ==null }">
		alert("로그인 해주세요");
		</c:when>
		<c:otherwise>
		$.ajax({
	      	url:"/ajax/boardCommentLikeUp",
	      	type:"post",
	      	dataType:"json",
	      	data:{
	    		memberNo:${loginMember.no},
	  			postNo : $(this).attr('data-postno')
	      	},
	      	error:function(){
	      		console.log(postNo);
	      		alert("댓글좋아용 에러");
	      	},
	      	success:function(json){
	      		console.log(json);
	      		count=json.count;
				if(json.count==1) {
					$likeBtn.removeClass("like_btn");
					alert("좋아요가 삭제되었습니다");
				}else {
					$likeBtn.addClass("like_btn");
				}//if else end
				$likeBtn.find('span').text(json.likeCommentTotal);
	      	}
	      });	//ajax() end
			</c:otherwise>
			</c:choose>
	  });
		
		
      $(".search_write_input").on("keyup",function(){
      	let searchContents = $(".search_write_input").val().trim();
		if(searchContents.length == 0){
			$("#boardWrap").empty();
			page=1;
		    getBoardList();
			
		    //console.log(searchContents+"++");
		}else{
			//console.log(searchContents+"+");
			//boardTmp.empty();
			$.ajax({
	      		url:"/ajax/boardSearch",
	      		dataType:"json",
	      		data:{
	      			contents:searchContents
	      		},
	      		error:function(){
	      			alert("게시글찾기에러");
	      		},
	      		success:function(json){
	      			//console.log(json+"asdasdasd");
	      			console.log(json);
	      			$("#boardWrap").html(boardSearchTmp({"boardSearchs":json.boardSearch}));
	      		}
	      	}); //ajax end
		}//else end
      }); // 검색 end
	
    	//최초 한 번 호출
    	getBoardList();
		//boardDetail();

</script>

</body>
</html>