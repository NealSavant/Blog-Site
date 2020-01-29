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

	<!-- HEADER -->
	<jsp:include page="shared_jsp/header.jsp" />

		<div class="container">
			<div class="jumbotron">
  				<h1 class="display-4">Welcome to SD ELP!</h1>
  				<p class="lead">SD ELP was created as a resource for Skill Distillery graduates to quickly find information on topics both from and outside of the full stack boot camp.</p>
  				<hr class="my-4">
  				<p>Information is accessible without logging in, but we would love to have you as a user!</p>
  				<a class="btn btn-primary btn-lg" href="showLogin.do" role="button">Log In</a>
			</div>
		</div>






	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>