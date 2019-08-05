<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>클리밍List</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/climingList.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main id="content">
<div id="contentWrap"></div>
	<div id="hotSection" class="index_section">

    <ul id="userStreamBox">



    </ul><!-- //userStreamBox end -->
</div><!-- //hotSection end -->
<!-- contentWrap -->
</main>
<c:import url="/WEB-INF/template/footer.jsp"/>
    <script type="text/tempate" id="climingListTmp">
<@_.each(clims,function(clim){@>
 <li class="user_streaming_card">
	<a>
            <div class="streaming_img">
                <img class="streaming_poster" src="/poster/<@=clim.poster@>"/>
                <img class="streaming_thumbnail" src="/img/<@=clim.thumbnail@>"/>
            </div>
            <div class="streaming_info">
                <div class="streaming_tit">[<@=clim.genre@>]<@=clim.title@></div>
                <div class="streaming_user"><@=clim.nickname@></div>
                <div class="streaming_cnt"><i class="fas fa-user-friends"></i><@=clim.cnt@></div>
            </div>
	</a>
        </li>
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
    
    const $climingListTmp = _.template($("#climingListTmp").html());
    const $userStreamBox = $("#userStreamBox");
   
    
    function getList(){
    	/*유저 번호 변수로 지정할 것*/
        const memberNo = 7;

        $.ajax({
            url: "/ajax/climing/member/"+memberNo,
            dataType: "json",
            type: "get",
            error: function () {
                alert("서버 점검중");
            },//error end
            success: function (json) {
            	//console.log(json);
                $userStreamBox.html($climingListTmp({
                    "clims": json
                }));
                
            }//success end
        });
    }//fn getList end
    getList();
    
    
    




</script>
</body>
</html>