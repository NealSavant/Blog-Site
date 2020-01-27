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
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<c:if test="${not empty topics}">
		<c:forEach var="topic" items="${topics}">
		<form action="showAllTopics.do">
			<div class="card w-50">
		  <div class="card-body">
		    <h5 class="card-title">${topic.title }</h5>
		    <p class="card-text">Content: </p>
		    <a href="#" class="btn btn-primary">Button</a>
		  </div>
		</div>
		
		</form>
		</c:forEach>
		</c:if>
	</div>






	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>