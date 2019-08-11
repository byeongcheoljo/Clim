<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://vjs.zencdn.net/7.6.0/video-js.css" rel="stylesheet">
    <script src='https://vjs.zencdn.net/7.6.0/video.js'></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <style>
        #my-player {
            width:1080px;
            margin : auto;
        }

        .video-js .vjs-big-play-button {
            top:50%;
            left:50%;
            margin:-22.5px 0 0 -43px;
        }

        .video-js .vjs-title-bar {
            background: rgba(0, 0, 0, 0.5);
            color: white;

            /*
              By default, do not show the title bar.
            */
            display: none;
            font-size: 2em;
            padding: .5em;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
        }

        .video-js.vjs-paused.vjs-has-started .vjs-title-bar,
        .video-js.vjs-user-active.vjs-has-started .vjs-title-bar{
            display: block;
        }

        .video-js.vjs-has-started .vjs-move-btn {
            position: absolute;
            right:20px;
            bottom:50px;
            width:100px;
            height:40px;
            background: #F9AC1A;
            cursor: pointer;
            font-size:20px;
            opacity: 0;
            transition:opacity .2s ease;
        }

        .video-js.vjs-user-active.vjs-has-started .vjs-move-btn{
            opacity: 1;
        }
        .vjs-menu-content{
            z-index: 999;
        }
    </style>
</head>
<body>
<video id="my-player" class="video-js"
       poster="/posters"
       controls preload="auto" autoplay
       data-setup='{"example_option":true}'>
    <source src="/video/Deadpool.2016.720p.HC.HDRip.800MB.MkvCage.mkv" type="video/mkv" />

    <track kind="subtitles" src="/vtt/pacman-ko.vtt" srclang="ko" label="한글" default>
    <track kind="subtitles" src="/vtt/pacman-en.vtt" srclang="en" label="영어" >
</video>
<script>

    //API
    //https://docs.videojs.com/tutorial-components.html#

    //기본 컴포넌트를 얻어옴
    const Component = videojs.getComponent('Component');
    const button = videojs.getComponent('Button');
    //MoveButton
    const MoveButton = videojs.extend(button,{
        createEl: function() {
            return videojs.createEl('button', {
                className: 'vjs-move-btn',
                innerText:"넘기기"
            });
        },
        handleClick: function(){
            this.player().currentTime(15);
        }
    });//MyButton() end

    //TitleBar
    const TitleBar = videojs.extend(Component, {
        constructor: function(player, options) {
            Component.apply(this, arguments);

            if (options.text) {

                if (typeof text !== 'string') {
                    text = 'Title Unknown';
                }//if end

                videojs.appendContent(this.el(), options.text);
            }//if end
        },
        createEl: function() {
            return videojs.createEl('div', {
                className: 'vjs-title-bar'
            });
        }
    });//TitleBar end



    const PrevBtn = videojs.extend(button, {
        createEl: function() {
            return videojs.createEl('button', {
                className: 'vjs-control vjs-menu-button vjs-button',
                innerHTML:"<i class='fas fa-undo-alt'></i>",
            });
        },
        handleClick: function(){
            const time = this.player().currentTime();
            this.player().currentTime(time-10);
        }
    });
    const NextBtn = videojs.extend(button, {
        createEl: function() {
            return videojs.createEl('button', {
                className: 'vjs-control vjs-menu-button vjs-button',
                innerHTML:"<i class=\"fas fa-redo-alt\"></i>",
            });
        },
        handleClick: function(){
            const time = this.player().currentTime();
            this.player().currentTime(time+10);
        }
    });

    //videojs에 컴포넌트 등록
    videojs.registerComponent('PrevBtn', PrevBtn);
    videojs.registerComponent('NextBtn', NextBtn);
    videojs.registerComponent('TitleBar', TitleBar);
    videojs.registerComponent('MoveButton', MoveButton);

    videojs.getComponent('ControlBar').prototype.options_ = {
        loadEvent: 'play',
        children: [
            'playToggle',
            'muteToggle',
            'volumeControl',
            'PrevBtn',
            'NextBtn',
            'progressControl',
            'subsCapsButton',
            'pictureInPictureToggle',
            'fullscreenToggle'
        ]
    }

    //children: ['playToggle', 'volumePanel', 'currentTimeDisplay', 'timeDivider', 'durationDisplay', 'progressControl', 'liveDisplay', 'seekToLive', 'remainingTimeDisplay', 'customControlSpacer', 'playbackRateMenuButton', 'chaptersButton', 'descriptionsButton', 'subsCapsButton', 'audioTrackButton', 'pictureInPictureToggle', 'fullscreenToggle']



    //실제 플레이어
    const player = videojs('my-player');

    //컴포넌트를 자식으로 추가
    player.addChild('TitleBar', {text: '라이온킹'});

    //컴포넌트를 자식으로 추가
    const moveButton = player.addChild('MoveButton');

    // //이벤트리스너 붙이기
    // moveButton.on("click",function () {
    //     //15초로 이동
    //    player.currentTime(15);
    // });//click() end

</script>
</body>
</html>