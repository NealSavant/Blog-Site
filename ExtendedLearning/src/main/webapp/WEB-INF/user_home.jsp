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

	<main>

		<div class= "nav-wrapper">

			<jsp:include page="shared_jsp/nav.jsp" />
		</div>
	<c:if test="${not empty profile.image.imageUrl}">
		<div class ="user-home">
			<img alt="image" src="${profile.image.imageUrl}" width="300px" height="300px"><br>
			
			
			<a>Username: ${profile.user.username }</a>
			
			<a>First Name: ${profile.firstName }</a>
		
			<a>Last Name: ${profile.lastName }</a>
			
			<a>Email: ${profile.email }</a><br>
			
			<a>Job Title: ${profile.jobTitle }</a>
			
			<a>Biography: ${profile.about }</a>
			
			<form action = "showUpdateAccount.do" method = "POST">
				<button type = "submit" class ="btn btn-info">Update Account</button>
			</form>
		</div>
		</c:if>
		

	</main>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>