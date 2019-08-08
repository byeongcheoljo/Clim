<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>payment</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
<link rel="stylesheet" href="/css/payment.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main id="content">
    <ul id="headerNavMypage">
        <li id="nicknameHeaderMypage">${loginMember.nickname}</li>
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
            <h2>나의 결재 정보 </h2>
            <c:choose>

            	
             <c:when test="${member.grade==69}">
  				<h4>현재 이코노미 멤버쉽을 이용중입니다.</h4>
				<p>*매월 <fmt:formatDate value="${member.regdate}" pattern="dd"/>일에 자동 결제 됩니다.</p>
				<button class="payment_btn update">수정</button>
				<form action="/user/${loginMember.no}/payment" method="post">
				<button class="payment_btn terminate">해지</button>
				<input type=hidden name="_method" value="delete">
				</form>
             </c:when>
             
             <c:when test="${member.grade==83}">
  				<h4>현재 스탠다드 멤버쉽을 이용중입니다.</h4>
				<p>*매월 <fmt:formatDate value="${member.regdate}" pattern="dd"/>일에 자동 결제 됩니다.</p>
				<button class="payment_btn update">수정</button>
				<form action="/user/${loginMember.no}/payment" method="post">
				<button class="payment_btn terminate">해지</button>
				<input type=hidden name="_method" value="delete">
				</form>
             </c:when>
             
             <c:when test="${member.grade==80}">
  				<h4>현재 프라임 멤버쉽을 이용중입니다.</h4>
				<p>*매월 <fmt:formatDate value="${member.regdate}" pattern="dd"/>일에 자동 결제 됩니다.</p>
				<button class="payment_btn update">수정</button>
				<form action="/user/${loginMember.no}/payment" method="post">
				<button class="payment_btn terminate">해지</button>
				<input type=hidden name="_method" value="delete">
				</form>
             </c:when>
             <c:otherwise>
           
                       <p>현재 멤버쉽을 이용중이지 않습니다.</p>
                       <button class="payment_btn writer">등록하기</button>
         
             </c:otherwise>
             </c:choose>
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
        <form action="/user/${loginMember.no}/payment" method="post">
            <h2>이용할 멤버쉽을 선택해 주세요.</h2>
            <ul id="paymentFormTap"><!--  li 쓰면 안됨  ajax로... -->
            	<label>
               <input type="radio" name="grade" value="E"><li class="membership_tap tap_on"  >이코노미</li> </input>
               </label>
               <label>
               <input type="radio" name="grade" value="S"><li class="membership_tap" >스탠다드</li></input>
               </label>
               <label>
               <input type="radio" name="grade" value="P"> <li class="membership_tap" >프라임</li></input>
               </label>
               
<!-- 				<input type="radio" name="grade" value="E">이코노미</input> -->
<!-- 				<input type="radio" name="grade" value="S">스탠다드</input> -->
<!-- 				<input type="radio" name="grade" value="P">프라임</input> -->
            </ul>
            <p id="membershipCard">
                <strong>카드사</strong>
                <button class="payment_btn select" type="button">선택하기</button>
            <ul id="membershipCardList"> <!--  li 쓰면 안됨  ajax로... -->
            	
            	<label>
                <input name="card" type="radio" value="0"><li>KB국민</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="1"><li>농협</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="2"><li>신한</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="3"> <li>현대</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="4"><li>롯데</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="5"><li>우리</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="6"><li>KEB외환</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="7"> <li>조흥</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="8"><li>카카오</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="9"><li>하나</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="10"><li>BC</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="11"><li>기업</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="12"><li>씨티</li></input>
                </label>
                
                <label>
                <input name="card" type="radio" value="13"><li>JBP</li></input>
                </label>
                
                
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
 	<c:import url="/WEB-INF/template/footer.jsp" /> </main> 
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