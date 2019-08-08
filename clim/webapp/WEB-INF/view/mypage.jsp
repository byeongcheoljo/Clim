<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link href='/css/mypage_home_tab.css' rel='stylesheet' />
<link href='/css/calendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='/css/calendar/packages/core/main.css' rel='stylesheet' />
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
<main id="content">
<div id="tabSectionUserPage">
	<ul id="headerNavMypage">
		<li id="nicknameHeaderMypage">${member.nickname }</li>
		<li class="header_myPage_tabbed">홈</li>
		<li>찜</li>
		<li>커뮤니티</li>
		<li>정보수정</li>
		<li>FAQ</li>
	</ul>
</div>
<!-- //tabSectionUserPage -->
<div class="home_section_userpage">
	<div id="userInfoWrap">
		<div class="userInfo_inner right_margin small_card">구독자 수 :
			${member.followerCnt }명</div>
	<div class="userInfo_inner right_margin small_card">
		가입일 :
		<fmt:formatDate value="${member.regdate }" pattern="YYYY-MM-dd" />
	</div>
	<div class="userInfo_inner">누적 시청자 수 : ${member.climgCnt }명</div>
	<c:if test="${member.no!=loginMember.no }">
		<button data-no="${member.no}" id="subscribeBtn"
			class="userInfo_inner small_card ${member.subscribeCheck?'selected_btn':' '}">
			<span>${member.subscribeCheck?"구독중":"구독" }</span> <i
				class="${member.subscribeCheck?"fas":"far" } fa-bell"></i>
		</button>
	</c:if>
</div>
<!--//userInfoWrap-->
</div>
<!-- //home_section_userPage -->
<div class="home_section_userpage bottom_section">
	<div id="noticeWrap">
		<h4 class="white_title_card">공지 사항</h4>
		<div class="notice_box">
			<div class="calender_inner">
				<div id='calendarInner'></div>
			</div>
			<!--//calender_inner-->
		<c:if test="${member.no==loginMember.no }">
			<div class="detail_inner detail_form">
				<div class="notice_card"
					style="text-align: center; font-size: 25px; font-weight: bold;">공지사항
					입력하기</div>
				<!--                        입력 폼-->
				<form class="notice_form " action="" method="post">
					<div class="notice_card">
						<label for="noticeTitle" class="margin_lbl">제목</label> <input
							type="text" id="noticeTitle" name="noticeTitle" />
						<div id="titleBlur"></div>
						<div id="noticeTitleConfirm" class="validation_text">제목을
							입력해주세요!</div>
					</div>
					<!--//notice_card-->

					<div class="notice_card">
						<label class="verticalAlign_top_label margin_lbl"
							for="noticeContent">내용</label>
						<textarea id="noticeContent" name="noticeContent"> </textarea>
						<div id="contentBlur"></div>
						<div id="noticeContentConfirm" class="validation_text">세부사항을
							입력해주세요!</div>
					</div>
					<!--//notice_card-->

					<div class="notice_card">
						<label for="startYear" class="margin_lbl">시작 일</label> <select
							name="startYear" id="startYear">


						</select> <label for="startYear" class="margin_lbl">년</label> <select
							name="startMonth" id="startMonth">

						</select> <label for="startMonth" class="margin_lbl">월</label> <select
							name="startDate" id="startDate" class="date">

						</select> <label for="startDate">일</label>
					</div>
					<!--//notice_card-->

					<div class="notice_card">
						<label for="endYear" class="margin_lbl">종료 일</label> <select
							name="endYear" id="endYear">

						</select> <label for="endYear" class="margin_lbl">년</label> <select
							name="endMonth" id="endMonth">

						</select> <label for="endMonth" class="margin_lbl">월</label> <select
							name="endDate" id="endDate" class="date">

						</select> <label for="endDate">일</label>
					</div>
					<!--//notice_card-->
					<button type="reset" class="notice_btn">다시 입력</button>
					<button type="submit" class="notice_btn">등록</button>
				</form>
			</div>
			<!--//detail_inner-->
		</c:if>
		<!--일정 클릭시 세부사항 보여줌-->
		<div class="detail_inner detail_info_inner" style="display: none">
			<div class="notice_card plan_card">2019.07.25</div>
			<div class="notice_card title_card">제목(실제 일정 이름 입력될 것!)</div>
			<div class="notice_card content_card">내용이 들어갑니다</div>
			<button id="backBtn" class="notice_btn">돌아가기</button>
			<button id="planCancelBtn" class="notice_btn">일정 삭제하기</button>
		</div>
		<!--//detail_inner-->
	</div>
	<!--//notice_box-->
</div>
<!--//noticeWrap-->
</div>
<!--//home_section_userPage-->


<ul id="chartSection">
	<li id="latestPlayList">
		<ul class="latest_playlist_box">

		</ul> <!-- //recommend_box -->
	<div class="move_btn latest_playlist_move_prev">
		<i class="fas fa-angle-left"></i>
	</div>
	<div class="move_btn latest_playlist_move_next">
		<i class="fas fa-angle-right"></i>
	</div>
</li>

<li id="favoriteActorWrap">
	<div id="favoriteActorBox">
		<canvas class="resize_canvas" id="favoriteActor" width="460"
			height="385"></canvas>
	</div> <!--favoriteActorBox-->
</li>
<!--//favoriteActorWrap-->

<li id="favoriteDirectorWrap">
	<canvas class="resize_canvas" id="favoriteDirector" width="460"
		height="385"></canvas>
</li>
<!--//2개-->

<li id="streamingGenresWrap">
	<canvas class="resize_canvas" id="streamingGenres" width="460"
		height="385"></canvas>
</li>

<li id="favoriteGenreWrap">
	<canvas class="resize_canvas" id="favoriteGenre" width="460"
		height="385"></canvas>
</li>
<!--//남이 볼 수 있는 페이지-->
<c:if test="${member.no==loginMember.no }">
	<li id="viewersGenderWrap">
		<canvas class="resize_canvas" id="viewersGender" width="460"
			height="385"></canvas>
	</li>

	<li id="avgViewerNumberPerTimeWrap">
		<canvas class="resize_canvas" id="avgViewerNumberPerTime"
			width="460" height="385"></canvas>
	</li>

	<li id="viewersNumberPerTimeWrap">
		<canvas class="resize_canvas" id="viewersNumberPerTime" width="460"
			height="385"></canvas>
	</li>
</c:if>
</ul>
<!--//chartWrap--> </main>
<!-- //main -->
<c:import url="/WEB-INF/template/footer.jsp" />

<!--                                           template                                        -->
<script type="text/template" id="climingListTmp">
	<@_.each(movies,function(movie){@>
	<li class="latest_playlist_card"><a href="/movie/<@=movie.no@>">
	<img src="/poster<@=movie.poster@>"/></a>
	</li>
	<@});@>
	</script>
<!--                                           script                                        -->

<script src='/js/calendar/packages/core/main.js'></script>
<script src='/js/calendar/packages/interaction/main.js'></script>
<script src='/js/calendar/packages/daygrid/main.js'></script>
<script src="/js/moment-with-locales.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
_.templateSettings = {
	interpolate : /\<\@\=(.+?)\@\>/gim,
	evaluate : /\<\@([\s\S]+?)\@\>/gim,
	escape : /\<\@\-(.+?)\@\>/gim
};

let calendarEl = document.getElementById('calendarInner');
let contentText = null;
let startDay = null;
let endDay = null;
let title = null;
let today = moment().format("YYYY-MM-DD");

let $title_card = $(".title_card");
let $contentCard = $(".content_card");
let $plan_card = $(".plan_card");
let eventObject;
/*calendar 객체 선언*/

/*calendar 실행*/
events();
/* events ajax */

function events() {
	$
			.ajax({
				url : "/ajax/user/${member.no}/events",
				dataType : "json",
				type : "GET",
				error : function() {
					alert("에러");
				},
				success : function(json) {
					console.log(json);
					let calendar = new FullCalendar.Calendar(
							calendarEl,
							{
								locale : 'ko',
								plugins : [ 'interaction', 'dayGrid' ],
								defaultDate : today,
								editable : true,
								displayEventTime : false,
								eventLimit : true, // allow "more" link when too many events
								events : json,
								eventClick : function(info) {
									console.log(info);
									eventObject = info.event;
									info.jsEvent.preventDefault(); // don't let the browser navigate
									startDay = moment(info.event.start)
											.format("YYYY.MM.DD");
									endDay = moment(info.event.end)
											.format("YYYY.MM.DD");
									contentText = info.event._def.extendedProps.contentText;
									title = info.event.title;
									let $detail_info_inner = $(".detail_info_inner");
									let $input = $("<input>").attr({
										"type" : "hidden",
										"name" : "no"
									}).val(info.event.id);
									$detail_info_inner.append($input);
								}
							});
					calendar.render();
				}
			});//ajax end
	/* events ajax */
}

/*탭 목록*/
$("#headerNavMypage li").click(function() {
	//4px solid #F9AC1A
	$("li").removeClass('header_myPage_tabbed');
	$(this).addClass('header_myPage_tabbed');
});
/*공지사항*/
const $notice_box = $(".notice_box");
const $noticeTitleConfirm = $("#noticeTitleConfirm");
const $noticeContentConfirm = $("#noticeContentConfirm");
const $titleBlur = $("#titleBlur");
const $contentBlur = $("#contentBlur");

$notice_box.on("submit", ".detail_inner", function(e) {
	e.preventDefault();
	const title = $("#noticeTitle").val();
	if (title.length < 1) {
		$titleBlur.hide();
		$noticeTitleConfirm.show();
	} else if (title.length >= 1) {
		$noticeTitleConfirm.hide();
		$titleBlur.show();
	}

	const content = $("#noticeContent").val();
	if (content.length <= 1) {
		$contentBlur.hide();
		$noticeContentConfirm.show();
	} else if (content.length > 1) {
		$noticeContentConfirm.hide();
		$contentBlur.show();
	}

	const startYear = $("#startYear").val();
	const startMonth = $("#startMonth").val();
	const startDate = $("#startDate").val();
	const startDay = startYear + "-" + startMonth + "-" + startDate;

	//const start = new Date("2019-07-01T03:24:00");
	const start = new Date(startDay);

	const endYear = $("#endYear").val();
	const endMonth = $("#endMonth").val();
	const endDate = $("#endDate").val();
	const endDay = endYear + "-" + endMonth + "-" + endDate;

	const end = new Date(endDay);
	let noticeTitle = $("#noticeTitle").val();
	let noticeContent = $("#noticeContent").val();

	$.ajax({
		url : "/ajax/user/${loginMember.no}/events",
		type : "POST",
		dataType : "json",
		data : {
			fullDay : false,
			title : noticeTitle,
			contents : noticeContent,
			startDate : startDay,
			endDate : endDay
		},
		error : function() {
			alert("에러");
		},
		success : function(json) {

			console.log("insert: " + json);
			calendar.addEvent(json);
		}

	});//ajax end
	events();
});//이벤트 등록

/*공지 클릭시 해당 공지 상세 보여줌*/
$notice_box.on("click", ".fc-content", function(e) {
	$plan_card.text(startDay + " ~ " + endDay);
	$title_card.text(title);
	$contentCard.text(contentText);
	$(".detail_form").css({
		"display" : "none"
	});
	$(".detail_info_inner").fadeIn(500);
});

$notice_box.on("click", "#planCancelBtn", function() {
	let no = $(this).parents(".detail_info_inner").find("input").val();
	console.log(no);
	$.ajax({
		url : "/ajax/user/" + no + "/events",
		dataType : "json",
		type : "DELETE",
		error : function() {
			alert("에러");
		},
		success : function(json) {
			console.log("delete :" + json);
			$(".detail_info_inner").css({
				"display" : "none"
			});
			eventObject.remove();
			$(".detail_form").fadeIn(500);
		}

	})

});//공지 삭제하기

$("#backBtn").on("click", function() {
	$(".detail_info_inner").css({
		"display" : "none"
	});
	$(".detail_form").fadeIn(500);
});//돌아가기 버튼
let $subscribeBtn = $("#subscribeBtn span");
let subscribeFlag = 0;

$("#subscribeBtn")
		.on(
				"click",
				function() {
					let name = $(this).text().trim();
					console.log(name);
					let no = this.dataset.no;
					const $i = $(this).find("i");

					let type = "POST";
					if (name == "구독중") {
						type = "DELETE";
					}
					console.log(type);
					$
							.ajax({
								url : "/ajax/user/following/${loginMember.no}/follower/${member.no}",
								type : type,
								dataType : "json",
								error : function() {
									alert("에러");
								},

								success : function(json) {
									if (subscribeFlag == 0) {
										$i.removeClass("far");
										$i.addClass("fas");
										$subscribeBtn.text("구독중");
										$("#subscribeBtn").addClass(
												'selected_btn');
										subscribeFlag = 1;
									} else if (subscribeFlag == 1) {
										$i.removeClass("fas");
										$i.addClass("far");
										$subscribeBtn.text("구독");
										$("#subscribeBtn").removeClass(
												'selected_btn');
										subscribeFlag = 0;
									}
								}//success end
							});//ajax end		
				});//구독버튼 클릭하기

/* 공지사항 윤달 계산 */
let $startYear = $("#startYear");
let $startMonth = $("#startMonth");
let $startDate = $("#startDate");

let $endYear = $("#endYear");
let $endMonth = $("#endMonth");
let $endDate = $("#endDate");

$startYear.change(function() {
	makeDate($startDate);
});
$endYear.change(function() {
	makeDate($endDate);
});

$startMonth.change(function() {
	makeDate($startDate);
});
$endMonth.change(function() {
	makeDate($endDate);
});

function makeYear($year) {
	let year = moment().year();
	for (let i = year; i > year - 100; i--) {
		$year.append($("<option>").val(i).text(i));
	}
}//makeMonth() end

function makeMonth($month) {
	let month = 0;
	for (let i = 1; i < 13; i++) {
		if (i < 10) {
			month = "0" + i;
			$month.append($("<option>").val(month).text(i));
		} else {
			month = i;
			$month.append($("<option>").val(month).text(i));
		}

	}
}//makeMonth() end

function makeDate($date) {
	//라벨을 고려하여 prev().prev()
	const $month = $date.prev().prev();
	const $year = $month.prev().prev();

	let year = $year.val();
	let month = $month.val();
	let date = $date.val();

	let that = moment([ year, month - 1 ]);
	let lastDate = that.endOf("month").date();
	$date.empty();
	for (let i = 1; i <= lastDate; i++) {
		let day = 0;
		if (i < 10) {
			day = "0" + i;
			let $option = $("<option>").text(i).val(day)
					.appendTo($date);
			if (i == date) {
				$option.attr("selected", true);
			}//if end
		} else {
			day = i;
			let $option = $("<option>").text(i).val(day)
					.appendTo($date);
			if (i == date) {
				$option.attr("selected", true);
			}//if end
		}//if else end
	}//for lastdate end
}//makeMonth() end
makeYear($startYear);
makeYear($endYear);

makeMonth($startMonth);
makeMonth($endMonth);

makeDate($startDate);
makeDate($endDate);//공지사항 윤달 계산

/* 최근 스트리밍 목록 */
const $latest_playlist_box = $(".latest_playlist_box");
let width = 0;
let latestPlayListMove = 0;
let splitLength = 0;
let $latest_playlist_card = $(".latest_playlist_card");
const climingListTmp = _.template($("#climingListTmp").html());
let data = [];

$.ajax({
	url : "/ajax/user/${member.no}/climing",
	type : "GET",
	dataType : "json",
	error : function() {
		alert("climingMovieList 에러");
	},
	success : function(json) {
		data = json;
		$latest_playlist_box.append(climingListTmp({
			"movies" : json
		}));
		resizeBox();
	}
});//ajax end	
/*박스 크기 재설정*/
function resizeBox() {
	width = (data.length) * 209;
	$latest_playlist_box.css("width", width + "px");
}

// const $latest_playlist_card = $(".latest_playlist_card");
const $latest_playlist_move_prev = $(".latest_playlist_move_prev");
const $latest_playlist_move_next = $(".latest_playlist_move_next");

let playListMoveFlag = true;

/* 최근 스트리밍 목록에서 이전 버튼을 눌렀을때 */
$latest_playlist_move_prev.on("click", function() {
	let nowLeft = $(this).prev().css("left");
	//console.log("this.prev :"+$(this).prev());
	let res = nowLeft.split("px");
	//console.log("res :"+res);
	//console.log("res[0] :" +res[0]);
	if (res[0] == 0) {
		latestPlayListMove = 0;
	}
	latestPlayListMove = res[0];
	latestPlayListMove = Number(latestPlayListMove);
	// console.log(latestPlayListMove);
	if (playListMoveFlag) {
		playListMoveFlag = false;
		let comparePx = latestPlayListMove;
		$(this).next().css("color", "white");
		if (comparePx != 0) {
			comparePx += 209;
			console.log(comparePx);
			if (comparePx >= (0)) {
				comparePx = 0;
				$(this).css("color", "#9e9e9e");
			}//if end	
		}//if end
		$(this).prev().css("left", comparePx + "px");
		playListMoveFlag = true;
	}
}); // $latest_playlist_move_prev click() end

/* 최근 스트리밍 목록에서 다음 버튼을 눌렀을때 */
$latest_playlist_move_next.on("click", function() {
	//alert("오른쪽 클릿ㅅㅅㅅ");
	let nowLeft = $(this).prev().prev().css("left");// ul의 left값을 뜻함
	//console.log($(this).prev());
	let res = nowLeft.split("px");
	// console.log("res :"+res);
	if (res[0] == 0) {
		latestPlayListMove = 0; //배열이 없다면 계산되지 않음
	}
	latestPlayListMove = res[0];
	latestPlayListMove = Number(latestPlayListMove);//문자열을 숫자로 변환 (현재 ul 의 left값(숫자)이 저장되어있음)

	if (playListMoveFlag) {
		playListMoveFlag = false;
		let length = data.length;
		let splitWord = 0;
		let comparePx = 0;
		console.log(length);

		if (length <= 5) {
			// 자주보는 영화가 5개 이하일때
			$(this).prev().prev().css("left", 0 + "px");
			playListMoveFlag = true;
		} else {
			//자주보는 영화가 5개 초과일 때
			if (length % 5 == 1) {
				splitLength = length - 1;
			} else if (length % 5 == 2) {
				splitLength = length - 2;
			} else if (length % 5 == 3) {
				splitLength = length - 3;
			} else if (length % 5 == 4) {
				splitLength = length - 4;
			} else if (length % 5 == 0) {
				splitLength = length - 5;
			}//if else if else if ... end
			splitWord = splitLength * 209;
			comparePx = latestPlayListMove * (-1) + splitWord; //길이에 맞춰 맞다면 더이상 움직이지 않음
			// console.log(splitWord);

			if (comparePx == width - 209) {
				$(this).css("color", "#9e9e9e");
			}
			$(this).prev().css("color", "white");
			if (comparePx != width) {
				latestPlayListMove -= 209;
				console.log(comparePx);
				console.log(width);
			}

			//console.log("latestPlayListMove :"+latestPlayListMove );
			//console.log( $(this).prev().prev());
			$(this).prev().prev()
					.css("left", latestPlayListMove + "px");
			playListMoveFlag = true;
		}//if else end
	}
}); // $latest_playlist_move_next click() end
let name = [];

let cnt = [];
/* 차트 */
let $favoriteActor = $("#favoriteActor");
$.ajax({
	url : "/ajax/user/${member.no}/actor",
	type : "GET",
	dataType : "json",
	error : function() {
		alert("에러");
	},
	success : function(json) {
		console.log(json);
		if (json.length!=0) {
			$("#favoriteActorWrap").show();
			$.each(json, function(index) {
				name[index] = this.name;
			});

			$.each(json, function(index) {
				cnt[index] = this.no;
			});

			let writeActorDonutData = {
				datasets : [ {
					data : cnt,
					backgroundColor : [ '#EF9A9A', '#90CAF9',
							'#B39DDB', '#E6EE9C', '#86ff5f' ],
					label : 'points',
				} ],
				labels : name
			};//donutData end
			let writeActorDonutChart = new Chart($favoriteActor, {
				type : 'doughnut',
				data : writeActorDonutData,
				options : {
					responsive : true,
					title : {
						display : true,
						text : "${member.nickname} 님이 좋아하는 배우",
						fontSize : 25,
						fontColor : '#231F20',

					},

					cutoutPercentage : 50, // 도넛 가운데 구멍 크기(50은 기본 0은 꽉 막힘)
					rotation : -0.5 * Math.PI, // 시작 각도 변경 (기본: -0.5 * Math.PI)
					onSize : 100,
					animation : {
						animateScale : true,
						animateRotate : true
					}
				// 차트 나타날 때 애니메이션
				}
			});//좋아하는 배우 도넛
		}else{
			$("#favoriteActorWrap").hide();
			
		}
	}
});//ajax end

let $favoriteDirector = $("#favoriteDirector");
$.ajax({
	url : "/ajax/user/${member.no}/director",
	type : "GET",
	dataType : "json",
	error : function() {
		alert("에러");
	},
	success : function(json) {
		console.log(json);
		if (json.length!=0) {
			$("#favoriteDirectorWrap").show();
			$.each(json, function(index) {
				name[index] = this.name;
			});

			$.each(json, function(index) {
				cnt[index] = this.no;
			});

			let writeDirectorDonutData = {
				datasets : [ {
					data : cnt,
					backgroundColor : [ '#EF9A9A', '#90CAF9',
							'#B39DDB', '#E6EE9C', '#86ff5f' ],
					label : 'points',
				} ],
				labels : name
			};//donutData end
			let writeDirectorDonutChart = new Chart($favoriteDirector,
					{
						type : 'doughnut',
						data : writeDirectorDonutData,
						options : {
							responsive : true,
							title : {
								display : true,
								text : "${member.nickname} 님이 좋아하는 감독",
								fontSize : 25,
								fontColor : '#231F20',
							},
							cutoutPercentage : 50, // 도넛 가운데 구멍 크기(50은 기본 0은 꽉 막힘)
							rotation : -0.5 * Math.PI, // 시작 각도 변경 (기본: -0.5 * Math.PI)
							onSize : 100,
							animation : {
								animateScale : true,
								animateRotate : true
							}
						// 차트 나타날 때 애니메이션
						},//options
					});//좋아하는 감독 도넛
		}else{
			$("#favoriteDirectorWrap").hide();
		}
	}
});//ajax end

let $favoriteGenre = $("#favoriteGenre");
$.ajax({
	url : "/ajax/user/${member.no}/genre",
	type : "GET",
	dataType : "json",
	error : function() {
		alert("에러");
	},
	success : function(json) {
		console.log(json);
		if (json.length!=0) {
			$("#favoriteGenreWrap").show();
			$.each(json, function(index) {
				name[index] = this.name;
			});

			$.each(json, function(index) {
				cnt[index] = this.no;
			});

			let writeGenreRadarData = {
				datasets : [ {
					data : cnt,
					backgroundColor : 'rgba(249,172,26, 0.5)',
					label : 'Genres',
				} ],
				labels : name
			};// end

			let writeGenreRadarChart = new Chart($favoriteGenre, {
				type : 'radar',
				data : writeGenreRadarData,
				options : {
					responsive : true,
					title : {
						display : true,
						text : "${member.nickname} 님이 좋아하는 장르",
						fontSize : 25,
						fontColor : '#231F20',
					},
					legend : {
						display : false, //라벨 숨김
					},

					animation : {
						animateScale : true,
						animateRotate : true
					}
				// 차트 나타날 때 애니메이션
				},//options
			});//좋아하는 장르 레이더
		}else{
			$("#favoriteGenreWrap").hide();
		}
	}
});//ajax end
let $streamingGenres = $("#streamingGenres");
$
		.ajax({
			url : "/ajax/user/${member.no}/climing/genre",
			type : "GET",
			dataType : "json",
			error : function() {
				alert("에러");
			},
			success : function(json) {
				
				console.log(json);
				if (json.length!=0) {
					$("#streamingGenresWrap").show();
					$.each(json, function(index) {
						name[index] = this.name;
					});

					$.each(json, function(index) {
						cnt[index] = this.no;
					});
					let writeStreamingGenresChart = new Chart(
							$streamingGenres, {
								type : 'pie',
								data : {
									datasets : [ {
										data : cnt,
										backgroundColor : [ '#EF9A9A',
												'#90CAF9', '#B39DDB',
												'#E6EE9C', '#86ff5f',
												'#ff5ad2' ],
									} ],
									labels : name,
								},
								options : {
									responsive : true,
									title : {
										display : true,
										text : "스트리밍 장르",
										fontSize : 25,
										fontColor : '#231F20',
									},
									animation : {
										animateScale : true,
										animateRotate : true
									}
								},

							});//스트리밍 장르 파이
				}else{
					$("#streamingGenresWrap").hide();
					
				}
			}
		});//ajax end

let $viewersGender = $("#viewersGender");
let writeViewersGenderChart = new Chart($viewersGender, {
	type : 'bar',
	data : {
		datasets : [ {
			data : [ 62, 54, 74, 39, 100 ],
			backgroundColor : '#EF9A9A',
			label : '여자',
		}, {
			data : [ 72, 38, 82, 44, 29 ],
			backgroundColor : '#5099ef',
			label : '남자',
		} ],
		labels : [ "10대", "20대", "30대", "40대", "50대" ]
	},
	options : {
		responsive : true,
		title : {
			display : true,
			text : "연령/성별(%)",
			fontSize : 25,
			fontColor : '#231F20',
		},
		animation : {
			animateScale : true,
			animateRotate : true
		}
	// 차트 나타날 때 애니메이션
	},//options

});//성별에 따른 시청자비율 바

let $avgViewerNumberPerTime = $("#avgViewerNumberPerTime");
let writeAvgViewerNumberPerTimeChart = new Chart(
		$avgViewerNumberPerTime, {
			type : 'bar',
			data : {
				datasets : [ {
					data : [ 62, 54, 74, 39, 12, 78, 92, 90, 34, 42,
							49, 22 ],
					backgroundColor : [ '#EF9A9A', '#EF9A9A',
							'#EF9A9A', '#EF9A9A', '#EF9A9A', '#efb531',
							'#efb531', '#efb531', '#EF9A9A', '#EF9A9A',
							'#EF9A9A', '#EF9A9A', ],
					label : [ '1~3위' ],
				} ],
				labels : [ "00시", "02시", "04시", "06시", "08시", "10시",
						"12시", "14시", "16시", "18시", "20시", "22시" ]
			},
			options : {
				responsive : true,
				title : {
					display : true,
					text : "시간대별 시청자수(평균 인원수)",
					fontSize : 25,
					fontColor : '#231F20',
				},
				legend : {
					display : true,
					fillStyle : 'red', ///라벨 숨김여부
					labels : {
						fontColor : 'blue'
					}
				},

				animation : {
					animateScale : true,
					animateRotate : true
				}
			// 차트 나타날 때 애니메이션
			},//options
		});//시간대별 시청자 평균 바

let $viewersNumberPerTime = $("#viewersNumberPerTime");
let writeViewersNumberPerTimeChart = new Chart($viewersNumberPerTime, {
	type : 'line',
	data : {
		datasets : [
				{
					data : [ 62, 54, 74, 39, 100, 140, 150, 138, 220,
							230, 330, 350, 360 ],
					backgroundColor : '#EF9A9A',
					borderColor : '#EF9A9A',
					label : '여자',
					fill : false,
				},
				{
					data : [ 210, 180, 82, 39, 12, 70, 150, 138, 220,
							190, 300, 380, 340 ],
					backgroundColor : '#5099ef',
					borderColor : '#5099ef',
					label : '남자',
					fill : false,
				} ],
		labels : [ "00시", "02시", "04시", "06시", "08시", "10시", "12시",
				"14시", "16시", "18시", "20시", "22시" ]
	},
	options : {
		responsive : true,
		title : {
			display : true,
			text : "시간대별 남녀 시청자 수",
			fontSize : 25,
			fontColor : '#231F20',
		},
		animation : {
			animateScale : true,
			animateRotate : true
		}
	// 차트 나타날 때 애니메이션
	},//options

});//성별에 따른 시청자비율 바
</script>
</body>
</html>