<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>boardForm</title>

<link rel="stylesheet" href="/css/quill.snow.css">
<link rel="canonical"
	href="https://quilljs.com/standalone/full/3_full.html">
<link type="application/atom+xml" rel="alternate"
	href="https://quilljs.com/feed.xml"
	title="Quill - Your powerful rich text editor" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/monokai-sublime.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="/css/boardForm.css">
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<main id="content">
	<div id="bg">
		<div id="boardForm">
			<h2>글쓰기</h2>
			<i class="fas fa-times-circle"></i>
			<form action="">
				<div id="standalone-container">
					<div id="toolbar-container">
						<span class="ql-formats"> <select class="ql-font"></select>
							<select class="ql-size"></select>
						</span> <span class="ql-formats">
							<button class="ql-bold"></button>
							<button class="ql-italic"></button>
							<button class="ql-underline"></button>
							<button class="ql-strike"></button>
						</span> <span class="ql-formats">
							<button class="ql-header" value="1"></button>
							<button class="ql-header" value="2"></button>
							<button class="ql-blockquote"></button>
							<button class="ql-code-block"></button>
						</span> <span class="ql-formats">
							<button class="ql-list" value="ordered"></button>
							<button class="ql-list" value="bullet"></button>
							<button class="ql-indent" value="-1"></button>
							<button class="ql-indent" value="+1"></button>
						</span> <span class="ql-formats">
							<button class="ql-direction" value="rtl"></button> <select
							class="ql-align"></select>
						</span> <span class="ql-formats">
							<button class="ql-image"></button>
						</span> </span>
					</div>
					<div id="editor-container">
						<!--내용 들어가는 부분-->
					</div>
				</div>
				<button id="boardFormBtn">등록</button>
			</form>
		</div>
	</div>
	</main>
	<script src="/js/quill.min.js"></script>
	<script>
		let quill = new Quill('#editor-container', {
			modules : {
				toolbar : '#toolbar-container'
			},
			placeholder : '내용을 입력해주세요',
			theme : 'snow'
		});
	</script>
</body>
</html>