<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>preview</title>
<link rel="stylesheet" href="/css/reset.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/preview.css">
</head>
<body>
	<main id="content">
	<div id="bg">
		<div id="previewSection">
			<div id="movieInformationWrap">
				<div id="movieTitle">
					<strong>스파이더맨(2019)</strong>
				</div>
				<ul id="movieInformationBox">
					<li>평균 평점 <span><i class="fas fa-star"></i> 3.5</span> <span
						id="age">12세 관람가</span></li>
					<li>상영시간 <span>167분</span></li>
					<li>감독
						<div id="director">
							<span><a href="">존 왓츠</a></span><span><a href="">존 왓츠</a></span><span><a
								href="">존 왓츠</a></span><span><a href="">존 왓츠</a></span><span><a
								href="">존 왓츠</a></span><span><a href="">존 왓츠</a></span><span><a
								href="">존 왓츠</a></span><span><a href="">존 왓츠</a></span>
						</div>
					</li>
					<li>배우
						<div id="actor">
							<span><a href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span><span><a href="">승현</a></span><span><a
								href="">승현</a></span>
						</div>
					</li>
					<li>줄거리
						<p>
							adadadfasdadadadfasdfasdadadadadadfasdfasdadadadfaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadaadadadfasdfasdadadadfasdfasdadadfasdfasdadadadfasdfasdadadadadfasdfasdadadadfasdfasdadadfasdfasdadadadfadadadfasdfasdadadadfasdfasdasdfasd
						</p>
					</li>
					<button class="preview_btn play">Play</button>
					<button class="preview_btn detail">Detail</button>
				</ul>
			</div>
			<div id="previewWrap">
				<video id="preview" autoplay loop poster="/img/spider.jpg">
					<source src="/video/spider.mp4" type="video/mp4">
				</video>
			</div>
		</div>
	</div>
	</main>
</body>
</html>