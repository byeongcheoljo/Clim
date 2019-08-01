<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/pwdUpdate.css">
</head>
<body>


<div id="passwordUpdateBox">
    <h1>비밀번호 변경</h1>
    <form method="">
        <input id="pwdUpdate" class="input_signup" type="password"
               placeholder="영어,숫자로 8,12자 입력"
               title="영어,숫자로 8~12자 입력"
               name="pwd"
               maxlength="12"
               required/>

        <input id="pwdConfirm" class="input_signup" type="password"
               title="비밀번호 확인"
               placeholder="이전 비밀번호와 동일하게 작성하세요"
               maxlength="12"
               required/>

        <div class="msg_signup confirm"></div>

        <button id="passwordUpdateBtn">변경하기</button>
    </form>
</div>


<script>
    let $pwdUpdate = $("#pwdUpdate");
    //pwdUpdateExp 정규표현식
    let pwdUpdateExp = /^[A-Za-z0-9+]{8,12}$/;

    $(function(){
        $pwdUpdate.blur(function(){
            let pwd = $pwdUpdate.val();
            if(pwd!=''){
                if(pwdUpdateExp.test(pwd)){
                    // alert("올바름"+id);
                    $(".confirm").text('');
                }
                else{
                    // alert("올바르지 않음"+id);
                    $(".confirm").text("영어,숫자로 8~12자 입력해주세요 :(").css("color","#F16B6F");
                    $pwdUpdate.val('');
                    $pwdUpdate.focus();
                }
            }
        });
    });

    //비밀번호 확인
    $(function(){
        $('#confirm').blur(function(){
            if($('#pwdUpdate').val() != $('#pwdConfirm').val()){
                if($('#pwdConfirm').val()!=''){
                    $(".confirm").text("비밀번호가 일치하지 않습니다. :(").css("color","#F16B6F");
                    $('#pwdConfirm').val('');
                    $('#pwdConfirm').focus();
                }
            }
            else{
                if($('#pwdConfirm').val()!='') {
                    $(".confirm").text("비밀번호가 일치합니다. :)").css("color", "#AACD6E");
                }else{
                    $(".confirm").text("비밀번호를 입력해주세요 :(").css("color","#F16B6F");
                    $('#pwdConfirm').val('');
                    $('#pwdConfirm').focus();
                }
            }
        });
    });

    $("#passwordUpdateBtn").click(function () {
       location.href="www.naver.com";
    });


</script>

</body>
</html>