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

	<article class="containergrid">


		<jsp:include page="shared_jsp/nav.jsp" />


		<div class="main-container">
			<c:if test="${otherProfile != null}">
				<div class="profile-info">
					<div class="profile-image">
						<img alt="image" src="${otherProfile.image.imageUrl}" width="300px"
							height="300px">
					</div>

					<a>Username: ${otherProfile.user.username }</a> <a>First Name:
						${otherProfile.firstName }</a> <a>Last Name: ${otherProfile.lastName }</a> <a>Email:
						${otherProfile.email }</a> <br> <a>Job Title: ${otherProfile.jobTitle }</a>
					<a>Biography: ${otherProfile.about }</a>

				</div>
			</c:if>
		</div>



	</article>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>