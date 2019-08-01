<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인페이지</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
	<link rel="stylesheet" href="/css/signup.css">
</head>
<body>
<main id="content">
    <!--###########################################################################코딩시작-->
    <div id="signupLogoImg">
        <a href="index.html"><img src="/img/clim.png"/></a>
    </div>
    <div id="signupWrap">
        <form method="post" action="">
            <fieldset>
                <legend class="screen_out">회원가입폼</legend>
                <div class="signup_row">
                    <label class="label_signup " for="id">이메일</label>
                    <input class="input_signup" id="id" name="id"
                           autocomplete="off"
                           placeholder="이메일를 입력하세요"
                           title="영어,숫자로 4~20자 입력"
                           required/>
                    <button class="Btn" id="signupIdOverlapBtn">중복확인</button>
                    <div class="msg_signup id">이메일을 입력해주세요</div>
                </div><!--//row-->

                <div class="signup_row">
                    <div id="signupPwdInner">
                        <label class="label_signup pwd" for="pwd">비밀번호</label>
                        <input class="input_signup" type="password" id="pwd"
                               placeholder="영어,숫자로 8,12자 입력"
                               title="영어,숫자로 8~12자 입력"
                               name="pwd"
                               required/>
                    </div>

                    <div id="signupPwdConfirmInner">
                        <label class="label_signup " for="confirm">비밀번호 확인</label>
                        <input class="input_signup" type="password" id="confirm"
                               title="비밀번호 확인"
                               placeholder="이전 비밀번호와 동일하게 작성하세요"
                               required/>
                    </div>

                    <div class="msg_signup confirm"></div>
                </div><!--//row-->

                <div class="signup_row">
                    <label class="label_signup " for="nickname">닉네임</label>
                    <input class="input_signup" id="nickname"
                           placeholder="6자 내로 한글,영어,숫자 입력"
                           title="6자 내로 한글,영어,숫자 입력"
                           name="nickname" maxlength="6"/>
                    <button class="Btn" id="signupNicknameOverlap">중복확인</button>
                    <div class="msg_signup nickname ok"></div>
                </div><!--//row-->

                <div class="signup_row">
                    <label class="label_signup ">성별</label>
                    <input class="genderRadio_signup" name="gender"
                           id="female"
                           value="F"
                           checked
                           type="radio"/>
                    <label for="female" class="genderRadio_signup">여성</label>
                    <input  class="genderRadio_signup"name="gender"
                            value="M"
                            id="male" type="radio"/>
                    <label for="male" class="genderRadio_signup">남성</label>
                </div><!--//row-->
                <div class="signup_row" id="">
                    <label class="label_signup ">생년월일</label>
                    <select name="year" id="signupYear"class="input_signup select">
                    </select>
                    <select name="month" id="signupMonth" class="input_signup select">
                    </select>
                    <select name="date"id="signupDate" class="input_signup select">
                    </select>
                </div>

            </fieldset>
        </form>
    </div><!--signupWrap-->
    <button class="label_signup " id="signupBtn">가입하기</button>
</main><!--main-->

<script src="/js/moment-with-locales.js"></script>

<script>
    let $id = $("#id"); //input 요소
    //생년월일 동적 생성
    $(document).ready(function () {
        // setDataBox();
        makeYear(); //한번 호출
        makeMonth(); //한번 호출
        makeDate(); //한번 호출
        $("#id").focus();
    });
    function makeYear() {
        var now = moment();
        var year = now.year();
        for(var i=year ; i>year-116;i--){
            $("#signupYear").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
        }
    }//make year
    function makeMonth() {
        for(var i=1;i<13;i++){
            $("#signupMonth").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }
    }//makeMonth

    function makeDate() {
        var date = $("#signupDate").val();
        //초기화
        $("#signupDate").empty()
        //유저가 선택한 년 을 얻어옴
        var year = $("#signupYear").val();
        //유저가 선택한 월 을 얻어옴
        var month = $("#signupMonth").val();
        var that = moment([year,month-1]);
        $date = $("#signupDate");
        var lastDate = that.endOf("month").date();
        for(var i=1;i<=lastDate;i++){
//            $("<option>").text(i).appendTo("#date");
            var $option =  $("#signupDate").append("<option value='"+ i +"'>"+ i + " 일" +"</option>");
            if(i==date){
                $option.attr("selected",true);
            }
        }
    }
    $("#signupYear").change(makeDate);
    $("#signupMonth").change(makeDate);

    //유효서어어어어엉 검사
    let idFlag=false;
    let nickNameFlag = false;
    let idExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//아이디정규 표현식
    //id정규표현식
    $(function(){
        //id입력창에 글이 써지면 수행하는 함수
        $id.blur(function(){
            let id = $id.val();
            //id값이 공백이 아닐때
            if(id!=''){
                //정규표헌식 검사
                if(idExp.test(id)){
                    idFlag=true;
                    //올바를 경우 id메세지 사라짐
                    $(".id").text('');
                }
                else{
                    //id가 정규표현식에 맞지 않을때
                    //메세지 띄워주고 입력창에 글씨 사라지면서 포커스 맞춤
                    $(".id").text("이메일형식에 맞게 입력해주세요 :(").css("color","#F16B6F");
                    $id.val('');
                    $id.focus();
                    idFlag=false;
                }
            }
        });
    });

    //아이디 중복검사 버튼 눌렀을때 실행되는 이벤트
    $("#signupIdOverlapBtn").click(function () {
        //정규표현식에 맞을 경우에만 실행
        if(idFlag){
            //멤버json가져오기
            $.ajax({
                url:"json/member.json",
                dataType:"json",
                type:"GET",
                success : function(json) {
                    let idValue="";
                    //입력한 아이디가 멤버에 존재할 경우
                    _.each(json,function (info) {
                        if($id.val()==info.id){
                            idValue=$id.val();
                        }
                    });
                    if(idValue!=""){
                        $(".id").text("중복된 이메일입니다. :(").css("color","#F16B6F");
                        $id.val('');
                        $id.focus();
                        return false;
                    }
                    else if(idValue==""){
                        $(".id").text("사용 가능한 이메일입니다. :)").css("color","#AACD6E");
                    }
                },
                error : function() {
                    alert("서버점검중");
                }
            });
        }
    });


    let $pwd = $("#pwd");
    let pwdExp = /^[A-Za-z0-9+]{8,12}$/;
    //pwd정규표현식
    $(function(){
        $pwd.blur(function(){
            let pwd = $pwd.val();
            if(pwd!=''){
                if(pwdExp.test(pwd)){
                    // alert("올바름"+id);
                    $(".confirm").text('');
                }
                else{
                    // alert("올바르지 않음"+id);
                    $(".confirm").text("영어,숫자로 8~12자 입력해주세요 :(").css("color","#F16B6F");
                    $pwd.val('');
                    $pwd.focus();
                }
            }
        });
    });

    //비밀번호 확인
    $(function(){
        $('#confirm').blur(function(){
            if($('#pwd').val() != $('#confirm').val()){
                if($('#confirm').val()!=''){
                    $(".confirm").text("비밀번호가 일치하지 않습니다. :(").css("color","#F16B6F");
                    $('#confirm').val('');
                    $('#confirm').focus();
                }
            }
            else{
                if($('#confirm').val()!='') {
                    $(".confirm").text("비밀번호가 일치합니다. :)").css("color", "#AACD6E");
                }else{
                    $(".confirm").text("비밀번호를 입력해주세요 :(").css("color","#F16B6F");
                    $('#pwd').val('');
                    $('#pwd').focus();
                }
            }
        });
    });

    //닉네임 정규표현식[가-힣|0-9]
    let $nickname = $("#nickname");
    let nicknameExp = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;

    $(function(){
        $nickname.blur(function(){
            let nickname = $nickname.val();
            if(nickname!=''){
                if(nicknameExp.test(nickname)){
                    $(".nickname").text('');
                    nickNameFlag=true;
                }
                else{
                    $(".nickname").text("2~6자리 한글 영어 숫자로 입력해주세요 :(").css("color","#F16B6F");
                    $nickname.val('');
                    $nickname.focus();
                }
            }
        });
    });
    $("#signupNicknameOverlap").click(function (e) {
        let $nickname = $("#nickname");
        if(nickNameFlag){

            $.ajax({
                url:"json/member.json",
                dataType:"json",
                type:"GET",
                success : function(json) {
                    let nickFlag="";
                    _.each(json,function (info) {
                        if($nickname.val()==info.nickName){
                            nickFlag=$nickname.val();
                        }
                    });
                    if(nickFlag!=""){
                        $(".nickname").text("중복된 닉네임입니다. :(").css("color","#F16B6F");
                        $nickname.val('');
                        $nickname.focus();
                    }
                    else if(nickFlag==""){
                        $(".nickname").text("사용 가능한 닉네임입니다. :)").css("color","#AACD6E");
                    }
                },
                error : function() {
                    alert("서버점검중");
                }
            });
        }
        e.preventDefault();
    });



</script>

</body>
</html>