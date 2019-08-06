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
<div id="hotSection" class="index_section">

    <ul id="userStreamBox">



    </ul><!-- //userStreamBox end -->
</div><!-- //hotSection end -->

</main>
<c:import url="/WEB-INF/template/footer.jsp"/>
    <script type="text/tempate" id="climingListTmp">
<@_.each(climes,function(clime){@>
 <li class="user_streaming_card">
	<a>
            <div class="streaming_img">
                <img class="streaming_poster" src="/poster/<@=clime.poster@>"/>
                <img class="streaming_thumbnail" src="/img/<@=clime.thumbnail@>"/>
            </div>
            <div class="streaming_info">
                <div class="streaming_tit">[<@=clime.genre@>]<@=clime.tit@></div>
                <div class="streaming_user"><@=clime.nickname@></div>
                <div class="streaming_cnt"><i class="fas fa-user-friends"></i><@=clime.cnt@></div>
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

    $.ajax({
        url: "/ajax/user/bookmark/${memberNo}",
        dataType: "json",
        type: "get",
        error: function () {
            alert("서버 점검중");
        },//error end
        success: function (json) {
            $userStreamBox.html($climingListTmp({
                "climes": json
            }));


        }//success end
    });




</script>
</body>
</html>