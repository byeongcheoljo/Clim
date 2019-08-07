<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스트리밍 디테일</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="https://releases.flowplayer.org/5.4.6/skin/functional.css">
    <link href="https://vjs.zencdn.net/7.6.0/video-js.css" rel="stylesheet" />
    <script src='https://vjs.zencdn.net/7.6.0/video.js'></script>
   	<link rel="stylesheet" href="/css/streamingDetail.css"/>
</head>


<body>

    <div id="streamingDetailVideoSection">
        <div id="streamingBg">
            <div id="streamingReportPopup">
                <div id="streamingReportName">${leader.nickname } 신고하기</div>
                <button id="streamingCloseBtn"><i class="fas fa-times-circle"></i></button>

                <div id="reportForm">
                    
                    <textarea id="streamingReportContent"></textarea>
                    <button id="streamingReportBtn">신고</button>
                    
                </div>
            </div>
        </div>
        <div id="streamingDetailSlideBar">
            <div>
                <ul id="streamingDetailTopTab">
                    <li class="streamingDetail_tab on">
                        <h3>정보</h3>
                    </li>
                    <li class="streamingDetail_tab">
                        <h3>채팅</h3>
                    </li>
                    <li class="streamingDetail_tab">
                        <h3>끌림들</h3>
                    </li>
                </ul>

            </div>

            <div id="streamingDetailTopWarp">

                <div id="streamingDetailInfo" class="streamingDetail_tab_contents on">
                    <div id="streamingDetailStreamerName"><i class="fas fa-crown"></i>${leader.nickname }</div>
                    <button class="streamingDetail_info_btn" id="streamingDetailSubscribeBtn"><i class="far fa-lightbulb"></i></button>
                    <button class="streamingDetail_info_btn" id="streamingDetailReportBtn"><i class="fas fa-exclamation"></i></button>
                    <div class="streamingDetail_index" id="streamingDetailCumulativeIndex">누적 끌림 지수 : ${leader.acccount }명</div>
                    <div class="streamingDetail_index" id="streamingDetailCurrentIndex">현재 끌림 지수 : ${leader.currcount }명</div>
                    <div id="streamingDetailSubscribeContent">${leader.nickname }님을 구독하셨습니다.</div>

                    <div id="streamingDetailRoomTitle">${leader.title }</div>
                    <input id="streamingDetailTitleSearch" placeholder="입력하는 곳입니당ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ">

                    <div id="streamingDetailTitleList">
                        <ul>
                            <!--  <li><img src="img/movie_image.jpg"> gggg</li>-->

                        </ul>

                    </div>

                    <div id="streamingDetailMovieListContents">
                        <ul id="streamingDetailMovieList">

 						<c:forEach items="${movieLists}" var="climing_movie">
                           <li class="streamingDetail_movie">
                                <div><img src="/poster${climing_movie.poster}">
                                    <span>${climing_movie.title}</span>
                                    <source type="video/mp4" src="/video/loop.mp4" />
                                    <div class="garbage"><input hidden value="${climing_movie.no}"><i class="fas fa-trash-alt"></i></div>
                                </div>
                                <button class="streamingDetail_switch_btn streamingDetail_up_btn"><i class="fas fa-angle-up"></i></button>
                                <button class="streamingDetail_switch_btn streamingDetail_down_btn"><i class="fas fa-angle-down"></i></button>
                            </li>
  						 </c:forEach>
		
                            

                        </ul>

                    </div>

                </div>


                <div id="streamingDetailChat" class="streamingDetail_tab_contents">
                    <div id="streamingDetailChatWrap">
                        <div id="streamingDetailChatList">
                            <ul>
                                <li>
                                    <div class="card_user">
                                        <strong>규밤이</strong>
                                    </div>
                                    <div class="box_chat">
                                        <div class="comments">안녕하세욬ㅋㅋㅋㅋ</div>
                                    </div>
                                    <!--//box_reply-->
                                </li>
                                <li>
                                    <div class="card_user">
                                        <strong>규밤이2</strong>
                                    </div>

                                    <div class="box_chat">
                                        <div class="comments">안녕하세욬ㅋㅋㅋㅋ</div>
                                    </div>
                                    <!--//box_reply-->
                                </li>

                                <li class="mine">
                                    <div class="card_user">

                                    </div>

                                    <div class="box_chat">
                                        <div class="comments mine">안녕하세욬ㅋㅋㅋㅋ</div>
                                    </div>
                                </li>



                            </ul>
                        </div>
                        <!--streamingDetailChatList -->
                    </div>
                    <!--streamingDetailChatWrap -->


                    <div id="streamingDetailInputChatBox">
                        <form id="msgForm">
                            <fieldset>
                                <div id="vote"><i class="fas fa-archive"></i></div>
                                <input id="msgInput" placeholder="내용을 입력해주세요">
                                <div id="emotionBox"> <i class="far fa-times-circle"></i></div>
                                <div id="emotion"><i class="far fa-grin"></i></div>
                                <button id="msgBtn">보내기</button>
                            </fieldset>

                        </form>

                    </div>
                    <!--streamingDetailInputChatBox -->


                </div> <!-- streamingDetailChat -->

                <div id="streamingDetailClim" class="streamingDetail_tab_contents">
                    <div id="streamingDetailClimList">
                        <ul>

                        </ul>
                    </div>
                    <!--streamingDetailClimList -->
                </div> <!-- streamingDetailClim -->

            </div>



            <div class="inequality_btn" id="toggleCloseBtn"> > </div>
        </div>
        <div class="inequality_btn" id="toggleOpenBtn">< </div>

        <video id="my-player" class="video-js">
                  <source type="video/mp4" src="/video/loop.mp4" />
        </video>


        </div>



<script type="text/template" id="movieAddPlayListTmp">

     
<li class="streamingDetail_movie">
                                <div><img src="/poster<@=img@>">
                                    <span><@=title@></span>
                                    <source type="video/mp4" src="/video/loop.mp4" />
                                    <div class="garbage"><i class="fas fa-trash-alt"></i></div>
                                </div>
                                <button class="streamingDetail_switch_btn streamingDetail_up_btn"><i class="fas fa-angle-up"></i></button>
                                <button class="streamingDetail_switch_btn streamingDetail_down_btn"><i class="fas fa-angle-down"></i></button>
                            </li>

</script>

<script type="text/template" id="streamingChatTmp">

            <li class="mine">
        <div class="card_user">
        </div>

        <div class="box_chat">
            <div class="comments mine"><@=chatMsg@></div>
        </div>
    </li>

</script>

<script type="text/template" id="banChatTmp">

            <li class="cmd">
        <span><@=name@>님 강퇴닼ㅋㅋㅋㅋ</span>

    </li>

</script>

<script type="text/template" id="SearchListTmp">
    <@ _.each(json, function(data){ @>

    <li class="movie_title"><img src="/<@=data.poster@>"><span><@=data.title@></span>
	<input id="source" hidden value="<@=data.src@>">
	<input id="no" hidden value="<@=data.no@>">
	
</li>
    <@})@>


</script>

<script type="text/template" id="climListTmp">
    <@ _.each(json, function(name){@>
    <li><@=name.name@> <i class="fas fa-bomb climListDelete"></i></li>
    <@});@>
</script>



<script src="/js/moment-with-locales.js"></script>
        <script>
            moment.locale("ko");
            _.templateSettings = {
                interpolate: /\<\@\=(.+?)\@\>/gim,
                evaluate: /\<\@([\s\S]+?)\@\>/gim,
                escape: /\<\@\-(.+?)\@\>/gim
            };


            let $streamingDetailMovieList = $("#streamingDetailMovieList");
            let $streamingDetailTitleSearch = $("#streamingDetailTitleSearch");
            let movieAddPlayListTmp = _.template($("#movieAddPlayListTmp").html());
            let streamingChatTmp = _.template($("#streamingChatTmp").html());
            let banChatTmp = _.template($("#banChatTmp").html());
            let climListTmp = _.template($("#climListTmp").html());
            let SearchListTmp = _.template($("#SearchListTmp").html());


            let myPlayer = videojs("my-player", {
                "controls": true,
                //스트리머가 아니면 controls : false
                //"autoplay": "false",
                "preload": "auto",
                "poster": "data:image/jpeg;base64,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",
                "loop": "false",
                "width": "780px",
                "height": 600,
                //aspectRatio: "16:9"

            });
            
            //    myPlayer.requestFullScreen();
            videojs("my-player").ready(function() {
                myPlayer.src({
                    type: "video/mp4",
                    src: "/video/loop.mp4"
                });

            });

            let onPlay = function() {
                console.info("on Play");
                $(".vjs-big-play-button").hide();

            };
            myPlayer.on("play", onPlay);

            //슬라이드 바 맨위에 정보 채팅 끌림들 클릭시 ____ 넣기
            $("#streamingDetailTopTab .streamingDetail_tab").click(function(e) {
                e.preventDefault();
                $(".on").removeClass("on");
                $(this).addClass("on");
                let index = $(this).index();
                $(".streamingDetail_tab_contents").eq(index).addClass("on");

            });

            // 슬라이드 옆에 > 토글 버튼 클릭시 슬라이드 none
            $("#toggleCloseBtn").click(function() {

                $("#streamingDetailSlideBar").fadeOut();
                $("#toggleOpenBtn").show();
                $("#my-player").css("width", 1080);

            });

            // < 토클 버튼 클릭시 슬라이드 show
            $("#toggleOpenBtn").click(function() {
                $("#streamingDetailSlideBar").fadeIn();
                $("#toggleOpenBtn").hide();
                $("#my-player").css("width", 780);
            });

            $(".streamingDetail_movie .fa-trash-alt").click(function() {
            	const movie_no=$(this).parent().find('input').val();
            	/*$.ajax({
            		url:"/ajax/delete/ClimingList",
            		data:{}
            	});*/
                $(this).parents("li").remove();
            });

            // 쓰레기통 클릭하면 영화 삭제
            $streamingDetailMovieList.on("click", ".streamingDetail_movie .fa-trash-alt", function() {
            	const movie_no=$(this).parent().find('input').val();
            	alert("하이");
            	$(this).parents("li").remove();
            	return false;
            });

            // 영화 목록에 아래 버튼을 클릭시 스왑
            $streamingDetailMovieList.on("click", ".streamingDetail_down_btn", function() {
                // alert("down button");
                let lastIndex = $streamingDetailMovieList[0].childElementCount - 1;
                let temp = $(this).parents("li");
                console.log(temp);
                let index = $(this).parents("li").index();
                console.log(index);
                if (index == lastIndex) {
                    return false;
                }
                $(this).parents("li").remove();
                $streamingDetailMovieList.children("li").eq(index).after(temp);
                console.log($(this).parents("li").index());
            });

            // 영화 목록에서 윗 버튼을 클릭하면 스왑
            $streamingDetailMovieList.on("click", ".streamingDetail_up_btn", function() {
                // alert("up button");
                let zeroIndex = 0;
                let temp = $(this).parents("li");
                let index = $(this).parents("li").index();

                if (index == zeroIndex) {
                    return false;
                }

                $(this).parents("li").remove();
                $streamingDetailMovieList.children("li").eq(index - 1).before(temp);
                console.log($(this).parents("li").index());

            });

            //신고 하기 버튼 클릭시 팝업
            $("#streamingDetailReportBtn").click(function() {

                $("#streamingBg").show();

            });
            //신고하기 X 버튼 클릭시 팝업창 ㅂㅂ
            $("#streamingCloseBtn").click(function() {
                $("#streamingBg").hide();
            });
            //신고하기 팝업 있을 때 BG 누르면 ㅃㅃ
            $("#streamingBg").click(function() {
                $("#streamingBg").hide();
            });
            //신고하기 팝업창 눌렀을때 popup창 안없어지게
            $("#streamingReportPopup").click(function(e) {

                return false;
            });

            $("#streamingReportBtn").click(function (e) {
            	var room_no =  decodeURIComponent(location.href);
				room_no=room_no.split('room/');
				room_no= room_no[1];
            	var content=$("#streamingReportContent").val()
            	$.ajax({
            		url:'/ajax/report/climer',
            		data:{roomNo:room_no,userNo:2,content:content},
            		
            		error:function(){
            			
            		},
            		success:function(){
            			alert("신고되었습니다.");
            		}

            	});
            	
                e.stopPropagation();
            });



            //채팅 하기
            let chatMsg = "";
            $("#msgForm").on("submit", function(e) {

                e.preventDefault();
                chatMsg = $("#msgInput").val();

                $("#streamingDetailChatList ul").append(streamingChatTmp({
                    "chatMsg": chatMsg
                }));

                $("#msgInput").val(" ");
                $("#msgInput").focus();
                moveScroll()

            });
            
            //move 스클로 모르겠당
            function moveScroll() {
                let height = 10000000000;
                height += $("#streamingDetailChatList li").height();

                //height 증가된만큼 scroll 이동
                $("#streamingDetailChatList ul").scrollTop(height);
                

                }


            //영화 제목을 입력했을 때

            $("#streamingDetailTitleSearch").on("keyup", function() {
                let searchTitle = $streamingDetailTitleSearch.val().trim();
                console.log(searchTitle);

                if (searchTitle.length == 0) {
                    $("#streamingDetailTitleList").hide();
                    $("#streamingDetailTitleList ul").empty();
                    return false;
                }
                $("#streamingDetailTitleList").show();

                $.ajax({
                    url: "/ajax/climingSearch/"+searchTitle,
                    dataType: "json",
                    error: function() {
                        alert("movieList 서버 점검.")
                    },
                    success: function(json) {
                        console.log(json);
                        console.log(json[0].title);
                        
                       $("#streamingDetailTitleList ul").empty();

                        $("#streamingDetailTitleList ul").append(SearchListTmp({

                          "json":json

                        }));


                     /*   $.each(json, function() {
                            if (this.title.includes(searchTitle)) {
                                let $li = $("<li></li>").addClass("movie_title");
                                let $img = $("<img>");

                                $img.attr("src", "img/movie_image.jpg")
                                $li.text(this.title).prepend($img);
                                $("#streamingDetailTitleList ul").append($li);
                            }
                        });*/


                    }
                }) //ajax
            });

            //영화 제목을 검색 후 영화 제목을 클릭하면 리스트에 영화가 자동으로 뜸
            $("#streamingDetailTitleList ul").on("click", ".movie_title", function() {
            	var room_no =  decodeURIComponent(location.href);
				room_no=room_no.split('room/');
				room_no= room_no[1];
				const title=$(this).text();
				const img = $(this).find('img').attr("src");
				const source = $(this).find('#source').val();
				const movie_no=$(this).find('#no').val();
            $.ajax({
            	url:"/ajax/addClimingList",
            	data:{roomNo:room_no,movieNo:movie_no},
            	error:function(){
            		alert("서버점검중");
            	},
            	success:function(){
            		$streamingDetailMovieList.append(movieAddPlayListTmp({
                        "title": title,
                        "img": img,
                        "source":source,
                        "no":movie_no
                    }));

                    $("#streamingDetailTitleList").hide();
                    $("#streamingDetailTitleSearch").val(" ").focus();
                    
            	}
            });
                
            });

            //구독을 눌렀을 때 구독 신청 팝업
            $("#streamingDetailSubscribeBtn").on("click", function() {
                $("#streamingDetailSubscribeContent").fadeIn();
                $("#streamingDetailSubscribeBtn").css("color", "red");
                setTimeout(function() {
                    $("#streamingDetailSubscribeContent").fadeOut();
                }, 1000);

            });

            //끌리머 목록에서 시청자 삭제버튼 눌렀을때  끌리머 목록에서 삭제 후 채팅창에 강퇴 메세지
            $("#streamingDetailClimList ul").on("click", ".climListDelete", function() {
                //       alert($(this).parent().text())
                $(this).parent("li").remove();

                $("#streamingDetailChatList ul").append(banChatTmp({
                    name: $(this).parent().text()
                }))
               
            });


            //채팅 입력창 옆에 이모티콘 아이콘 클릭했을 때
            $("#emotion").click(function() {

                $("#emotionBox").show();

            });

            $("#emotionBox i").click(function() {
                $("#emotionBox").hide();
            });


            //끌리미들 목록
            /*function climList() {
                $.ajax({
                    url: "/ajax/climList.json",
                    dataType: "json",
                    error: function() {
                        alert("ㅇㅇㅇ 서버 점검.")
                    },
                    success: function(json) {
                        console.log(json);

                        $("#streamingDetailClimList ul").append(climListTmp({
                            json: json
                        }))
                    }
                });
            }
            climList();*/
            
            
            $("#streamingReportBtn").submit(function(){
                alert("Test");
                
            })
            
            
            // 관리자가 스트리밍 무비 리스트를 클릭하면 
            // 클릭 된 영화 재생
            $("#streamingDetailMovieList").on("click"," .streamingDetail_movie div",function(){
             
                console.log($(this).find("source").attr("src"));
                
                $("#my-player_html5_api").attr("src",$(this).find("source").attr("src"));
                //$("#my-player_html5_api").attr("src","/video/loop.mp4");
                                                 
             });
 
        </script>
</body>
</html>