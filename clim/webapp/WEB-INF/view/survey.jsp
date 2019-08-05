<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>설문조사</title>
<!--프로그래스 바 CSS-->
	<c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--  <link rel="stylesheet" href="css/resources/demos/style.css">-->
	<link rel="stylesheet" href="/css/survey.css">
	
<!--프로그래스 바 CSS end-->
    
</head>
<body>
<main id="content">
<input type="hidden" name="memberNo">

    <div class="header_logo_survey">
        <img src="/img/clim%20logo.png"><br>
        <span id="currentCheeckedMovieNum">0/15</span><br>
        <span id="signTextSurvey">15개의 작품을 평가해 보세요.</span>
        <a id="doneSurveyHrefBtn">
            <button class="done_button_survey btn">완료</button>
        </a>
    </div>

    <div>
        <div id="progressbar"></div>
    </div>

    <div class="movieSection_survey">
        <ul id="movieListUlSurvey">

        </ul>
    </div>

    <script type="text/tempate" id="surveyMovieTmp">
    <@_.each(movies,function(movie){ @>
         <li class="survey_movie_li">
                <div class="survey_movie_img"><img src="/poster/<@=movie.poster@>"></div>

                <div class="survey_movie_info"><strong class="movie_title_survey"><@=movie.title@></strong>
                    <p>
                        <span class="movie_title_openDay">2019</span>
                    <p>
                        <span class="movie_title_contry">미국</span>
                    <p>
                    <span class="movie_title_score">
                        <div class="starRev">
                          <span class="starR1">별1_왼쪽</span>
                          <span class="starR2">별1_오른쪽</span>
                          <span class="starR1">별2_왼쪽</span>
                          <span class="starR2">별2_오른쪽</span>
                          <span class="starR1">별3_왼쪽</span>
                          <span class="starR2">별3_오른쪽</span>
                          <span class="starR1">별4_왼쪽</span>
                          <span class="starR2">별4_오른쪽</span>
                          <span class="starR1">별5_왼쪽</span>
                          <span class="starR2">별5_오른쪽</span>
                        </div>
                    </span>
                </div>
            </li>

         <@});@>

    </script>

</main>
<script src="/js/moment-with-locales.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    moment.locale("ko");
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
    
    const url = window.location.href;
    
    let array = url.split("/");
    
    console.log(array);
    console.log(array[4]);
    
    let memberNo = array[4];

    //////////////////movie List json///////////////////////
    const $surveyMovieTmp = _.template($("#surveyMovieTmp").html());
    const $movieListUlSurvey = $("#movieListUlSurvey");
    const $ul = $("#movieSection_survey ul");
    let pageNo = 1;//현재 페이지
    let flag = true;
    function getMovieList(){
        if(flag){
            flag = false;
		
        $.ajax({
            url: "/ajax/user/survey",
            dataType: "json",
            type: "get",
            data:{page: pageNo++},
            error: function () {
                alert("서버 점검중");
            },//error end
            success: function (json) {
                console.log(json)
                
                
               
                $movieListUlSurvey.append($surveyMovieTmp({
                    "movies": json
                })); 
                flag = true;

            }//success end
        });//ajax end
        }//if(flag) end
    }//function getMovieList end
    getMovieList();//한번 호출
    //무한스크롤
    let $window = $(window);
    let $document = $(document);
    $window.scroll(function () {
        let sTop = $window.scrollTop();
        let $dHeight = $document.height();
        let $wHeight = $window.height();

        if($dHeight<=$wHeight+sTop+30) {

            getMovieList();
        }//if end
    });//scroll() end
    //////////////////movie List json end///////////////////////






    //////////////////별 체크하면 총 개수 변환 ///////////////////////
    var cnt=0;
    //별 스크립트
    $("#movieListUlSurvey").on("click",'.starRev span',function(){
        if($(this).parent().hasClass('clicked')){
            //영화 평점을 여러번 눌렀을 경우
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
        }else{
            //영화 평점을 첫번째 눌렀을 경우
            $(this).parent().addClass('clicked');
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            ++cnt;
            var progressValue = 100/15*cnt
            $("#currentCheeckedMovieNum").text(cnt+'/15');
            $( "#progressbar" ).progressbar({
                value: progressValue

            });
        }

        // var num = $(this).parent().children('.on').length;
        // console.log(num);
        return false;
    });
    //별 스크립트 end




    $(function() {
        $( "#progressbar" ).progressbar({
            value: 0

        });
    } );



    //////////////////별 체크하면 총 개수 변환 end///////////////////////

    //별 스크립트
    $("#movieListUlSurvey").on("click",'.starRev span',function(){
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });
    //별 스크립트 end
</script>
</body>
</html>