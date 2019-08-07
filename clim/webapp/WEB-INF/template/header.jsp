<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<a href="/"><img class="header_index_nav" src="/img/clim.png" /></a>
	</div>
	<div id="headerMenuSection">
		<!--상단메뉴 목록 -->
		<div class="header_menu_nav header_category_wrap">카테고리</div>
		<div class="header_menu_nav">
			<a class="header_text_link" href="123">끌리밍</a>
		</div>
		<div class="header_menu_nav">
			<a class="header_text_link" href="456">커뮤니티</a>
		</div>
	</div>
	<!--//headerMenuSection-->
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
		</div>
		<!--//category_genre_list-->
	</div>
	<!--//headerCategoryWrap-->


	<!-- 검색버튼 나오게 하기 -->
	<div id="headerSearchBox">
		<form id="headerTotalSearch" class="header" action="" method="get"
			name="searchKeyword">
			<input id="headerTotalSearchText" autocomplete="off"
				name="searchKeyword" type="text"
				onkeypress="JavaScript:press(this.form)" placeholder="검색창">
			<i id="totalSearchBtn" class="fas fa-search"></i>
		</form>
	</div>
	<!--//headerSearchBox-->
	<c:choose>
		<c:when test="${loginMember==null}">
			<!--로그인 안했을때 -->
			<button id="headerSigninBtn">로그인</button>
		</c:when>
		<c:otherwise>
			<!-- 로그인했을시 정보버튼 확인-->
			<div id="headerLoginInfo">
				<span><img id="headerStreamingImg" src="/img/camera.png" /></span> <span
					class="header_userInfo_nav"><i class="fas fa-user-alt"></i></span>
				<ul id="headerUserInfoBox">
					<li><a href="">${loginMember.nickname }</a></li>
					<li><a href="">찜</a></li>
					<li><a href="">내정보</a></li>
					<li><a href="">고객센터</a></li>
					<li>
						<form action="/session" method="POST">
							<button class="logout_btn">로그아웃</button>
							<input type="hidden" name="_method" value="DELETE">
						</form>
					</li>
				</ul>
			</div>
			<!--//headerLoginInfo-->

			<!-- 스트리밍방만들기포포폼!-->
			<div class="streaming_popupBg">
				<div class="streaming_popup">
					<div class="streaming_popupWrap">
						<h2>끌리밍</h2>
					</div>
					<!--//streamingPopupWrap-->
					<i class="far fa-times-circle streaming_close_icon"></i>
					<div class="streaming_popup_contentWrap">
						<form class="streaming_title">
							<fieldset>
								<label for="climTitle" class="streaming_room_title">방 제목
									: </label> <input id="climTitle" type="text" placeholder="영화제목을 입력해주세요"
									title="영화제목을 입력해주세요." />
								<button type="submit" class="streaming_start_btn" title="끌리밍 시작">방송하기</button>
							</fieldset>
						</form>
					</div>
					<!--//streamingPopupContentWrap-->

					<!-- 스트리밍 팝업 영화 검색 -->
					<div class="streaming_movie_search">
						<span>영화 검색 : </span> <input name="movieSearch"
							class="movie_search_input" placeholder="영화를 검색해주세요"> <i
							class="fas fa-search movie_search_icon"></i>
						<!--영화 검색시 나오는창-->
						<div class="movie_search">

							<!--영화 검색시 나오는 결과 템플릿-->

						</div>

					</div>
					<!--//streaming_movie_search-->

					<!-- 스트리밍 할 영상 목록 -->
					<div class="streaming_movie_wrap">
						<ul class="streaming_movie_box">

							<!--스트리밍할 영상 목록 템플릿-->

						</ul>
					</div>
					<!--streaming_movie_wrap-->
				</div>
				<!--/streamingPopup-->
			</div>
			<!--//streamingPopupBg-->
			</div>
		</c:otherwise>
	</c:choose>

	<!--로그인 팝업창 출력-->
	<div id="headerSigninPopupBg">
		<div id="headerSigninPopup">
			<div id="headerSigninPopupWrap">
				<img class="login_Signin_img" src="/img/clim.png" /> <i
					class="far fa-times-circle" id="headerSigninPopupCloseIcon"></i>
			</div>
			<!--//-->
			<div id="headerSigninPopupContentWrap">
				<div id="headerSigninPopupContentBox">
					<form method="post" id="headerSigninForm">
						<fieldset>
							<label for="loginId" class="LoginLabel screen_out" id="idLabel">ID:</label>
							<input type="text" autofocus name="email" id="email"
								placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요." /> <br> <label
								for="loginPassword" class="LoginLabel screen_out" id="pwdLabel">PassWord:</label>
							<input type="password" name="pwd" id="pwd"
								placeholder="비밀번호를 입력해주세요" title="비밀번호를 입력해주세요." /> <br> <label
								id="signupMsg">아이디또는 비밀번호가 맞지않습니다.</label>
							<button id="loginBtn" title="로그인버튼">로그인</button>
						</fieldset>
					</form>
				</div>
				<!--//headerSigninPopupContentBox-->
				<div id="headerSigninPopupContentBoxSingup">
					<a id="signupLink" href="signup.html">회원가입</a> <a id="findPwdPopup"
						href="pwdUpdate.html">비밀번호 찾기</a>
				</div>
				<!--//headerSigninPopupContentBoxSingup-->

			</div>
			<!--//headerSigninPopupContentWrap-->
		</div>
		<!--/headerSigninPopup-->
	</div>
	<!--//headerSigninPopupBg-->
	<!--비밀번호 팝업창 출력-->
	<div id="headerFindPwdPopupBg">
		<div id="headerFindPwdPopup">
			<div id="headerFindPwdPopupWrap">
				<img class="login_Signin_img" src="/img/clim.png" /> <i
					class="far fa-times-circle" id="headerFindPwdPopupCloseIcon"></i>
			</div>
			<!--//headerFindPwdPopupWrap-->
			<div id="headerFindPwdPopupContentWrap">
				<h2 class="header_find_text">비밀번호 찾기</h2>
				<p>계정으로 사용하는 이메일 주소를 입력하시면</p>
				<p>이메일로 재설정 링크를 전송 해드립니다.</p>

				<form method="post" id="">
					<fieldset>
						<label for="emailPwd" class="Find_Label screen_out">이메일 </label> <input
							type="text" autofocus name="emailPwd" id="emailPwd"
							placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요." /> <label
							id="findMsg">이메일형식을 지켜주세요</label>
					</fieldset>
					<button type="submit" id="findCertificationBtn" title="인증번호 보내기">인증번호
						전송하기</button>
				</form>
			</div>
			<!--//headerSigninPopupContentWrap-->
		</div>
		<!--/headerSigninPopup-->
	</div>
	<!--//headerSigninPopupBg-->



	<!-- 구독중인 슬라이드바 -->
	<c:if test="${loginMember!=null }">
		<div id="headerSubscribeList">
			<div class="look_subscribe_btn">
				<i class="fas fa-angle-double-right"></i>
			</div>
		</div>
		<!--headerSubscribeList-->

		<!--슬라이드 버튼-->
		<div id="headerSubscribeSlideWrap">
			<div class="header_subscribe_btn">
				<i class="far fa-times-circle streaming_close_icon"></i>
			</div>
			<!--//header_subscribe_btn-->
			<div id="headerSubscribeTitle">
				<h1>구독</h1>
			</div>
			<!--//headerSubscribeTitle-->

			<!--구독자 리스트-->
			<div id="headerSubscribeWrap">
				<!--구독자 리스트 템플릿 -->
			</div>
			<!--//headerSubscribeWrap-->
		</div>
		<!--headerSubscribeSlideWrap-->
	</c:if>
</header>


<!--영화목록 템플릿-->
<script type="template" id="streamingMovieListTmp">
    <@_.each(movies, function(movie){@>
        <li class="streaming_movie_list">
            <div class="streaming_card_icon">
                <button class="movie_order_upBtn"><i class="fas fa-chevron-up"></i></button>
                <button class="movie_order_downBtn"><i class="fas fa-chevron-down"></i></i></button>
            </div>
            <div class="streaming_movie_img"><img src="/posters<@=movie.poster@>"/></div>
            <div class="streaming_movie_name">
                <span><@=movie.title@></span></div>
            <div class="streaming_movie_showTime"><@=movie.runtime@>분</div>
            <div class="streaming_movie_delete">
                <button class="streaming_movieDelete_list" data-bookmarkno="<@=movie.no@>">
                    <i class="fas fa-trash-alt"></i>
                </button><!--//streaming_movie_delete-->
            </div>
        </li>
    <@})@>
</script>

<!--영화검색 템플릿-->
<script type="text/template" id="movieSearchTmp">
    <ul>
		<@ if(searchs.length!=0){@>
    		<@ _.each(searchs,function(movie){@>
        		<li class="movie_search_list" data-movieno = "<@=movie.no@>">
        	   		<img src="/posters<@=movie.poster@>"/>
         			<span><@=movie.title@></span>
       			</li>
    		<@})@>
		<@ }else{ @>
			<li class="movie_search_list"><div class="search_no_result">등록되지 않은 영화입니다.</div></li>
		<@ } @>
    </ul>

</script>

<!--구독자리스트 템플릿-->
<script type="template" id="subscribeListTmp">
    <ul>
        <@ _.each(subscribes, function(subscribe){@>
        <li class="subscribe_list" >
            <a href="/user/<@=subscribe.follower@>"><@=subscribe.nickname@></a>
			<@if(subscribe.LiveCheck){@>
            <a href="/"><span><i class="fas fa-broadcast-tower"></i></span>LIVE</a>
            <@}@>
                <button class="unsubscribe_list" data-no="<@=subscribe.follower@>">구독취소</button>
        </li>
        <@})@>
    </ul>
</script>
<script src="/js/sockjs.min.js"></script>
<script src="/js/stomp.min.js"></script>
<script>
	_.templateSettings = {
		interpolate : /\<\@\=(.+?)\@\>/gim,
		evaluate : /\<\@([\s\S]+?)\@\>/gim,
		escape : /\<\@\-(.+?)\@\>/gim
	};

	//템플릿 모음
	//스트리밍 영화 템플릿
	let streamingMovieListTmp = _.template($("#streamingMovieListTmp").html());
	//스트리밍 영화 검색 템플릿!
	let movieSearchTmp = _.template($("#movieSearchTmp").html());
	//구독자 리스트 템플릿
	let subscribeListTmp = _.template($("#subscribeListTmp").html());
	/* 0802 로그인 유저의 끌리밍 리스트 불러오기 */

	//스트리밍 준비 무비 리스트
	function getStreamingMovieList() {
		$.ajax({
			url : "/ajax/bookmark/climing",
			dataType : "json",
			type : "get",
			error : function() {
				//alert("에러");
			},
			success : function(json) {
				console.log(json);
				$(".streaming_movie_wrap").html(streamingMovieListTmp({
					movies : json
				}));
			}
		});
	};// getStremingMovieList() end

	//검색인풋
	let $body = $("body");//body요소객체
	let SearchTextFlag = true;
	/* 검색인풋 열기 */
	$("#totalSearchBtn").on("click", function() {
		if (SearchTextFlag) {
			SearchTextFlag = false;

			if ($("body").hasClass("on")) {
				$("#headerTotalSearch").submit();
			} else {
				$("body").addClass("on");
				$("#headerTotalSearchText").attr("value", "");
			}
			$("#headerTotalSearchText").on("transitionend", function(e) {
				if (e.originalEvent.propertyName == "opacity") {
					SearchTextFlag = true;
					//$("#totalSearchText").off("transitionend");
				}//if() end
			});//transitionend() end
		}//if() end
	});
	/* 검색인풋 닫기 */
	$("body").on("click", function(e) {

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

	//로그인 버튼 클릭시 팝업
	$("#headerSigninBtn").click(function() {
		$("#headerSigninPopupBg").fadeIn();
	});
	$("#headerSigninPopupBg").click(function() {
		$("#headerSigninPopupBg").css("display", "none")
	});
	$("#headerSigninPopup").click(function() {
		return false;
	});
	$("#headerSigninPopupCloseIcon").click(function() {
		$("#headerSigninPopupBg").css("display", "none")
	});

	$("#signupLink").click(function(e) {
		e.stopPropagation();
		// $("#indexSigninPopupBg").css("display","none")
	});
	//로그인 버튼 클릭시 팝업 끝

	//카테고리 별 클릭시 탭변경
	$("#categoryGenreTab").click(function() {
		$(".category_genre_tab").css("display", "block");
		$(".category_country_tab").css("display", "none");
		$(".category_characteristic_tab").css("display", "none");
		$(".category_on").removeClass("category_on");
		$(this).addClass("category_on")

	});

	$("#categoryCountryTab").click(function() {
		$(".category_country_tab").css("display", "block");
		$(".category_genre_tab").css("display", "none");
		$(".category_characteristic_tab").css("display", "none");
		$(".category_on").removeClass("category_on");
		$(this).addClass("category_on")
	});

	$("#categoryCharacteristic").click(function() {
		$(".category_characteristic_tab").css("display", "block");
		$(".category_country_tab").css("display", "none");
		$(".category_genre_tab").css("display", "none");
		$(".category_on").removeClass("category_on");
		$(this).addClass("category_on")
	});

	//비밀번호 찾기 클릭시 팝업 출력
	$("#findPwdPopup").click(function() {
		$("#headerSigninPopupBg").css("display", "none");
		$("#headerFindPwdPopupBg").fadeIn();
	});
	$("#headerFindPwdPopupBg").click(function() {
		$("#headerFindPwdPopupBg").css("display", "none")
	});
	$("#headerFindPwdPopup").click(function() {
		return false;
	});
	$("#headerFindPwdPopupCloseIcon").click(function() {
		$("#headerFindPwdPopupBg").css("display", "none")
	});
	//비밀번호 찾기 클릭 팝업 끝

	//스트리밍 방만들기 팝업
	$("#headerStreamingImg").click(function() {
		$(".streaming_popupBg").fadeIn();
		getStreamingMovieList();
	});
	$(".streaming_popupBg").click(function() {
		$(".movie_search").empty();
		$(".movie_search_input").val("");
		$(".movie_search").css("display", "none");
		$(".streaming_popupBg").css("display", "none");
	});
	$(".streaming_popup").click(function() {
		$(".movie_search").empty();
		$(".movie_search_input").val("");
		$(".movie_search").css("display", "none");
		return false;
	});
	$(".streaming_close_icon").click(function() {
		$(".movie_search_input").val("");
		$(".movie_search").css("display", "none");
		$(".streaming_popupBg").css("display", "none");
		$(".streaming_popupBg").css("display", "none");
	});

	//로그인 중일때 내정보 버튼 클릭시
	let headFlag = false;
	$(".header_userInfo_nav").click(function() {
		if (headFlag == false) {
			$("#headerUserInfoBox").fadeIn();
			headFlag = true;
		} else {
			$("#headerUserInfoBox").css("display", "none");
			headFlag = false;
		}
	});

	//카테고리클릭시 리스트 팝업 출력
	let flag2 = false;
	$(".header_category_wrap").click(function() {
		if (flag2 == false) {
			$("#headerCategoryWrap").fadeIn();
			flag2 = true;
		} else {
			$("#headerCategoryWrap").css("display", "none");
			flag2 = false;
		}
	});

	//구독중인 유저목록 리스트 출력 버튼
	$(".look_subscribe_btn").click(function() {
		$("#headerSubscribeSlideWrap").css("display", "block");
		$("#headerSubscribeList").css("display", "none");
		getSubscribeList();
	});
	$(".header_subscribe_btn").click(function() {
		$("#headerSubscribeSlideWrap").css("display", "none");
		$("#headerSubscribeList").css("display", "block");
	});

	//아이디비번작성후 로그인 버튼 클릭시
	let $loginId = $("#loginId");
	let $loginPassword = $("#loginPassword");
	let $email = $("#email");
	let $pwd = $("#pwd");

	$("#loginBtn").click(function(e) {
		let idflag = true;
		
		$.ajax({
			url : "/ajax/session",
			data : {
				email : $email.val(),
				pwd : $pwd.val()
			},
			dataType : "json",
			type : "post",
			error : function(xhr, error, code) {
				alert(error);
				console.log(xhr.responseText);
			}, // error end
			success : function(json) {
				if (json.loginMember == 0) {
					$("#signupMsg").css("display",
							"block");
					e.preventDefault();
				} else {
					location.reload();
				}
				
            }
        });	
    });
    
	//비밀번호 찾기findId    //이건 서버떄 쏘스 드림
	let $emailPwd = $("#emailPwd");
	$("#findCertificationBtn").click(function() {
		$.ajax({
			url : "/ajax/findPwd",
			dataType : "json",
			type : "POST",
			data : {
				email : $emailPwd.val()
			},
			error : function(xhr,
					error, code) {
				alert("이메일이 올바르지 않습니다");
			},//error end
			success : function(json) {
				console.log(json.member.email.indexOf("@"));
				let idx = json.member.email.indexOf("@");
				window.open('http://www.'+ json.member.email.substring(idx + 1),'newWindow');
			}
		});
	});

	//스트리밍 방만들기전 순서 바꾸기
	let $streamingMovieWrap = $(".streaming_movie_wrap");
	// 영화 목록에 아래 버튼을 클릭시 스왑
	$streamingMovieWrap.on("click",".movie_order_downBtn",function() {
		let lastIndex = $streamingMovieWrap[0].childElementCount - 1;
		let temp = $(this).parents("li");
		console.log(temp);
		let index = $(this).parents("li")
				.index();
		console.log(index);
		if (index == lastIndex) {
			return false;
		}
		$(this).parents("li").remove();
		$streamingMovieWrap.children("li").eq(index).after(temp);
		console.log($(this).parents("li").index());
	});

	// 영화 목록에서 윗 버튼을 클릭하면 스왑
	$streamingMovieWrap.on("click", ".movie_order_upBtn",function() {
		let zeroIndex = 0;
		let temp = $(this).parents("li");
		console.log(temp);
		let index = $(this).parents("li").index();
		console.log(index);
		if (index == zeroIndex) {
			return false;
		}
		$(this).parents("li").remove();
		$streamingMovieWrap.children("li").eq(
				index - 1).before(temp);
		console.log($(this).parents("li").index());
	});

	//스트리밍 영화목록 삭제하기
	$streamingMovieWrap.on("click",".streaming_movieDelete_list", function() {
		let bookNo = this.dataset.bookmarkno

		$.ajax({
			url : "/ajax/bookmarkForCliming/"
					+ bookNo,
			type : "DELETE",
			datatype : "json",
			error : function() {
				alert("서버 점검중입니다!");
			},
			success : function(json) {
				console.log(json);
				getStreamingMovieList();
			}
		});
	});

	//영화 목록에 추가
	
	//스트리밍 영화목록 검색하기
	$(".movie_search_input").on("keyup",function() {
		let searchTitle = $(".movie_search_input").val().trim();
		console.log(searchTitle.length);
		console.log(searchTitle);
		if (searchTitle.length == 0) {
			$(".movie_search").css("display","none");
		} else {
			$(".movie_search").css("display","block");
		} //if~else end
		if (searchTitle.length != 0) {
			$.ajax({
				url : "/ajax/climingSearch/"+ searchTitle,
				dataType : "json",
				error : function() {
					alert("에렁");
				},
				success : function(data) {
					$(".movie_search").html(movieSearchTmp({searchs : data}));
				}
			}) //ajax end
		}// if() end 글자 다 지웠을 때는 ajax작동 안함
	});

		


	//스트리밍 방송 하기 클릭
	
	 //구독중인 리스트 불러오기
	 function getSubscribeList(){
	 $.ajax({
	 url:"/ajax/user/${loginMember.no}/subscribe",
	 dataType:"json",
	 type:"GET",
	 error:function () {
	 alert("에러");
	 },
	 success:function (json) {
	 console.log(json);
	 $("#headerSubscribeWrap").html(subscribeListTmp({"subscribes":json}));
	 }
	 });
	 }
	 

	//webSocket stomp client
	let stompClient = null;

	function connect(callback) {

		let socket = new SockJS('/clim');
		stompClient = Stomp.over(socket);

		// SockJS와 stomp client를 통해 연결을 시도.
		stompClient.connect({}, function() {

			alert("test");
		
			//방번호 얻어오기
			stompClient.subscribe("/user/queue/clim/make", function(protocol) {
				//넘어오는 데이터는 body에
				console.log(protocol.body);

				//방을 만들었기 때문에 유저에게 목록을 다시
				stompClient.send("/app/clim/list", {});

				//해당 번호 방으로 이동
				location.href = "/room/"+ protocol.body;

			});

			//인자로 받은 함수를 여기서 호출
			if (callback) callback();

		});

	}
	
	console.log("before");
	connect();
	console.log("after");

	$(".streaming_title").on("submit", function(e) {
		e.preventDefault();
	})
	//영화 검색시 나오는 리스트 클릭시

<c:if test="${loginMember !=null }">
	//구독취소 버튼시 리스트에서 삭제
	$("#headerSubscribeWrap").on("click",".unsubscribe_list",function() {
				let no = this.dataset.no;
				$.ajax({
					url : "/ajax/user/following/${loginMember.no}/follower/"+ no,
					type : "DELETE",
					dataType : "json",
					error : function() {
						alert("에러");
					},
					success : function(json) {
						console.log(json);
						$(this).parents("li").remove();
						getSubscribeList();
			}//success end
		});//ajax end		
	});//구독버튼 클릭하기

	$(".movie_search").on("click",".movie_search_list",function() {
	
		$this = $(this);
	
		let movieNo = this.dataset.movieno;
	
		let movieName = $this.children("span").text();
		let poster = $this.children("img").attr("src");
	
		$.ajax({
			url : "/ajax/addBookmarkOfCliming",
			type : "POST",
			datatype : "json",
			data : {
				memberNo : ${loginMember.no},
				movieNo : movieNo
			},
			error : function() {
				alert("안가요");
			},
			success : function(json) {
				if (json.result == "실패") {
					alert("이미 등록된 영화입니다!");
				}
				$(".movie_search").empty();
				$(".movie_search_input").val("");
				$(".movie_search_input").focus();
				$(".movie_search").css("display","none");
				getStreamingMovieList();
			}
		})
	});	
	
	$(".streaming_start_btn").on("click",function(e) {
		e.stopPropagation();
		
		let title = $("#climTitle").val();

		alert(title);
		
		//넘길 데이터(파라미터)

		/*
		$.ajax({ 
			url: ①
			data:②
			success:③
		})
		
		stompClient.send(①,{},②);
		 */
		//객체를 String으로 
		//userNo는 ${loginUser.no} 변경필요
		const data = JSON.stringify({
			"memberNo" : ${loginMember.no},
			"title" : title
		});

		//방만들기
		stompClient.send("/app/clim/make", {}, data);

	});

</c:if>
</script>