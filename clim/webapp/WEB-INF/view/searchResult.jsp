<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>searchResult</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/searchResult.css"/>
</head>
<body>

    <main id="main">
        <div id="searchResult">
            <span>#스파이더맨</span>
            <ul>
                <li class="clim_card">
                    <img src="/poster/spiderman.jpg"/>
                    <div class="top_border border_box"></div>
                    <div class="right_border border_box"></div>
                    <div class="bottom_border border_box"></div>
                    <div class="left_border border_box"></div>
                </li>
                <li class="streaming_hot_card">
                    <img src="/img/spider1.jpg"/>
                    <div class="streaming_icon">LIVE</div>
                    <div class="top_border border_box"></div>
                    <div class="right_border border_box"></div>
                    <div class="bottom_border border_box"></div>
                    <div class="left_border border_box"></div>
                </li>
                <li class="clim_card">
                    <img src="poster/spiderman.jpg"/>
                    <div class="top_border border_box"></div>
                    <div class="right_border border_box"></div>
                    <div class="bottom_border border_box"></div>
                    <div class="left_border border_box"></div>
                </li>
                <li class="streaming_hot_card">
                    <img src="/img/spider2.jpg"/>
                    <div class="streaming_icon">LIVE</div>
                    <div class="top_border border_box"></div>
                    <div class="right_border border_box"></div>
                    <div class="bottom_border border_box"></div>
                    <div class="left_border border_box"></div>
                </li>
                <li class="clim_card">
                    <img src="/poster/spiderman.jpg"/>
                    <div class="top_border border_box"></div>
                    <div class="right_border border_box"></div>
                    <div class="bottom_border border_box"></div>
                    <div class="left_border border_box"></div>
                </li>
                <li class="streaming_hot_card">
                    <img src="/img/spider3.jpg"/>
                    <div class="streaming_icon">LIVE</div>
                    <div class="top_border border_box"></div>
                    <div class="right_border border_box"></div>
                    <div class="bottom_border border_box"></div>
                    <div class="left_border border_box"></div>
                </li>
            </ul>
        </div>
        <div class="trailer_bg">
            <div class="bg_close_btn"><i class="far fa-times-circle"></i></div>
        </div>
    </main>
<script src="/js/jquery.js"></script>
<script>
    const $trailerBg = $(".trailer_bg");

    let timer;
    let timer2;
    let timer3;
    let timer4;
    let timer5;
    $("#main").on("mouseenter",".clim_card, .streaming_hot_card",function(){
        $this = $(this);
        timer = setTimeout(function() {
            $trailerBg.fadeIn(100);
        }, 2000);
        timer2 = setTimeout(function(){
            console.log($(this).children('.top_border'));
            $this.children('.top_border').css({width:"297px", border:"1.5px solid #F9AC1A"});
        },0);
        timer3 = setTimeout(function(){
            $this.children('.right_border').css({height:"187px", border:"1.5px solid #F9AC1A"});
        },500);
        timer4 = setTimeout(function(){
            $this.children('.bottom_border').css({width:"297px", border:"1.5px solid #F9AC1A"});
        },1000);
        timer5 = setTimeout(function(){
            $this.children('.left_border').css({height:"187px", border:"1.5px solid #F9AC1A"});
        },1500);
    }).on("mouseleave",".clim_card, .streaming_hot_card", function(){
        clearTimeout(timer);
        clearTimeout(timer2);
        clearTimeout(timer3);
        clearTimeout(timer4);
        clearTimeout(timer5);

        $(".top_border, .left_border, .right_border, .bottom_border").css({width:"0", height:"0", border:"transparent"});
    }); // 2초 시간 체크 하기 mouseenter, mouseleave감지
    $("#main").on("click",".bg_close_btn",function(){
        $(this).parent().fadeOut(100);
    })
</script>
</body>
</html>