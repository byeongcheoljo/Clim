<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>payment</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
<link rel="stylesheet" href="/css/payment.css">
</head>
<body>
<main id="content">
    <ul id="headerNavMypage">
        <li id="nicknameHeaderMypage">닉네임</li>
        <li>홈</li>
        <li>찜</li>
        <li>커뮤니티</li>
        <li>정보수정</li>
        <li>FAQ</li>
        <li class="header_myPage_tabbed">결제</li>
    </ul>
    <div id="paymentWrap">
        <div id="paymentInformationBox">
            <!--###등급이 없는 경우-->
            <h2>나의 결재 정보</h2>
                       <p>현재 멤버쉽을 이용중이지 않습니다.</p>
                       <button class="payment_btn writer">등록하기</button>
            <!--####등급이 있는 경우-->
<!--            <h4>현재 프라임 멤버쉽을 이용중입니다.</h4>-->
<!--            <p>*매월 8일에 자동 결제 됩니다.</p>-->
<!--            <button class="payment_btn update">수정</button>-->
<!--            <button class="payment_btn terminate">해지</button>-->

        </div>
        <div id="membershipBox">
            <table id="membershipTable">
                <thead>
                <th>멤버쉽</th>
                <th>혜택</th>
                <th>가격</th>
                </thead>
                <tbody>
                <tr>
                    <td>이코노미</td>
                    <td>중간화질(720p)로 영화를 시청할 수 있습니다.</td>
                    <td>3,000원</td>
                </tr>
                <tr>
                    <td>스텐다드</td>
                    <td>고화질(1080p)로 영화를 시청할 수 있습니다.</td>
                    <td>7,000원</td>
                </tr>
                <tr>
                    <td>프라임</td>
                    <td>광고없이 영화를 시청할 수 있습니다.<br>상황에 따라 화질을 선택할 수 있습니다.<br>방송을 할 수 있습니다.</td>
                    <td>10,000원</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</main>
<div id="bg">
    <div id="paymentForm">
        <i class="fas fa-times-circle"></i>
        <form action="">
            <h2>이용할 멤버쉽을 선택해 주세요.</h2>
            <ul id="paymentFormTap">
                <li class="membership_tap tap_on">이코노미</li>
                <li class="membership_tap">스탠다드</li>
                <li class="membership_tap">프라임</li>
            </ul>
            <p id="membershipCard">
                <strong>카드사</strong>
                <button class="payment_btn select" type="button">선택하기</button>
            <ul id="membershipCardList">
                <li><input name="card" type="radio">KB국민</input></li>
                <li><input name="card" type="radio">농협</input></li>
                <li><input name="card" type="radio">신한</input></li>
                <li><input name="card" type="radio">현대</input></li>
                <li><input name="card" type="radio">롯데</input></li>
                <li><input name="card" type="radio">우리</input></li>
                <li><input name="card" type="radio">KEB외환</input></li>
                <li><input name="card" type="radio">조흥</input></li>
                <li><input name="card" type="radio">카카오</input></li>
                <li><input name="card" type="radio">하나</input></li>
                <li><input name="card" type="radio">BC</input></li>
                <li><input name="card" type="radio">기업</input></li>
                <li><input name="card" type="radio">씨티</input></li>
                <li><input name="card" type="radio">JBP</input></li>
            </ul>
            </p>
            <p>
                <strong>카드번호</strong>
                <input min="1" max="9999" name="cardNum1" type="number">
                <input min="1" max="9999" name="cardNum2" type="number">
                <input min="1" max="9999" name="cardNum3" type="number">
                <input min="1" max="9999" name="cardNum4" type="number">
            </p>
            <p>
                <strong>유효기간</strong>
                <input min="01" max="12" name="validMonth" type="number" placeholder="MM">
                <input min="00" max="99" name="validYear" type="number" placeholder="YY">
            </p>
            <p>
                <strong>비밀번호</strong>
                <input name="pwd" type="password">**
            </p>
            <p>
                <strong>CVC</strong>
                <input min="001" max="999" name="cvc" type="number">
                <span>뒤 3자
                    리를 입력해주세요.</span>
            </p>
            <p id="pay">
                결재금액 <strong>3,000원</strong>
            </p>
            <p id="grade">
                *<strong>이코노미</strong> 멤버쉽을 선택하셨습니다.<br>위와 같이 결제가 됩니다.
            </p>
            <button class="payment_btn payment">결제하기</button>
        </form>
    </div>
</div>
<!-- 	<c:import url="/WEB-INF/template/footer.jsp" /> </main> -->
	<script>
		$("#paymentFormTap li").click(function() {
			//4px solid #F9AC1A
			$("li").removeClass('tap_on');
			$(this).addClass('tap_on');
			let grade = $(this).text();
			$("#grade strong").text(grade);
			if (grade == "이코노미") {
				$("#pay strong").text("3,000원");
			} else if (grade == "스탠다드") {
				$("#pay strong").text("7,000원");
			} else if (grade == "프라임") {
				$("#pay strong").text("10,000원");
			}
		});

		$(".select").on("click", function() {
			$("#membershipCardList").toggle();
		});

		$("#membershipCardList li").on("click", function() {
			let name = $(this).text();
			$("#membershipCardList li").removeClass("on");
			$(this).addClass("on");

			$("#membershipCardList").hide();
			$(".select").text(name);

		});

		$(".fa-times-circle").on("click", function() {
			$("#bg").hide();
		});

		$(".writer").on("click", function() {
			$("#bg").show();
		});

		$(".update").on("click", function() {
			$("#bg").show();
		});
	</script>
</body>
</html>