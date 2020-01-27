<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extended Learning</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
</head>
<body>
	<header class="main-header">
		<jsp:include page="shared_jsp/header.jsp" />
	</header>

	<div class="nav-wrapper">

		<jsp:include page="shared_jsp/nav.jsp" />
	</div>

	<div class="main-container">
		<div class="cards"">


			<h3>${topic.title}</h3>
			<p>${topic.contents}</p>
			<p>Created: ${topic.createdAt}</p>
		</div>

	</div>






	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>