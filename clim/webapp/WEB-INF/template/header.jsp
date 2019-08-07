<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
    <a href=""><img class="header_index_nav" src="/img/clim.png"/></a></div>
    <div id="headerMenuSection">
        <!--상단메뉴 목록 -->
            <div class="header_menu_nav header_category_wrap">카테고리</div>
            <div class="header_menu_nav"><a class="header_text_link" href="123">끌리밍</a></div>
            <div class="header_menu_nav"><a class="header_text_link" href="456">커뮤니티</a></div>
    </div><!--//headerMenuSection-->
    <div id="headerCategoryWrap">
        <div id="categoryGenreTab" class="category_list category_on">장르</div>
        <div id="categoryCountryTab" class="category_list">국가</div>
        <div id="categoryCharacteristic" class="category_list">시대</div>

        <!--카테고리 세부내용-->
        <div class="category_list_box">
            <ul class="category_genre_tab">
                <li>새로 올라온 영화</li>
                <li>로맨스</li>
                <li>키즈</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>애니메이션</li>
                <li>액션</li>
                <li>액션</li>
            </ul>

            <ul class="category_country_tab">
                <li>한국</li>
                <li>북한</li>
                <li>미국</li>
                <li>스웨덴</li>
                <li>스웨덴</li>
                <li>덴마크</li>
                <li>크로아티아</li>
                <li>아르헨티나</li>
            </ul>

            <ul class="category_characteristic_tab">
                <li>1980이전</li>
                <li>2000이전</li>
                <li>2010이전</li>
                <li>2010이후</li>
            </ul>
        </div><!--//category_genre_list-->
    </div><!--//headerCategoryWrap-->


    <!-- 검색버튼 나오게 하기 -->
    <div id="headerSearchBox">
            <form id="headerTotalSearch" class="header" action="" method="get" name="searchKeyword">
                <input id="headerTotalSearchText" autocomplete="off" name="searchKeyword" type="text"
                       onkeypress="JavaScript:press(this.form)"
                       placeholder="검색창">
                <i id="totalSearchBtn" class="fas fa-search"></i>
            </form>
        </div><!--//headerSearchBox-->

    <!--로그인 안했을때 -->
    <button id="headerSigninBtn">로그인</button>

    <!-- 로그인했을시 정보버튼 확인-->
    <div id="headerLoginInfo">
        <span><img id="headerStreamingImg" src="/img/camera.png"/></span>
        <span class="header_userInfo_nav"><i class="fas fa-user-alt"></i></span>
        <ul id="headerUserInfoBox">
            <li><a href="">닉네임여섯자</a></li>
            <li><a href="">찜</a></li>
            <li><a href="">내정보</a></li>
            <li><a href="">고객센터</a></li>
            <li>
                <form action="" method="">
                <button class="logout_btn">로그아웃</button>
                </form>
            </li>
        </ul>
    </div><!--//headerLoginInfo-->

    <!-- 스트리밍방만들기포포폼!-->
        <div class="streaming_popupBg">
            <div class="streaming_popup">
                <div class="streaming_popupWrap">
                    <h2>끌리밍</h2>
                </div><!--//streamingPopupWrap-->
                <i class="far fa-times-circle streaming_close_icon"></i>
                <div class="streaming_popup_contentWrap">
                    <form method="post" action="test.do" class="streaming_title">
                        <fieldset>
                            <label class="streaming_room_title">방 제목 : </label>
                            <input type="text" placeholder="영화제목을 입력해주세요" title="영화제목을 입력해주세요."/>
                            <button type="submit" class="streaming_start_btn" title="끌리밍 시작">방송하기</button>
                        </fieldset>
                    </form>
                </div><!--//streamingPopupContentWrap-->

                <!-- 스트리밍 팝업 영화 검색 -->
                <div class="streaming_movie_search">
                    <span>영화 검색 : </span>
                    <input name="movieSearch" class="movie_search_input" placeholder="영화를 검색해주세요">
                    <i class="fas fa-search movie_search_icon"></i>
                        <!--영화 검색시 나오는창-->
                    <div class="movie_search">

                            <!--영화 검색시 나오는 결과 템플릿-->

                    </div>

                </div><!--//streaming_movie_search-->

                <!-- 스트리밍 할 영상 목록 -->
                <div class="streaming_movie_wrap">
                    <ul class="streaming_movie_box">

                    <!--스트리밍할 영상 목록 템플릿-->

                    </ul>
                </div><!--streaming_movie_wrap-->
            </div><!--/streamingPopup-->
        </div><!--//streamingPopupBg-->
    </div>

    <!--로그인 팝업창 출력-->
    <div id="headerSigninPopupBg">
        <div id="headerSigninPopup">
            <div id="headerSigninPopupWrap">
                <img class ="login_Signin_img" src="/img/clim.png"/>
                <i class="far fa-times-circle" id="headerSigninPopupCloseIcon"></i>
            </div><!--//-->
            <div id="headerSigninPopupContentWrap">
                <div id="headerSigninPopupContentBox">
                    <form method="post" action="/login.do" id="headerSigninForm">
                        <fieldset>
                            <label for="loginId" class="LoginLabel screen_out" id="idLabel">ID:</label>
                            <input type="text" autofocus name="id" id="loginId" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요."/>
                            <br>
                            <label for="loginPassword" class="LoginLabel screen_out" id="pwdLabel">PassWord:</label>
                            <input type="password" name="password" id="loginPassword" placeholder="비밀번호를 입력해주세요" title="비밀번호를 입력해주세요."/>
                            <br>
                            <label id="signupMsg">아이디또는 비밀번호가 맞지않습니다.</label>
                            <button id="loginBtn" title="로그인버튼">로그인</button>
                        </fieldset>
                    </form>
                </div><!--//headerSigninPopupContentBox-->
                <div id="headerSigninPopupContentBoxSingup">
                    <a id="signupLink" href="signup.html">회원가입</a>
                    <a id="findPwdPopup" href="pwdUpdate.html">비밀번호 찾기</a>
                </div><!--//headerSigninPopupContentBoxSingup-->

            </div><!--//headerSigninPopupContentWrap-->
        </div><!--/headerSigninPopup-->
    </div><!--//headerSigninPopupBg-->
    <!--비밀번호 팝업창 출력-->
    <div id="headerFindPwdPopupBg">
        <div id="headerFindPwdPopup">
            <div id="headerFindPwdPopupWrap">
                <img class ="login_Signin_img" src="/img/clim.png"/>
                <i class="far fa-times-circle" id="headerFindPwdPopupCloseIcon"></i>
            </div><!--//headerFindPwdPopupWrap-->
            <div id="headerFindPwdPopupContentWrap">
                <h2 class="header_find_text">비밀번호 찾기</h2>
                <p>계정으로 사용하는 이메일 주소를 입력하시면</p>
                <p>이메일로 재설정 링크를 전송 해드립니다.</p>

                <form method="post" action="/find.do" id="">
                    <fieldset>
                        <label for="findId" class="Find_Label screen_out">이메일 </label>
                        <input type="text" autofocus name="id" id="findId" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요."/>
                        <label id="findMsg">이메일형식을 지켜주세요</label>
                    </fieldset>
                    <button type="submit" id="findCertificationBtn" title="인증번호 보내기">인증번호 전송하기</button>
                </form>
            </div><!--//headerSigninPopupContentWrap-->
        </div><!--/headerSigninPopup-->
    </div><!--//headerSigninPopupBg-->



    <!-- 구독중인 슬라이드바 -->
    <div id="headerSubscribeList">
        <div class="look_subscribe_btn">
            <i class="fas fa-angle-double-right"></i>
        </div>
    </div><!--headerSubscribeList-->

    <!--슬라이드 버튼-->
    <div id = "headerSubscribeSlideWrap">
        <div class="header_subscribe_btn">
            <i class="far fa-times-circle streaming_close_icon"></i>
        </div><!--//header_subscribe_btn-->
        <div id="headerSubscribeTitle">
            <h1>구독</h1>
        </div><!--//headerSubscribeTitle-->

        <!--구독자 리스트-->
        <div id="headerSubscribeWrap">
            <!--구독자 리스트 템플릿 -->
        </div><!--//headerSubscribeWrap-->
    </div><!--headerSubscribeSlideWrap-->
</header>


<!--영화목록 템플릿-->
<script type="template" id="streamingMovieListTmp">
        <@_.each(movies, function(movie){@>
        <li class="streaming_movie_list">
            <div class="streaming_card_icon">
                <button class="movie_order_upBtn"><i class="fas fa-chevron-up"></i></button>
                <button class="movie_order_downBtn"><i class="fas fa-chevron-down"></i></i></button>
            </div>
            <div class="streaming_movie_img"><img src="/img/<@=movie.img@>"/></div>
            <div class="streaming_movie_name">
                <span><@=movie.name@></span></div>
            <div class="streaming_movie_showTime"><@=movie.showTime@></div>
            <div class="streaming_movie_delete">
                <button class="streaming_movieDelete_list">
                    <i class="fas fa-trash-alt"></i>
                </button><!--//streaming_movie_delete-->
            </div>
        </li>
        <@})@>
</script>

<!--영화검색 템플릿-->
<script type="text/template" id="movieSearchTmp">
    <ul>
    <@ _.each(searchs,function(data){@>
        <li class="movie_search_list">
            <img src="/img/<@=data.img@>">
            <span><@=data.name@></span>
        </li>
    <@})@>
    </ul>

</script>

<!--구독자리스트 템플릿-->
<script type="template" id="subscribeListTmp">
    <ul>
        <@ _.each(subscribes, function(subscribe){@>
        <li class="subscribe_list">
            <a href=""><@=subscribe.nickName@></a>
            <a href=""><span><i class="fas fa-broadcast-tower"></i></span>LIVE</a>
            <form method="" action="">
                <button class="unsubscribe_list">구독취소</button>
            </form>
        </li>
        <@})@>
    </ul>
</script>



<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    //템플릿 모음
    //스트리밍 영화 템플릿
    let streamingMovieListTmp = _.template($("#streamingMovieListTmp").html());
    //스트리밍 영화 검색 템플릿!
    let movieSearchTmp = _.template($("#movieSearchTmp").html());
    //구독자 리스트 템플릿
    let subscribeListTmp = _.template($("#subscribeListTmp").html());


    //검색인풋
    let $body = $("body");//body요소객체
    let SearchTextFlag = true;
    /* 검색인풋 열기 */
    $("#totalSearchBtn").on("click", function (e) {
        if (SearchTextFlag) {
            SearchTextFlag = false;

            if ($("body").hasClass("on")) {
            	e.preventDefault();
                $("#headerTotalSearch").submit();
            } else {
                $("body").addClass("on");
                $("#headerTotalSearchText").attr("value", "");
            }
            $("#headerTotalSearchText").on("transitionend", function (e) {
                if (e.originalEvent.propertyName == "opacity") {
                    SearchTextFlag = true;
                    //$("#totalSearchText").off("transitionend");
                }//if() end
            });//transitionend() end
        }//if() end
    });
    /* 검색인풋 닫기 */
    $("body").on("click", function (e) {

        const id = $(e.target).attr("id");

        //alert(id!="totalSearchText" && id!="totalSearchBtn");
        if (SearchTextFlag) {
            if (id != "headerTotalSearchText" && id != "totalSearchBtn") {
                if ($("body").hasClass("on")) {
                    $("body").removeClass("on");
                }// if() end
            }// fi() end
        }// if() end

        if (id != "filter" && id != "filterBtn" && id != "filterArrow") {
            if ($("body").hasClass("on_filter")) {
                $("body").removeClass("on_filter");
            }// if() end
        }// if() end
    });

    
</script>