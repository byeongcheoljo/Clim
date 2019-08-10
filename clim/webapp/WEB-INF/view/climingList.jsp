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
	<script type="text/template" id="climingListTmp">
 	<li class="user_streaming_card">
		<a>
            <div class="streaming_img">
                <img class="streaming_poster" src="/posters<@=clim.poster@>"/>
                <img class="streaming_thumbnail" src="/snapshot/<@=clim.stealcut@>"/>
            </div>
            <div class="streaming_info">
                <div class="streaming_tit">[<@=clim.genre@>]<@=clim.title@></div>
                <div class="streaming_user"><@=clim.nickname@></div>
                <div class="streaming_cnt"><i class="fas fa-user-friends"></i><@=clim.viewerCount@></div>
            </div>
		</a>
    </li>
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

		connect(function(){
			
			console.log("커넥션 끝나고 난 후");
		
			stompClient.send("/app/climing/request/feature", {});
			
			//SockJS와 stompclient를 통해 연결을 시도(구독)
			stompClient.subscribe("/topic/climing/get/feature", function(p) {
				
				console.log(p.body);
				
				const json = JSON.parse(p.body);
				
				$userStreamBox.append($climingListTmp({"clim" : json	}));
				
				$userStreamBox.on("click", $(".streaming_img"), function(){
					//alert("test");
					location.href = "/room/"+json.no; //클릭시 방으로 이동
					
				});// img click fn() end
				
			}); //subscribe fn end
			
		});//connect function end

		
		
		</script>
</body>
</html>