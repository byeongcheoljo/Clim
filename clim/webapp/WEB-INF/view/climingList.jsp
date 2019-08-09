<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>클리밍List</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/climingList.css" />
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<main id="content">
		<div id="contentWrap">
			<div id="hotSection" class="index_section">
	
				<ul id="userStreamBox">
				</ul><!-- //userStreamBox end -->
			</div><!-- //hotSection end --> 
		</div><!-- contentWrap -->
	</main>
	<c:import url="/WEB-INF/template/footer.jsp" />
	<script type="text/tempate" id="climingListTmp">
<@_.each(clims,function(clim){@>
 <li class="user_streaming_card">
	<a>
            <div class="streaming_img">
                <img class="streaming_poster" src="<@=clim.poster@>"/>
                <img class="streaming_thumbnail" src="<@=clim.stealcut@>"/>
            </div>
            <div class="streaming_info">
                <div class="streaming_tit">[<@=clim.genre@>]<@=clim.title@></div>
                <div class="streaming_user"><@=clim.nickname@></div>
                <div class="streaming_cnt"><i class="fas fa-user-friends"></i><@=clim.viewerCount@></div>
            </div>
	</a>
        </li>
        <@});@>
    </script>

	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.js"></script>
	<script src="/js/sockjs.min.js"></script>
	<script src="/js/stomp.min.js"></script>
	<script>
		moment.locale("ko");
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		const $climingListTmp = _.template($("#climingListTmp").html());
		const $userStreamBox = $("#userStreamBox");


		function connect(callback) {
			let socket = new SockJS('/clim');
			stompClient = Stomp.over(socket);
			console.log(socket);
			console.log(stompClient);

			stompClient.connect({}, function() {

				//콜백 함수 호출
				if (callback)	callback;
			});
		};//fn connect end
		
		connect(function(){
			//SockJS와 stompclient를 통해 연결을 시도(구독)
			stompClient.subscribe("/topic/climing/set/feature", function(
					protocol) {
				console.log("구독완료!");

			}); //subscribe fn end
		});//connect function end

		function getList() {

			$.ajax({
				url : "/ajax/climing",
				dataType : "json",
				type : "get",
				error : function() {
					alert("서버 점검중");
				},//error end
				success : function(json) {
					console.log("제이슨");
					console.log(json);
					stompClient.send("/app/climing/request/feature", {}, {});

					$.each(json, function(idx) {

						stompClient.subscribe("/topic/climing/get/feature",
								function(protocol) {
									console.log("구독완료!");

									console.log(protocol.body);//movie객체

									const json = JSON.parse(protocol.body);

									alert("sdfasfd");

									$(".user_streaming_card").eq(idx).find(
											".streaming_poster")
											.attr("src", "")

								}); //connect function end
					});//each end

					$userStreamBox.html($climingListTmp({"clims" : json	}));
				}//success end
			});
		}//fn getList end
		getList();
	</script>
</body>
</html>